package com.qpark.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "BookingsController", value = "/booking")
public class BookingsController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/views/booking.jsp").forward(request, response);
    }
}
@RestController
@RequestMapping("/api/bookings")
public class BookingController {
    
    @Autowired
    private BookingDAO bookingDAO;
    
    @PostMapping("")
    public ResponseEntity<String> createBooking(@RequestBody Booking booking) {
        bookingDAO.save(booking);
        return new ResponseEntity<>("Booking created successfully", HttpStatus.CREATED);
    }
    
    @GetMapping("/{id}")
    public ResponseEntity<Booking> getBooking(@PathVariable("id") int id) {
        Booking booking = bookingDAO.findById(id);
        if (booking == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(booking, HttpStatus.OK);
    }
    
    @GetMapping("")
    public ResponseEntity<List<Booking>> getAllBookings() {
        List<Booking> bookings = bookingDAO.findAll();
        return new ResponseEntity<>(bookings, HttpStatus.OK);
    }
    
    @PutMapping("/{id}/status")
    public ResponseEntity<String> updateBookingStatus(@PathVariable("id") int id, @RequestParam("status") String status) {
        Booking booking = bookingDAO.findById(id);
        if (booking == null) {
            return new ResponseEntity<>("Booking not found
