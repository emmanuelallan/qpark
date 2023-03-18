package com.qpark.dao;
public class BookingDAO {
    
    private JdbcTemplate jdbcTemplate;
    
    public void save(Booking booking) {
        String sql = "INSERT INTO bookings (vehicle_number, entry_time, exit_time, is_paid, amount, status) VALUES (?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, booking.getVehicleNumber(), booking.getEntryTime(), booking.getExitTime(), booking.isPaid(), booking.getAmount(), booking.getStatus());
    }
    
    public Booking findById(int id) {
        String sql = "SELECT * FROM bookings WHERE id = ?";
        Booking booking = jdbcTemplate.queryForObject(sql, new Object[]{id}, new BookingRowMapper());
        return booking;
    }
    
    public List<Booking> findAll() {
        String sql = "SELECT * FROM bookings";
        List<Booking> bookings = jdbcTemplate.query(sql, new BookingRowMapper());
        return bookings;
    }
    
    public void updateStatus(int id, String status) {
        String sql = "UPDATE bookings SET status = ? WHERE id = ?";
        jdbcTemplate.update(sql, status, id);
    }
    
    public int getBookingCount() {
        String sql = "SELECT COUNT(*) FROM bookings";
        int count = jdbcTemplate.queryForObject(sql, Integer.class);
        return count;
    }
    
    public double getTotalAmount() {
        String sql = "SELECT SUM(amount) FROM bookings WHERE is_paid = true";
        double amount = jdbcTemplate.queryForObject(sql, Double.class);
        return amount;
    }
    
    private static final class BookingRowMapper implements RowMapper<Booking> {
        public Booking mapRow(ResultSet rs, int rowNum) throws SQLException {
            Booking booking = new Booking();
            booking.setId(rs.getInt("id"));
            booking.setVehicleNumber(rs.getString("vehicle_number"));
            booking.setEntryTime(rs.getTimestamp("entry_time").toLocalDateTime());
            booking.setExitTime(rs.getTimestamp("exit_time").toLocalDateTime());
            booking.setPaid(rs.getBoolean("is_paid"));
            booking.setAmount(rs.getDouble("amount"));
            booking.setStatus(rs.getString("status"));
            return booking;
        }
    }
}
