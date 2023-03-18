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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getDrivingLicence() {
        return drivingLicence;
    }

    public String getOtp() {
        return otp;
    }

    public void setDrivingLicence(String drivingLicence) {
        this.drivingLicence = drivingLicence;
    }

    public void setOtp(String otp) {
        this.otp = otp;
    }

    @Override
    public String toString() {
        return "Driver{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", avatar='" + avatar + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", drivingLicence='" + drivingLicence + '\'' +
                ", otp='" + otp + '\'' +
                '}';
    }
}
