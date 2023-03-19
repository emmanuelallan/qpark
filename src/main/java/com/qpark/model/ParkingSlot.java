package com.qpark.model;


public class ParkingSlot{
    private int id;
    private int parkingAreaId;
    private String name;
    private String status;

    public ParkingSlot(int id, int parkingAreaId, String name, String status) {
        this.id = id;
        this.parkingAreaId = parkingAreaId;
        this.name = name;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getParkingAreaId() {
        return parkingAreaId;
    }

    public void setParkingAreaId(int parkingAreaId) {
        this.parkingAreaId = parkingAreaId;
    }
    
    public String getName() {
        return name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    public String getStatus() {
        return status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
}
