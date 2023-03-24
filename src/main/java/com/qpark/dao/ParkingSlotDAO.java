package com.qpark.dao;

import com.qpark.model.ParkingSlot;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class ParkingSlotDAO {
	private final Connection connection;

	public ParkingSlotDAO(Connection connection) {
		this.connection = connection;
	}

	public void create(int parkingAreaId, int capacity) throws SQLException {
	    List<ParkingSlot> parkingSlots = new ArrayList<>();

	    for (int i = 1; i <= capacity; i++) {
	        String name = "PS" + String.format("%03d", i); // generate slot name as PS001, PS002, etc.
	        ParkingSlot parkingSlot = new ParkingSlot(1, parkingAreaId, name, "unbooked");
	        parkingSlots.add(parkingSlot);
	    }
	    
	    String sql = "INSERT INTO parking_slots (parking_area_id, name, status) VALUES (?, ?, ?)";
	    PreparedStatement statement = connection.prepareStatement(sql);
	    
	    for (ParkingSlot parkingSlot : parkingSlots) {
            	statement.setInt(1, parkingSlot.getParkingAreaId());
	            statement.setString(2, parkingSlot.getName());
	            statement.setString(3, parkingSlot.getStatus());
	            
	            statement.executeUpdate();
	    }
		statement.close();
	}

	//Get parking slots by parkingAreaId
	public List<ParkingSlot> getParkingSlotsByParkingArea(int parkingAreaId) throws SQLException {
	    String sql = "SELECT * FROM parking_slots WHERE parking_area_id = ?";
	    PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, parkingAreaId);
        ResultSet rs = statement.executeQuery();
		List<ParkingSlot> parkingSlots = new ArrayList<>();
		while (rs.next()) {
			int id = rs.getInt("id");
			String name = rs.getString("name");
			String status = rs.getString("status");
			ParkingSlot parkingSlot = new ParkingSlot(id, parkingAreaId, name, status);
			parkingSlots.add(parkingSlot);
		}
		rs.close();
		statement.close();
		return parkingSlots;
	}

	// get parking slot by id
	public ParkingSlot findById(int id) throws SQLException {
	    String sql = "SELECT * FROM parking_slots WHERE id = ?";
	    PreparedStatement statement = connection.prepareStatement(sql);
		statement.setInt(1, id);
		ResultSet rs = statement.executeQuery();
		ParkingSlot parkingSlot = null;
		if (rs.next()) {
			int parkingAreaId = rs.getInt("parking_area_id");
			String name = rs.getString("name");
			String status = rs.getString("status");
			parkingSlot = new ParkingSlot(id, parkingAreaId, name, status);
		}
		rs.close();
		statement.close();
		return parkingSlot;
	}

	//Delete all parking Slots of a parking area
	public void delete(int parkingAreaID) throws SQLException {
        String sqlDeleteParkingSlots = "DELETE FROM parking_slots WHERE parking_area_id = ?";
        PreparedStatement stmtDeleteParkingSlots = connection.prepareStatement(sqlDeleteParkingSlots);
        stmtDeleteParkingSlots.setInt(1, parkingAreaID);
        stmtDeleteParkingSlots.executeUpdate();
		stmtDeleteParkingSlots.close();
	}
	
	public boolean canEditParkingArea(int ParkingAreaId) throws SQLException{
        List<ParkingSlot> parkingSlots = getParkingSlotsByParkingArea(ParkingAreaId);
        boolean bookingExists = parkingSlots.stream().anyMatch(slot -> slot.getStatus().equals("booked"));
		return !bookingExists;
	}

	// change status of parking slot
	public void changeStatus(int parkingSlotId, String status) throws SQLException {
		status = status.equals("Completed") ? "unbooked" : "booked";
	    String sql = "UPDATE parking_slots SET status = ? WHERE id = ?";
	    PreparedStatement statement = connection.prepareStatement(sql);
		statement.setString(1, status);
		statement.setInt(2, parkingSlotId);
		statement.executeUpdate();
		statement.close();
	}
}
