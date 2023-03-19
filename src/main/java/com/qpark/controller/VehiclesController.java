package com.qpark.controller;

import com.qpark.DatabaseConnection;
import com.qpark.dao.VehicleDAO;
import com.qpark.model.Vehicle;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.UUID;

@WebServlet(name = "VehiclesController", value = "/vehicles/*")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10,      // 10MB
        maxRequestSize = 1024 * 1024 * 50    // 50MB
)
public class VehiclesController extends HttpServlet {
    private VehicleDAO vehicleDAO;

    public void init() throws ServletException {
        super.init();

        try {
            Connection connection = DatabaseConnection.getConnection();
            vehicleDAO = new VehicleDAO(connection);
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
                    addVehicle(request, response);
                    break;
                case "/update":
                    editVehicle(request, response);
                    break;
                case "/delete":
                    deleteVehicle(request, response);
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
                listVehiclesByDriver(request, response);
            }else {
                switch (action) {
                    case "/":
                        listVehiclesByDriver(request, response);
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

    private void listVehiclesByDriver(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        int driverId = Integer.parseInt(request.getParameter("driver"));
        List<Vehicle> listVehicles = vehicleDAO.selectVehiclesByDriverId(driverId);
        request.setAttribute("listVehicles", listVehicles);
        request.setAttribute("driverId", driverId);
        request.getRequestDispatcher("/views/vehicles.jsp").forward(request, response);
    }
    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("driverId", request.getParameter("driver"));
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/add_vehicle.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        int driverId = Integer.parseInt(request.getParameter("driver"));
        Vehicle existingVehicle = vehicleDAO.findById(id);
        request.setAttribute("vehicle", existingVehicle);
        request.setAttribute("driverId", driverId);
        request.getRequestDispatcher("/views/edit_vehicle.jsp").forward(request, response);
    }

    private void addVehicle(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        String brand = request.getParameter("brand");
        String color = request.getParameter("color");
        String plate = request.getParameter("plate");
        String type = request.getParameter("type");
        int driver = Integer.parseInt(request.getParameter("driver"));

        // Handle Image Upload
        Part filePart = request.getPart("file_upload");
        String fileName = filePart.getSubmittedFileName();
        String fileExtension = fileName.substring(fileName.lastIndexOf("."));
        String image = UUID.randomUUID() + fileExtension;
        String savePath = getServletContext().getRealPath("/uploads") + File.separator + image;
        System.out.println(savePath);
        new File(savePath);
        filePart.write(savePath);

        Vehicle newVehicle = new Vehicle(1, brand, image, color, plate, type, driver);
        vehicleDAO.create(newVehicle);
        response.sendRedirect(request.getContextPath() + "/vehicles" + "?success=create" + "&driver=" + driver);
    }

    private void editVehicle(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        String brand = request.getParameter("brand");
        String color = request.getParameter("color");
        String plate = request.getParameter("plate");
        String type = request.getParameter("type");
        int driver = Integer.parseInt(request.getParameter("driver"));
        String image;

        // Handle image upload
        Part filePart = request.getPart("file_upload");
        if(filePart.getSize() <= 0 || filePart.getSubmittedFileName().equals("")){
            Vehicle currentVehicle = vehicleDAO.findById(id);
            image = currentVehicle.getImage();
        }else{
            String fileName = filePart.getSubmittedFileName();
            String fileExtension = fileName.substring(fileName.lastIndexOf("."));
            image = UUID.randomUUID() + fileExtension;
            String savePath = getServletContext().getRealPath("/uploads") + File.separator + image;
            System.out.println(savePath);
            new File(savePath);
            filePart.write(savePath);
        }

        Vehicle vehicle = new Vehicle(id, brand, image, color, plate, type, driver);
        vehicleDAO.update(vehicle);
        response.sendRedirect(request.getContextPath() + "/vehicles" + "?success=update" + "&driver=" + driver);
    }

    private void deleteVehicle(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        int driver = Integer.parseInt(request.getParameter("driver"));
        vehicleDAO.delete(id);
        response.sendRedirect(request.getContextPath() + "/vehicles" + "?success=delete" + "&driver=" + driver);
    }
}
