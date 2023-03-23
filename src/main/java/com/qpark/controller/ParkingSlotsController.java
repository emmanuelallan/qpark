package com.qpark.controller;

import com.qpark.DatabaseConnection;
import com.qpark.dao.*;
import com.qpark.model.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Time;
import java.util.List;
import java.util.UUID;

@WebServlet(name = "ParkingSlotsController", value = "/parking_slot/*")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10,      // 10MB
        maxRequestSize = 1024 * 1024 * 50    // 50MB
)
public class ParkingSlotsController extends HttpServlet {

    private ParkingAreaDAO parkingAreaDAO;
    private DriverDAO driverDAO;
    private ParkingSlotDAO parkingSlotDAO;
    private VehicleDAO VehicleDAO;
    private BookingDAO bookingDAO;

    public void init() throws ServletException {
        super.init();

        try {
            Connection connection = DatabaseConnection.getConnection();
            parkingAreaDAO = new ParkingAreaDAO(connection);
            driverDAO = new DriverDAO(connection);
            parkingSlotDAO = new ParkingSlotDAO(connection);
            VehicleDAO = new VehicleDAO(connection);
            bookingDAO = new BookingDAO(connection);
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
                case "/booking":
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
        int driverId = Integer.parseInt(request.getParameter("driverId") == null ? "0" : request.getParameter("driverId"));
        int parkingSlotId = Integer.parseInt(request.getParameter("parkingSlotId") == null ? "0" : request.getParameter("parkingSlotId"));
        int vehicleId = Integer.parseInt(request.getParameter("vehicleId") == null ? "0" : request.getParameter("vehicleId"));
        if(driverId != 0 && parkingSlotId != 0 && vehicleId != 0){
            Time checkIn = Time.valueOf(request.getParameter("checkIn") + ":00");
            int bookingDuration = Integer.parseInt(request.getParameter("bookingDuration"));
            ParkingArea parkingArea = parkingAreaDAO.findById(Integer.parseInt(request.getParameter("parkingAreaId")));
            BigDecimal price = parkingArea.getPrice();
            BigDecimal total = price.multiply(BigDecimal.valueOf(bookingDuration));
            int delay = 0;
            BigDecimal fine = BigDecimal.valueOf(0.00);
            String status = "Active";
            String paymentStatus = "Payed";
            Booking booking = new Booking(1, parkingSlotId, vehicleId, driverId, total, checkIn, checkIn, delay, fine, status, paymentStatus, bookingDuration);
            // change status of parking slot
            bookingDAO.create(booking);
            parkingSlotDAO.changeStatus(parkingSlotId, "booked");

            response.sendRedirect(request.getContextPath() + "/parking_slot?id=" + parkingArea.getId() + "&success=booked");
        }else{
            // drive info
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String drivingLicense = request.getParameter("drivingLicence");
            String otp = request.getParameter("otp");
            String avatar = request.getParameter("avatar");
            System.out.println(name);
            System.out.println(email);
            System.out.println(phone);
            System.out.println(drivingLicense);
            System.out.println(otp);
            System.out.println(avatar);
            String driverImage = handleImageUpload(request, avatar);

            // vehicle info
            String brand = request.getParameter("brand");
            String color = request.getParameter("color");
            String plate = request.getParameter("plate");
            String type = request.getParameter("type");
            String image = request.getParameter("image");
            System.out.println(image);
            String VehicleImage = handleImageUpload(request, image);

            // booking info
            Time checkIn = Time.valueOf(request.getParameter("checkIn"));
            int bookingDuration = Integer.parseInt(request.getParameter("bookingDuration"));
            ParkingArea parkingArea = parkingAreaDAO.findById(Integer.parseInt(request.getParameter("parkingAreaId")));

            Driver driver = driverDAO.create(new Driver(1, name, driverImage, email, phone, drivingLicense, otp));
            Vehicle vehicle = VehicleDAO.create(new Vehicle(1, brand, VehicleImage, color, plate, type, driver.getId()));

            BigDecimal price = parkingArea.getPrice();
            BigDecimal total = price.multiply(BigDecimal.valueOf(bookingDuration));
            int delay = 0;
            BigDecimal fine = BigDecimal.valueOf(0.00);
            String status = "Active";
            String paymentStatus = "Payed";
            Booking booking = new Booking(1, parkingSlotId, vehicle.getId(), driver.getId(), total, checkIn, checkIn, delay, fine, status, paymentStatus, bookingDuration);
            bookingDAO.create(booking);

            response.sendRedirect(request.getContextPath() + "/parking_slot?id=" + parkingArea.getId() + "&success=booked");
        }
    }

    private void searchDriverByLicence(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String drivingLicence = request.getParameter("drivingLicense");
        int parkingAreaId = Integer.parseInt(request.getParameter("parkingAreaId"));
        Driver driver = driverDAO.findByLicence(drivingLicence);
        if (driver == null) {
            response.sendRedirect(request.getContextPath() + "/parking_slot?id=" + parkingAreaId + "&error=not_found");
        } else {
            List<Vehicle> vehicles = VehicleDAO.selectVehiclesByDriverId(driver.getId());
            ParkingArea parkingArea = parkingAreaDAO.findById(parkingAreaId);
            List<ParkingSlot> parkingSlots = parkingSlotDAO.getParkingSlotsByParkingArea(parkingAreaId);
            request.setAttribute("driver", driver);
            request.setAttribute("parkingArea", parkingArea);
            request.setAttribute("parkingSlots", parkingSlots);
            request.setAttribute("vehicles", vehicles);
            request.getRequestDispatcher("/views/parking_slot.jsp").forward(request, response);
        }
    }

    private String handleImageUpload(HttpServletRequest request, String input) throws IOException, ServletException {
        Part filePart = request.getPart(input);
        String fileName = filePart.getSubmittedFileName();
        String fileExtension = fileName.substring(fileName.lastIndexOf("."));
        String image = UUID.randomUUID() + fileExtension;
        String savePath = getServletContext().getRealPath("/uploads") + File.separator + image;
        new File(savePath);
        filePart.write(savePath);

        return image;
    }
}
