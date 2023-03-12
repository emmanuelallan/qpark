CREATE TABLE drivers (
     id INT PRIMARY KEY AUTO_INCREMENT,
     name VARCHAR(255) NOT NULL,
     avatar VARCHAR(255) NOT NULL,
     email VARCHAR(255) NOT NULL UNIQUE,
     phone VARCHAR(255) NOT NULL,
     driving_licence VARCHAR(255) NOT NULL UNIQUE,
     otp VARCHAR(255) NOT NULL
);

CREATE TABLE vehicles (
    id INT PRIMARY KEY AUTO_INCREMENT,
    brand VARCHAR(255) NOT NULL,
    image VARCHAR(255) NOT NULL,
    color VARCHAR(255) NOT NULL,
    plate VARCHAR(255) NOT NULL UNIQUE,
    type VARCHAR(255) NOT NULL,
    driver_id INT NOT NULL,
    FOREIGN KEY (driver_id) REFERENCES drivers(id) ON DELETE CASCADE
);

CREATE TABLE parking_areas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    capacity INT NOT NULL,
    image VARCHAR(255) NOT NULL,
    location VARCHAR(255) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    name VARCHAR(255) NOT NULL,
    status VARCHAR(255) NOT NULL,
    fine DECIMAL(10,2) NOT NULL,
    opening_time TIME NOT NULL,
    closing_time TIME NOT NULL
);

CREATE TABLE parking_slots (
    id INT PRIMARY KEY AUTO_INCREMENT,
    parking_area_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    status VARCHAR(255) NOT NULL,
    type VARCHAR(255) NOT NULL,
    location VARCHAR(255) NOT NULL,
    FOREIGN KEY (parking_area_id) REFERENCES parking_areas(id) ON DELETE CASCADE
);

CREATE TABLE bookings (
    id INT PRIMARY KEY AUTO_INCREMENT,
    parking_slot_id INT NOT NULL,
    vehicle_id INT NOT NULL,
    current_driver_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    check_in DATETIME NOT NULL,
    check_out DATETIME,
    delay DECIMAL(10,2) NOT NULL,
    fine DECIMAL(10,2) NOT NULL,
    status VARCHAR(255) NOT NULL,
    payment_status VARCHAR(255) NOT NULL,
    booking_duration VARCHAR(255) NOT NULL,
    FOREIGN KEY (parking_slot_id) REFERENCES parking_slots(id) ON DELETE CASCADE,
    FOREIGN KEY (vehicle_id) REFERENCES vehicles(id) ON DELETE CASCADE,
    FOREIGN KEY (current_driver_id) REFERENCES drivers(id) ON DELETE CASCADE
);

CREATE TABLE admins (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);
