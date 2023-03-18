package com.qpark.model;

public class Vehicle {
    private int id;
    private String brand;
    private String image;
    private String color;
    private String plate;
    private String type;
    private int driverId;

    public Vehicle(int id, String brand, String image, String color, String plate, String type, int driverId) {
        this.id = id;
        this.brand = brand;
        this.image = image;
        this.color = color;
        this.plate = plate;
        this.type = type;
        this.driverId = driverId;
    }

    // Getters and setters
    public int getId(){ return id; }

    public void setId(int id) { this.id = id; }

    public String getBrand(){ return brand; }

    public void setBrand(String brand) { this.brand = brand; }

    public String getImage(){ return image; }

    public void setImage(String image) { this.image = image; }

    public String getColor(){ return color; }

    public void setColor(String color) { this.color = color; }

    public String getPlate(){ return plate; }

    public void setPlate(String plate) { this.plate = plate; }

    public String getType(){ return type; }

    public void setType(String type) { this.type = type; }

    public int getDriverId(){ return driverId; }

    public void setDriverId(int driverId) { this.driverId = driverId; }
}
