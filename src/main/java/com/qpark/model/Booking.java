package com.qpark.model;

public class Booking {
    private int id;
    private String carNumber;
    private String name;
    private String email;
    private Date startDateTime;
    private Date endDateTime;
    private int status;

    public Booking(int id, String carNumber, String name, String email, Date startDateTime, Date endDateTime, int status) {
        this.id = id;
        this.carNumber = carNumber;
        this.name = name;
        this.email = email;
        this.startDateTime = startDateTime;
        this.endDateTime = endDateTime;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public String getCarNumber() {
        return carNumber;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public Date getStartDateTime() {
        return startDateTime;
    }

    public Date getEndDateTime() {
        return endDateTime;
    }

    public int getStatus() {
        return status;
    }
}
