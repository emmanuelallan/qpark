package com.qpark.dao;
import com.qpark.model.Driver;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DriverDAO {
    private final Connection connection;

    public DriverDAO(Connection connection) {
        this.connection = connection;
    }

    public void create(Driver driver) throws SQLException {
        String sql = "INSERT INTO drivers (name, avatar, email, phone, driving_licence, otp) VALUES (?, ?, ?, ?, ?, ?)";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, driver.getName());
        statement.setString(2, driver.getAvatar());
        statement.setString(3, driver.getEmail());
        statement.setString(4, driver.getPhone());
        statement.setString(5, driver.getDrivingLicence());
        statement.setString(6, driver.getOtp());
        statement.executeUpdate();
        statement.close();
    }

    public void update(Driver driver) throws SQLException {
        String sql = "UPDATE drivers SET name = ?, avatar = ?, email = ?, phone = ?, driving_licence = ?, otp = ? WHERE id = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, driver.getName());
        statement.setString(2, driver.getAvatar());
        statement.setString(3, driver.getEmail());
        statement.setString(4, driver.getPhone());
        statement.setString(5, driver.getDrivingLicence());
        statement.setString(6, driver.getOtp());
        statement.setInt(7, driver.id);
        statement.executeUpdate();
        statement.close();
    }

    public void delete(int id) throws SQLException {
        String sql = "DELETE FROM drivers WHERE id = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, id);
        statement.executeUpdate();
        statement.close();
    }

    public Driver findById(int id) throws SQLException {
        String sql = "SELECT * FROM drivers WHERE id = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, id);
        ResultSet resultSet = statement.executeQuery();
        Driver driver = null;
        if (resultSet.next()) {
            driver = new Driver(
                    resultSet.getInt("id"),
                    resultSet.getString("name"),
                    resultSet.getString("avatar"),
                    resultSet.getString("email"),
                    resultSet.getString("phone"),
                    resultSet.getString("driving_licence"),
                    resultSet.getString("password")
            );
        }
        resultSet.close();
        statement.close();
        return driver;
    }

    public List<Driver> findAll() throws SQLException {
        String sql = "SELECT * FROM drivers";
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(sql);
        List<Driver> drivers = new ArrayList<>();
        while (resultSet.next()) {
            Driver driver = new Driver(
                    resultSet.getInt("id"),
                    resultSet.getString("name"),
                    resultSet.getString("avatar"),
                    resultSet.getString("email"),
                    resultSet.getString("phone"),
                    resultSet.getString("driving_licence"),
                    resultSet.getString("password")
            );
            drivers.add(driver);
        }
        resultSet.close();
        statement.close();
        return drivers;
    }
}

