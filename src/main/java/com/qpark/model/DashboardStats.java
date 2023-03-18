package com.qpark.model;

public class DashboardStats {

    private int numBookings;
    private double totalAmount;
    private int numDrivers;
    private int numParkingAreas;

    public DashboardStats(int numBookings, double totalAmount, int numDrivers, int numParkingAreas) {
        this.numBookings = numBookings;
        this.totalAmount = totalAmount;
        this.numDrivers = numDrivers;
        this.numParkingAreas = numParkingAreas;
    }

    public int getNumBookings() {
        return numBookings;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public int getNumDrivers() {
        return numDrivers;
    }

    public int getNumParkingAreas() {
        return numParkingAreas;
    }
}

