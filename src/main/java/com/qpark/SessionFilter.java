package com.qpark;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "SessionFilter", urlPatterns = {"/*"})
public class SessionFilter implements Filter {
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
            throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;

        // Check if the requested URL matches the excluded patterns
        String path = request.getRequestURI().substring(request.getContextPath().length());
        if (path.equals("/") || path.startsWith("/parking_slot")) {
            chain.doFilter(request, response);
            return;
        }

        if (request.getMethod().equalsIgnoreCase("POST")) {
            chain.doFilter(request, response);
            return;
        }

        // Check if the admin is logged in
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            request.getRequestDispatcher("/views/login.jsp").forward(request, response);
            return;
        }

        // The admin is logged in, so proceed with the request
        chain.doFilter(request, response);
    }
}
