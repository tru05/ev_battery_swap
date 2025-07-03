CREATE DATABASE ev_swap;
USE ev_swap;

CREATE TABLE stations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    address TEXT,
    city VARCHAR(100),
    zip_code VARCHAR(20),
    hours VARCHAR(100),
    battery_available INT,
    lat FLOAT,
    lng FLOAT
);

INSERT INTO stations (name, address, city, zip_code, hours, battery_available, lat, lng)
VALUES
('Swap Station A', '123 Green St', 'Mumbai', '400001', '9 AM - 9 PM', 12, 19.0760, 72.8777);
INSERT INTO stations (name, address, city, zip_code, hours, battery_available, lat, lng)
VALUES
('Swap Station B', '456 Blue St', 'Pune', '411001', '10 AM - 8 PM', 5, 18.5204, 73.8567);
INSERT INTO stations (name, address, city, zip_code, hours, battery_available, lat, lng)
VALUES ('Andheri Swap Hub', 'Andheri West', 'Mumbai', '400058', '8 AM - 8 PM', 10, 19.1197, 72.8468);

INSERT INTO stations (name, address, city, zip_code, hours, battery_available, lat, lng)
VALUES ('Dadar Swap Point', 'Near Shivaji Park', 'Mumbai', '400028', '7 AM - 9 PM', 6, 19.0176, 72.8562);

INSERT INTO stations (name, address, city, zip_code, hours, battery_available, lat, lng)
VALUES ('Kurla Green Energy', 'LBS Marg', 'Mumbai', '400070', '6 AM - 10 PM', 9, 19.0728, 72.8826);

INSERT INTO stations (name, address, city, zip_code, hours, battery_available, lat, lng)
VALUES ('Borivali Battery Swap', 'Borivali East', 'Mumbai', '400066', '9 AM - 8 PM', 5, 19.2290, 72.8598);

INSERT INTO stations (name, address, city, zip_code, hours, battery_available, lat, lng)
VALUES ('Colaba EV Station', 'Colaba Causeway', 'Mumbai', '400005', '10 AM - 6 PM', 7, 18.9155, 72.8050);
