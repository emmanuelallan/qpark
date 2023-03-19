package com.qpark.dao;

import com.qpark.model.Admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminDAO {
	private final Connection connection;
	public AdminDAO(Connection connection) {
        this.connection = connection;
    }

    public Admin login(String email, String password) throws SQLException {
        String sql = "SELECT * FROM admins WHERE email = ? AND password = ?";
        PreparedStatement stmt = connection.prepareStatement(sql);
        stmt.setString(1, email);
        stmt.setString(2, password);
        ResultSet rs = stmt.executeQuery();
        Admin admin = null;

        if(rs.next()) {
            admin = new Admin(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("email"),
                    rs.getString("password")
            );
        }
        rs.close();
        stmt.close();
        return admin;
    }
}
