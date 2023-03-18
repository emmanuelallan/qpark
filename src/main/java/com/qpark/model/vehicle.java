package com.qpark.model;

public class Vehicle {
    private int id;
    private String brand;
    private String image;
    private String color;
    private String plate;
    private String type;
    private String driver_id;

    public Vehicle(int id, String brand, String image, String color, String plate, String type, String driver_id) {
        this.id = id;
        this.brand = brand;
        this.image = image;
        this.color = color;
        this.plate = plate;
        this.type = type;
        this.driver_id = driver_id;
    }

    // Getters and setters
    public int getId(){ return id; }

    public void setId(int id) { this.id = id; }

    public String getBrand() {
        return brand;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getPlate() {
        return plate;
    }

    public void setPlate(String plate) {
        this.plate = plate;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getDriver_id() {
        return driver_id;
    }


    public void setDriver_id(String driver_id) {
        this.driver_id = driver_id;
    }

    @Override
    public String toString() {
        return "Driver{" +
                "id=" + id +
                ", name='" + brand + '\'' +
                ", avatar='" + image + '\'' +
                ", email='" + color + '\'' +
                ", phone='" + plate + '\'' +
                ", drivingLicence='" + driver_id + '\'' +
                '}';
    }
}
