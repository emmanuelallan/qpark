package com.qpark.model;

import java.math.BigDecimal;
import java.sql.Time;

public class Booking {
    private int id;
    private int parkingSlotId;
    private int vehicleId;
    private int currentDriverId;
    private Time checkIn;
    private Time checkOut;
    private Time delay;
    private BigDecimal amount;
    private BigDecimal fine;
    private String status;
    private String paymentStatus;
    private Time bookingDuration;

    public Booking(int id, int parkingSlotId, int vehicleId, int currentDriverId, BigDecimal amount, Time checkIn, Time checkOut, Time delay, BigDecimal fine, String status, String paymentStatus, Time bookingDuration) {
        this.id = id;
        this.parkingSlotId = parkingSlotId;
        this.vehicleId = vehicleId;
        this.currentDriverId = currentDriverId;
        this.checkIn = checkIn;
        this.checkOut = checkOut;
        this.delay = delay;
        this.amount = amount;
        this.fine = fine;
        this.status = status;
        this.paymentStatus = paymentStatus;
        this.bookingDuration = bookingDuration;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getParkingSlotId() {
        return parkingSlotId;
    }

    public void setParkingSlotId(int parkingSlotId) {
        this.parkingSlotId = parkingSlotId;
    }

    public int getVehicleId() {
        return vehicleId;
    }

    public void setVehicleId(int vehicleId) {
        this.vehicleId = vehicleId;
    }

    public int getCurrentDriverId() {
        return currentDriverId;
    }

    public void setCurrentDriverId(int currentDriverId) {
        this.currentDriverId = currentDriverId;
    }

    public Time getCheckIn() {
        return checkIn;
    }

    public void setCheckIn(Time checkIn) {
        this.checkIn = checkIn;
    }

    public Time getCheckOut() {
        return checkOut;
    }

    public void setCheckOut(Time checkOut) {
        this.checkOut = checkOut;
    }

    public Time getDelay() {
        return delay;
    }

    public void setDelay(Time delay) {
        this.delay = delay;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public BigDecimal getFine() {
        return fine;
    }

    public void setFine(BigDecimal fine) {
        this.fine = fine;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(String paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    public Time getBookingDuration() {
        return bookingDuration;
    }

    public void setBookingDuration(Time bookingDuration) {
        this.bookingDuration = bookingDuration;
    }
}
