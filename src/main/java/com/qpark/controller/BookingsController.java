package com.qpark.controller;

import com.qpark.DatabaseConnection;
import com.qpark.dao.BookingDAO;
import com.qpark.dao.DriverDAO;
import com.qpark.dao.ParkingAreaDAO;
import com.qpark.dao.ParkingSlotDAO;
import com.qpark.model.Booking;
import com.qpark.model.Driver;
import com.qpark.model.ParkingArea;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "BookingsController", value = "/booking")
public class BookingsController extends HttpServlet {
    private BookingDAO bookingDAO;
    private ParkingSlotDAO parkingSlotDAO;

    public void init() throws ServletException {
        super.init();

        try {
            Connection connection = DatabaseConnection.getConnection();
            bookingDAO = new BookingDAO(connection);
            parkingSlotDAO = new ParkingSlotDAO(connection);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Booking> bookingList = bookingDAO.findAll();
            request.setAttribute("bookingList", bookingList);
            request.getRequestDispatcher("/views/booking.jsp").forward(request, response);
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String status = request.getParameter("status");
            int id = Integer.parseInt(request.getParameter("bookingId"));
            int parkingSlotId = Integer.parseInt(request.getParameter("parkingSlotId"));

            bookingDAO.updateStatus(id, status);
            parkingSlotDAO.changeStatus(parkingSlotId, status);
            response.sendRedirect(request.getContextPath() + "/booking?id" + "&success=1");
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }
}