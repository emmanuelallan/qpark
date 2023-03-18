package com.qpark.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

import com.qpark.dao.AdminDAO;
import com.qpark.model.Admin;
import com.qpark.model.DashboardStats;

@WebServlet(name = "AdminsController", value = "/admin")
public class AdminsController extends HttpServlet {
	
    
	
	 protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
		 
		  String action = request.getServletPath();

	        switch (action) {
	            case "/logout":
	                logout(request, response);
	                break;
	            // ...
	            default:
	                showLoginForm(request, response);
	                break;
	        }
		 
	        HttpSession session = request.getSession();
	        Admin admin = (Admin) session.getAttribute("admin");
	        
	        if (admin != null) {
	        	try {
					showDashboard(request, response);
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (ServletException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	        	//request.getRequestDispatcher("/views/dashboard.jsp").forward(request, response);
	        } else {
	            request.getRequestDispatcher("/views/login.jsp").forward(request, response);
	        }
	    }
	 
	   protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        String email = request.getParameter("email");
	        String password = request.getParameter("password");
	        
	        if (email == null || email.isEmpty() || password == null || password.isEmpty()) {
	            request.setAttribute("errorMessage", "Please enter both email and password.");
	            request.getRequestDispatcher("/views/login.jsp").forward(request, response);
	            return;
	        }
	        
	        try {
	        	AdminDAO adminDAO = new AdminDAO();
				if (adminDAO.checkAdminCredentials(email, password)) {
				    // Set session variable to indicate that the user is logged in
				    HttpSession session = request.getSession();
				    Admin admin = new Admin(email, password);
				    session.setAttribute("admin", admin);
				    
				    // Redirect to the dashboard page
				    showDashboard(request, response);
				   // request.getRequestDispatcher("/views/dashboard.jsp").forward(request, response);
				
				} else {
				    // Display error message to the user
				    request.setAttribute("errorMessage", "Wrong email or password.");
				    request.getRequestDispatcher("views/login.jsp").forward(request, response);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
	   }
	   
	   protected void showLoginForm(HttpServletRequest request, HttpServletResponse response)
		        throws ServletException, IOException {
		    request.getRequestDispatcher("/views/login.jsp").forward(request, response);
		}
	   
	   private void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        request.getSession().invalidate();
	        
		    request.getRequestDispatcher("views/login.jsp").forward(request, response);
	    }
	   
	    private void showDashboard(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException, SQLException {
	        // Fetch statistics from database
	    	AdminDAO adminDAO = new AdminDAO();
	        DashboardStats stats;
	        try {
	            stats = adminDAO.getDashboardStats();
	        } catch (SQLException e) {
	            throw new ServletException("Error fetching dashboard statistics", e);
	        }

	        // set the statistics as an attribute of the request object
	        request.setAttribute("stats", stats);

	        request.getRequestDispatcher("/views/dashboard.jsp").forward(request, response);
	    }

}
