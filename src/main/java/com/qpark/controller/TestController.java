package com.qpark.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Time;

@WebServlet(name = "TestController", value = "/test/*")
public class TestController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        if(request.getPathInfo().equals("/add")) {
            String name = request.getParameter("name");
            int age = Integer.parseInt(request.getParameter("age"));
            Time time = Time.valueOf(request.getParameter("time") + ":00");

            response.getWriter().println("Name: " + name);
            response.getWriter().println("Age: " + age);
            response.getWriter().println("Time: " + time);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("/views/test.jsp").forward(request, response);
    }
}
