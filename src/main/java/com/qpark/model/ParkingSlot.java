package com.qpark.model;


public class ParkingSlot{
    private int parkingAreaId;
    private String slotName;
    private String status;

    
    public ParkingSlot(int parkingAreaId, String slotName, String status) {
        this.parkingAreaId = parkingAreaId;
        this.slotName = slotName;
        this.status = status;
    }
    

    public int getParkingAreaId() {
    	ParkingArea parking = new ParkingArea();
    	parkingAreaId = parking.getId();
        return parkingAreaId;
    }
    
    public String getSlotNumber() {
        return slotName;
    }
    
    public void setSlotNumber(String slotName) {
        this.slotName = slotName;
    }
    
    public String getStatus() {
        return status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
    
    public void bookSlot() {
        this.status = "booked";
    }
    
    public void unbookSlot() {
        this.status = "unbooked";
    }
}
