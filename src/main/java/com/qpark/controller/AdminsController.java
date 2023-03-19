package com.qpark.controller;

import com.qpark.DatabaseConnection;
import com.qpark.dao.AdminDAO;
import com.qpark.dao.BookingDAO;
import com.qpark.dao.DriverDAO;
import com.qpark.dao.ParkingAreaDAO;
import com.qpark.model.Admin;
import com.qpark.model.Booking;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Objects;

@WebServlet(name = "AdminsController", value = "/admin/*")
public class AdminsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AdminDAO adminDAO;
	private BookingDAO bookingDAO;
	private ParkingAreaDAO parkingAreaDAO;
	private DriverDAO driverDAO;
	public void init() throws ServletException {
		super.init();

		try {
			Connection connection = DatabaseConnection.getConnection();
			adminDAO = new AdminDAO(connection);
			bookingDAO = new BookingDAO(connection);
			parkingAreaDAO = new ParkingAreaDAO(connection);
			driverDAO = new DriverDAO(connection);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			throw new RuntimeException(e);
		}
	}

	 protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
		  String action = request.getPathInfo();

		  try {
			  if(action == null) {
				  showDashboard(request, response);
			  }else{
				  if (action.equals("/logout")) {
					  logout(request, response);
				  } else {
					  showLoginForm(request, response);
				  }
			  }
		  } catch (SQLException | ClassNotFoundException e) {
			  e.printStackTrace();
		  }
	    }
	 
	   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String action = request.getPathInfo();

	        try {
				if (action.equals("/login")) {
					login(request, response);
				} else {
					response.sendError(HttpServletResponse.SC_BAD_REQUEST);
				}
	        } catch (SQLException | ClassNotFoundException ex) {
	            throw new ServletException(ex);
	        }
	    }

		private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, ClassNotFoundException {
	        Admin admin = adminDAO.login(request.getParameter("email"), request.getParameter("password"));
			if (admin != null) {
				HttpSession session = request.getSession();
				session.setAttribute("admin", admin);

				showDashboard(request, response);
	        } else {
	            request.setAttribute("error", "Incorrect email or password.");
	            request.getRequestDispatcher("/views/login.jsp").forward(request, response);
	        }
	    }

	   protected void showLoginForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		    request.getRequestDispatcher("/views/login.jsp").forward(request, response);
		}

		private void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			HttpSession session = request.getSession(false);
			if (session != null) {
				session.invalidate(); // Invalidate the session
			}
			// Redirect to the login page
			response.sendRedirect(request.getContextPath() + "/admin/login");
		}

	private void showDashboard(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException, SQLException {
			//get admin from session
			HttpSession session = request.getSession(false);
			Admin admin = (Admin) session.getAttribute("admin");

			// get latest bookings
			List<Booking> bookings = bookingDAO.getLatestBookings();

			// get bookings count
			int totalBookings = bookingDAO.getBookingCount();

			// get total amount of bookings
			BigDecimal totalAmount = bookingDAO.getTotalAmount();

			// get parking areas count
			int parkingAreasCount = parkingAreaDAO.getParkingAreaCount();

			// get drivers count
			int driversCount = driverDAO.getDriverCount();

			// send to dashboard
			request.setAttribute("admin", admin);
			request.setAttribute("bookingList", bookings);
			request.setAttribute("totalBookings", totalBookings);
			request.setAttribute("totalAmount", totalAmount);
			request.setAttribute("parkingAreasCount", parkingAreasCount);
			request.setAttribute("driversCount", driversCount);
	        request.getRequestDispatcher("/views/dashboard.jsp").forward(request, response);
	    }

}
