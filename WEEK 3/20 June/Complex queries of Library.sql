-- Create the database
CREATE DATABASE HotelManagementSystem;

-- Use the database
USE HotelManagementSystem;

-- Create the guests table
CREATE TABLE guests (
    guest_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    check_in_date DATE
);

-- Create the rooms table
CREATE TABLE rooms (
    room_id INT AUTO_INCREMENT PRIMARY KEY,
    room_number VARCHAR(10) NOT NULL,
    room_type VARCHAR(50) NOT NULL
);

-- Create the reservations table
CREATE TABLE reservations (
    reservation_id INT AUTO_INCREMENT PRIMARY KEY,
    guest_id INT,
    room_id INT,
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (guest_id) REFERENCES guests(guest_id),
    FOREIGN KEY (room_id) REFERENCES rooms(room_id)
);

-- Create the services table
CREATE TABLE services (
    service_id INT AUTO_INCREMENT PRIMARY KEY,
    service_name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2)
);

-- Create the service usage table
CREATE TABLE service_usage (
    usage_id INT AUTO_INCREMENT PRIMARY KEY,
    reservation_id INT,
    service_id INT,
    usage_date DATE,
    FOREIGN KEY (reservation_id) REFERENCES reservations(reservation_id),
    FOREIGN KEY (service_id) REFERENCES services(service_id)
);

-- Insert sample data into guests table
INSERT INTO guests (name, check_in_date) VALUES 
('John Doe', '2023-01-10'),
('Jane Smith', '2023-02-15'),
('Michael Johnson', '2024-03-20');

-- Insert sample data into rooms table
INSERT INTO rooms (room_number, room_type) VALUES 
('101', 'Single'),
('102', 'Double'),
('103', 'Suite');

-- Insert sample data into reservations table
INSERT INTO reservations (guest_id, room_id, start_date, end_date) VALUES 
(1, 1, '2024-06-01', '2024-06-10'),
(2, 2, '2024-06-05', '2024-06-12'),
(3, 3, '2024-06-10', '2024-06-15');

-- Insert sample data into services table
INSERT INTO services (service_name, price) VALUES 
('Room Service', 50.00),
('Spa', 100.00),
('Laundry', 25.00);

-- Insert sample data into service usage table
INSERT INTO service_usage (reservation_id, service_id, usage_date) VALUES 
(1, 1, '2024-06-02'),
(2, 2, '2024-06-06'),
(3, 3, '2024-06-11');

-- Query 1: Find all reservations for guests who checked in the last year.
SELECT r.room_number, g.name, r.start_date
FROM rooms r
JOIN reservations res ON r.room_id = res.room_id
JOIN guests g ON res.guest_id = g.guest_id
WHERE g.check_in_date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR);

-- Query 2: List all rooms along with their types.
SELECT r.room_number, r.room_type
FROM rooms r;

-- Query 3: Find the most used service in the last month.
SELECT s.service_name, COUNT(u.usage_id) AS usage_count
FROM services s
JOIN service_usage u ON s.service_id = u.service_id
WHERE u.usage_date >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
GROUP BY s.service_name
ORDER BY usage_count DESC
LIMIT 1;

-- Query 4: List guests who have stayed longer than 7 days.
SELECT g.name, r.room_number, res.start_date, res.end_date
FROM guests g
JOIN reservations res ON g.guest_id = res.guest_id
JOIN rooms r ON res.room_id = r.room_id
WHERE DATEDIFF(res.end_date, res.start_date) > 7;

-- Query 5: Find the room type with the highest number of reservations.
SELECT r.room_type, COUNT(res.reservation_id) AS reservation_count
FROM rooms r
JOIN reservations res ON r.room_id = res.room_id
GROUP BY r.room_type
ORDER BY reservation_count DESC
LIMIT 1;

-- Query 6: Find all reservations that are currently ongoing.
SELECT r.room_number, g.name, res.start_date, res.end_date
FROM rooms r
JOIN reservations res ON r.room_id = res.room_id
JOIN guests g ON res.guest_id = g.guest_id
WHERE CURDATE() BETWEEN res.start_date AND res.end_date;

-- Query 7: List all guests who have used the spa service.
SELECT DISTINCT g.name
FROM guests g
JOIN reservations res ON g.guest_id = res.guest_id
JOIN service_usage u ON res.reservation_id = u.reservation_id
JOIN services s ON u.service_id = s.service_id
WHERE s.service_name = 'Spa';

-- Query 8: Find the number of reservations made each month for the past year.
SELECT DATE_FORMAT(res.start_date, '%Y-%m') AS reservation_month, COUNT(res.reservation_id) AS reservation_count
FROM reservations res
WHERE res.start_date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
GROUP BY reservation_month
ORDER BY reservation_month;

-- Query 9: List the top 3 guests with the most reservations.
SELECT g.name, COUNT(res.reservation_id) AS reservation_count
FROM guests g
JOIN reservations res ON g.guest_id = res.guest_id
GROUP BY g.name
ORDER BY reservation_count DESC
LIMIT 3;

-- Query 10: Find all rooms that have never been reserved.
SELECT r.room_number
FROM rooms r
LEFT JOIN reservations res ON r.room_id = res.room_id
WHERE res.reservation_id IS NULL;
