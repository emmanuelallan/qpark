package com.qpark.controller;

import com.qpark.DatabaseConnection;
import com.qpark.dao.ParkingAreaDAO;
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

@WebServlet(name = "ClientsController", value = "")
public class ClientsController extends HttpServlet {
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
                case "/parking_slot":
                    bookParkingSlot(request, response);
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
            if(action == null || action.isEmpty()){
                listParkingAreas(request, response);
            }else{
                switch (action) {
                    case "/":
                        listParkingAreas(request, response);
                        break;
                    case "/parking_slot":
                        viewParkingArea(request, response);
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
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }

    private void viewParkingArea(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int parkingAreaId = Integer.parseInt(request.getParameter("id"));
        ParkingArea parkingArea = parkingAreaDAO.findById(1);
        request.setAttribute("parkingArea", parkingArea);
        request.getRequestDispatcher("/views/parking_slot.jsp").forward(request, response);
    }

    private void bookParkingSlot(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int parkingAreaId = Integer.parseInt(request.getParameter("id"));
        ParkingArea parkingArea = parkingAreaDAO.findById(1);
        request.setAttribute("parkingArea", parkingArea);
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
}