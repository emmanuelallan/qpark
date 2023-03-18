package com.qpark.controller;

import com.qpark.DatabaseConnection;
import com.qpark.dao.DriverDAO;
import com.qpark.model.Driver;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.UUID;

@WebServlet(name = "DriversController", value = "/drivers/*")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10,      // 10MB
        maxRequestSize = 1024 * 1024 * 50    // 50MB
)
public class DriversController extends HttpServlet {
    private DriverDAO driverDAO;

    public void init() throws ServletException {
        super.init();

        try {
            Connection connection = DatabaseConnection.getConnection();
            driverDAO = new DriverDAO(connection);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getPathInfo();
        try {
            switch (action) {
                case "/add":
                    addDriver(request, response);
                    break;
                case "/update":
                    editDriver(request, response);
                    break;
                case "/delete":
                    deleteDriver(request, response);
                    break;
                default:
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getPathInfo();
        try {
            if(action == null){
                listDrivers(request, response);
            }else{
                switch (action) {
                    case "/":
                        listDrivers(request, response);
                        break;
                    case "/new":
                        showNewForm(request, response);
                        break;
                    case "/edit":
                        showEditForm(request, response);
                        break;
                    default:
                        response.sendError(HttpServletResponse.SC_BAD_REQUEST);
                        break;
                }
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listDrivers(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Driver> driversList = driverDAO.findAll();
        request.setAttribute("driversList", driversList);
        request.getRequestDispatcher("/views/drivers.jsp").forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/views/add_driver.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int driverId = Integer.parseInt(request.getParameter("id"));
        Driver driver = driverDAO.findById(driverId);
        request.setAttribute("driver", driver);
        request.getRequestDispatcher("/views/edit_driver.jsp").forward(request, response);
    }

    private void addDriver(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String drivingLicence = request.getParameter("drivingLicence");
        String otp = request.getParameter("otp");

        // Handle image upload
        Part filePart = request.getPart("file_upload");
        String fileName = filePart.getSubmittedFileName();
        String fileExtension = fileName.substring(fileName.lastIndexOf("."));
        String avatar = UUID.randomUUID() + fileExtension;
        String savePath = getServletContext().getRealPath("/uploads") + File.separator + avatar;
        System.out.println(savePath);
        new File(savePath);
        filePart.write(savePath);
        Driver newDriver = new Driver(1, name, avatar, email, phone, drivingLicence, otp);
        driverDAO.create(newDriver);
        response.sendRedirect(request.getContextPath() + "/drivers" + "?success=create");
    }

    private void editDriver(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String drivingLicence = request.getParameter("drivingLicence");
        String otp = request.getParameter("otp");
        String avatar;

        // Handle image upload
        Part filePart = request.getPart("file_upload");
        if(filePart.getSize() <= 0 || filePart.getSubmittedFileName().equals("")){
            Driver currentDriver = driverDAO.findById(id);
            avatar = currentDriver.getAvatar();
        }else{
            String fileName = filePart.getSubmittedFileName();
            String fileExtension = fileName.substring(fileName.lastIndexOf("."));
            avatar = UUID.randomUUID() + fileExtension;
            String savePath = getServletContext().getRealPath("/uploads") + File.separator + avatar;
            System.out.println(savePath);
            new File(savePath);
            filePart.write(savePath);
        }

        Driver driverToUpdate = new Driver(id, name, avatar, email, phone, drivingLicence, otp);
        driverDAO.update(driverToUpdate);
        response.sendRedirect(request.getContextPath() + "/drivers" + "?success=update");
    }

    private void deleteDriver(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        driverDAO.delete(id);
        response.sendRedirect(request.getContextPath() + "/drivers" + "?success=delete");
    }
}
