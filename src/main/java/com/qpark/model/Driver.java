package com.qpark.model;

public class Driver {
    private int id;
    private String name;
    private String avatar;
    private String email;
    private String phone;
    private String drivingLicence;
    private String otp;

    public Driver(int id, String name, String avatar, String email, String phone, String drivingLicence, String otp) {
        this.id = id;
        this.name = name;
        this.avatar = avatar;
        this.email = email;
        this.phone = phone;
        this.drivingLicence = drivingLicence;
        this.otp = otp;
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

