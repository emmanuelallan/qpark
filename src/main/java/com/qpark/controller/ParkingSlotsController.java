package com.qpark.controller;

import com.qpark.DatabaseConnection;
import com.qpark.dao.DriverDAO;
import com.qpark.dao.ParkingAreaDAO;
import com.qpark.dao.ParkingSlotDAO;
import com.qpark.model.Driver;
import com.qpark.model.ParkingArea;
import com.qpark.model.ParkingSlot;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "ParkingSlotsController", value = "/parking_slot/*")
public class ParkingSlotsController extends HttpServlet {

    private ParkingAreaDAO parkingAreaDAO;
    private DriverDAO driverDAO;
    private ParkingSlotDAO parkingSlotDAO;

    public void init() throws ServletException {
        super.init();

        try {
            Connection connection = DatabaseConnection.getConnection();
            parkingAreaDAO = new ParkingAreaDAO(connection);
            driverDAO = new DriverDAO(connection);
            parkingSlotDAO = new ParkingSlotDAO(connection);
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
                case "/book":
                    bookParkingSlot(request, response);
                    break;
                case "/search":
                    searchDriverByLicence(request, response);
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
            if(action == null || action.equals("/")){
                viewParkingArea(request, response);
            }else{
                response.sendError(HttpServletResponse.SC_BAD_REQUEST);
            }

        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void viewParkingArea(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int parkingAreaId = Integer.parseInt(request.getParameter("id"));
        ParkingArea parkingArea = parkingAreaDAO.findById(parkingAreaId);
        List<ParkingSlot> parkingSlots = parkingSlotDAO.getParkingSlotsByParkingArea(parkingAreaId);
        request.setAttribute("parkingArea", parkingArea);
        request.setAttribute("parkingSlots", parkingSlots);
        request.getRequestDispatcher("/views/parking_slot.jsp").forward(request, response);
    }

    private void bookParkingSlot(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int parkingAreaId = Integer.parseInt(request.getParameter("id"));
        ParkingArea parkingArea = parkingAreaDAO.findById(1);
        request.setAttribute("parkingArea", parkingArea);
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }

    private void searchDriverByLicence(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String drivingLicence = request.getParameter("drivingLicence");
        int parkingAreaId = Integer.parseInt(request.getParameter("parkingAreaId"));
        Driver driver = driverDAO.findByLicence(drivingLicence);
        System.out.println(driver);
        if (driver == null) {
            response.sendRedirect(request.getContextPath() + "/parking_slot?id=" + parkingAreaId + "&error=not_found");
        } else {
            request.setAttribute("driver", driver);
            ParkingArea parkingArea = parkingAreaDAO.findById(parkingAreaId);
            List<ParkingSlot> parkingSlots = parkingSlotDAO.getParkingSlotsByParkingArea(parkingAreaId);
            request.setAttribute("parkingArea", parkingArea);
            request.setAttribute("parkingSlots", parkingSlots);
            request.getRequestDispatcher("/views/parking_slot.jsp").forward(request, response);
        }
    }
}
