package com.qpark.dao;
import com.qpark.model.ParkingArea;
import com.qpark.model.ParkingSlot;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ParkingSlotDAO {
	private final Connection connection;
	public ParkingSlotDAO(Connection connection){
		this.connection = connection;
	}
	
	
	public void createParkingSlots(int parkingAreaId, int capacity) throws SQLException {
	    List<ParkingSlot> parkingSlots = new ArrayList<>();

	    for (int i = 1; i <= capacity; i++) {
	        String slotName = "PS" + String.format("%03d", i); // generate slot name as PS001, PS002, etc.
	        ParkingSlot parkingSlot = new ParkingSlot(parkingAreaId, slotName, "unbooked");
	        parkingSlots.add(parkingSlot);
	    }
	    
	    String sql = "INSERT INTO parking_slots (parking_area_id, name, status) VALUES (?, ?, ?)";
	    PreparedStatement statement = connection.prepareStatement(sql);
	    
	    for (ParkingSlot parkingSlot : parkingSlots) {
	            statement.setInt(1, parkingSlot.getParkingAreaId());
	            statement.setString(2, parkingSlot.getSlotNumber());
	            statement.setString(3, parkingSlot.getStatus());
	            
	            statement.executeUpdate();
	    }
	}
	

	
	//Get parking slots by parkingAreaId
	public List<ParkingSlot> getParkingSlotsByParkingArea(int parkingAreaId) throws SQLException {
	    List<ParkingSlot> parkingSlots = new ArrayList<>();
	    String sql = "SELECT * FROM parking_slots WHERE parking_area_id = ?";
	    PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, parkingAreaId);
        ResultSet rs = statement.executeQuery();
        
        while (rs.next()) {
            String slotName = rs.getString("name");
            String status = rs.getString("status");
            ParkingSlot parkingSlot = new ParkingSlot(parkingAreaId, slotName, status);
            parkingSlots.add(parkingSlot);
        }
		return parkingSlots;
	}
	
	
	//Delete all parking Slots of a parking area
	public void deleteSlots(int parkingAreaID) throws SQLException{
		ParkingArea parkingArea = new ParkingArea();
		
        String sqlDeleteParkingSlots = "DELETE FROM parking_slots WHERE parking_area_id = ?";
        PreparedStatement stmtDeleteParkingSlots = connection.prepareStatement(sqlDeleteParkingSlots);
        stmtDeleteParkingSlots.setInt(1, parkingArea.getId());
        int rowsDeleted = stmtDeleteParkingSlots.executeUpdate();
        System.out.println("Deleted " + rowsDeleted + " parking slots");
	}
	
	
	//Get parkingslot by slotName
	ParkingSlot parkingSlot = null;
	public ParkingSlot getParkingSlotById(int slotId) throws SQLException {
        String sql = "SELECT * FROM parking_slot WHERE name = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, slotId);
        ResultSet resultSet = statement.executeQuery();
        
        if (resultSet.next()) {
            int parkingAreaId = resultSet.getInt("parking_area_id");
            String slotName = resultSet.getString("name");
            String status = resultSet.getString("status");
            parkingSlot = new ParkingSlot(parkingAreaId, slotName, status);
        }
        
		return parkingSlot;
	}
	
	public void updateParkingSlot(ParkingSlot parkingSlot) throws SQLException {
		
		String sql = "UPDATE parking_slot SET parking_area_id = ?, status = ? WHERE name = ?";
	    PreparedStatement statement = connection.prepareStatement(sql);
	    
        statement.setInt(1, parkingSlot.getParkingAreaId());
        statement.setString(2, parkingSlot.getSlotNumber());
        statement.setString(3, parkingSlot.getStatus());
        
        statement.executeUpdate();
	}

	public void updateParkingSlotStatus(int parkingSlotId, String newStatus) throws SQLException{
	    ParkingSlot parkingSlot = getParkingSlotById(parkingSlotId);
	    if (parkingSlot == null) {
	        System.out.println("Parking slot is empty!");
	    }
	    parkingSlot.setStatus(newStatus);
	    updateParkingSlot(parkingSlot);
	    
	}
}
