package com.qpark.controller;

import com.qpark.DatabaseConnection;
import com.qpark.dao.DriverDAO;
import com.qpark.model.Driver;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "DriversController", value = "/drivers/*")
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
                    case "/view":
                        viewDriver(request, response);
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

    private void viewDriver(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int driverId = Integer.parseInt(request.getParameter("id"));
        Driver driver = driverDAO.findById(driverId);
        request.setAttribute("driver", driver);
        request.getRequestDispatcher("/views/drivers/view.jsp").forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/views/drivers/new.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int driverId = Integer.parseInt(request.getParameter("id"));
        Driver driver = driverDAO.findById(driverId);
        request.setAttribute("driver", driver);
        request.getRequestDispatcher("/views/drivers/edit.jsp").forward(request, response);
    }

    private void addDriver(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        String name = request.getParameter("name");
        String avatar = request.getParameter("avatar");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String drivingLicence = request.getParameter("drivingLicence");
        String otp = request.getParameter("otp");
        Driver newDriver = new Driver(1, name, avatar, email, phone, drivingLicence, otp);
        driverDAO.create(newDriver);
        response.sendRedirect("list");
    }

    private void editDriver(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String avatar = request.getParameter("avatar");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String drivingLicence = request.getParameter("drivingLicence");
        String otp = request.getParameter("otp");

        Driver driverToUpdate = new Driver(id, name, avatar, email, phone, drivingLicence, otp);
        driverDAO.update(driverToUpdate);
        response.sendRedirect("list");
    }

    private void deleteDriver(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        driverDAO.delete(id);
        response.sendRedirect("list");
    }
}
