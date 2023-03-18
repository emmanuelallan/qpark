package com.qpark.model;

import java.math.BigDecimal;
import java.sql.Time;

public class ParkingArea {
    private int id;
    private int capacity;
    private String image;
    private String location;
    private BigDecimal price;
    private String name;
    private String status;
    private BigDecimal fine;
    private Time openingTime;
    private Time closingTime;

    public ParkingArea(int id, int capacity, String image, String location, BigDecimal price, String name,
                       String status, BigDecimal fine, Time openingTime, Time closingTime) {
        this.id = id;
        this.capacity = capacity;
        this.image = image;
        this.location = location;
        this.price = price;
        this.name = name;
        this.status = status;
        this.fine = fine;
        this.openingTime = openingTime;
        this.closingTime = closingTime;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
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

    public BigDecimal getFine() {
        return fine;
    }

    public void setFine(BigDecimal fine) {
        this.fine = fine;
    }

    public Time getOpeningTime() {
        return openingTime;
    }

    public void setOpeningTime(Time openingTime) {
        this.openingTime = openingTime;
    }

    public Time getClosingTime() {
        return closingTime;
    }

    public void setClosingTime(Time closingTime) {
        this.closingTime = closingTime;
    }

    @Override
    public String toString() {
        return "ParkingArea{" +
                "id=" + id +
                ", capacity=" + capacity +
                ", image='" + image + '\'' +
                ", location='" + location + '\'' +
                ", price=" + price +
                ", name='" + name + '\'' +
                ", status='" + status + '\'' +
                ", fine=" + fine +
                ", openingTime=" + openingTime +
                ", closingTime=" + closingTime +
                '}';
    }
}


