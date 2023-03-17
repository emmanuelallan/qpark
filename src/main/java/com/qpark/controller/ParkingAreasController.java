package com.qpark.controller;

import com.qpark.DatabaseConnection;
import com.qpark.dao.ParkingAreaDAO;
import com.qpark.dao.ParkingSlotDAO;
import com.qpark.model.ParkingArea;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Time;
import java.util.List;

@WebServlet(name = "ParkingAreasController", value = "/parking_area/*")
public class ParkingAreasController extends HttpServlet {
    private ParkingAreaDAO parkingAreaDAO;

    public void init() throws ServletException {
        super.init();

        try {
            Connection connection = DatabaseConnection.getConnection();
            parkingAreaDAO = new ParkingAreaDAO(connection);
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
                    addParkingArea(request, response);
                    break;
                case "/update":
                    editParkingArea(request, response);
                    break;
                case "/delete":
                    deleteParkingArea(request, response);
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
                listParkingAreas(request, response);
            }else{
                switch (action) {
                    case "/":
                        listParkingAreas(request, response);
                        break;
                    case "/view":
                        viewParkingArea(request, response);
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

    private void listParkingAreas(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<ParkingArea> parkingAreasList = parkingAreaDAO.findAll();
        request.setAttribute("parkingAreasList", parkingAreasList);
        request.getRequestDispatcher("/views/parking_area.jsp").forward(request, response);
    }

    private void viewParkingArea(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int parkingAreaId = Integer.parseInt(request.getParameter("id"));
        ParkingArea parkingArea = parkingAreaDAO.findById(1);
        request.setAttribute("parkingArea", parkingArea);
        request.getRequestDispatcher("/views/parking_slot.jsp").forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/views/add_parking_area.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int parkingAreaId = Integer.parseInt(request.getParameter("id"));
        ParkingArea parkingArea = parkingAreaDAO.findById(parkingAreaId);
        request.setAttribute("parkingArea", parkingArea);
        request.getRequestDispatcher("/views/packing_area/edit.jsp").forward(request, response);
    }

    private void addParkingArea(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int capacity = Integer.parseInt(request.getParameter("capacity"));
        String image = request.getParameter("image");
        String location = request.getParameter("location");
        BigDecimal price = new BigDecimal(request.getParameter("price"));
        String name = request.getParameter("name");
        String status = request.getParameter("status");
        BigDecimal fine = new BigDecimal(request.getParameter("fine"));
        Time opening_time = Time.valueOf(request.getParameter("opening_time"));
        Time closing_time = Time.valueOf(request.getParameter("closing_time"));
        ParkingArea newParkingArea = new ParkingArea(1, capacity, image, location, price, name, status, fine, opening_time, closing_time);
        parkingAreaDAO.create(newParkingArea);
        response.sendRedirect("list");
    }

    private void editParkingArea(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        int capacity = Integer.parseInt(request.getParameter("capacity"));
        String image = request.getParameter("image");
        String location = request.getParameter("location");
        BigDecimal price = new BigDecimal(request.getParameter("price"));
        String name = request.getParameter("name");
        String status = request.getParameter("status");
        BigDecimal fine = new BigDecimal(request.getParameter("fine"));
        Time opening_time = Time.valueOf(request.getParameter("opening_time"));
        Time closing_time = Time.valueOf(request.getParameter("closing_time"));

        ParkingArea parkingAreaToUpdate = new ParkingArea(id, capacity, image, location, price, name, status, fine, opening_time, closing_time);
        parkingAreaDAO.update(parkingAreaToUpdate);
        response.sendRedirect("/");
    }

    private void deleteParkingArea(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        parkingAreaDAO.delete(id);
        response.sendRedirect("/");
    }
}
