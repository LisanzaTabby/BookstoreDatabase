-- Create the bookstore database
CREATE DATABASE bookstore;
USE bookstore;

-- Create the customers table
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    email VARCHAR(100) UNIQUE,
    gender ENUM('Male','Female','Non-binary','Other')
);

-- Insert 20 records with international names and varied email domains
INSERT INTO customers (customer_name, phone, email, gender)
VALUES
    ('Raj Patel', '+91 98765 43210', 'raj.patel@gmail.com', 'Male'),
    ('Amina Diop', '+221 78 123 4567', 'amina.diop@yahoo.com', 'Female'),
    ('Juan Martínez', '+52 55 1234 5678', 'juan.mtz@hotmail.com', 'Male'),
    ('Yuki Tanaka', '+81 90-1234-5678', 'yuki.t@outlook.com', 'Female'),
    ('Olivier Dubois', '+33 6 12 34 56 78', 'olivier.dubois@protonmail.com', 'Male'),
    ('Ngozi Eze', '+234 801 234 5678', 'ngozi.eze@mail.com', 'Female'),
    ('Mikhail Ivanov', '+7 912 345-67-89', 'm.ivanov@yandex.ru', 'Male'),
    ('Leila Abbas', '+20 100 123 4567', 'leila.abbas@zoho.com', 'Female'),
    ('Carlos Silva', '+55 11 98765-4321', 'carlos.silva@icloud.com', 'Male'),
    ('Priya Sharma', '+44 7911 123456', 'priya.sharma@fastmail.com', 'Female'),
    ('Kwame Asante', '+233 24 123 4567', 'kwame.a@aol.com', 'Male'),
    ('Sophie Müller', '+49 151 12345678', 'sophie.mueller@gmx.de', 'Female'),
    ('Hiroshi Sato', '+81 70-9876-5432', 'hiroshi.sato@me.com', 'Male'),
    ('Fatima Zahra', '+212 612-345678', 'fatima.z@lycos.com', 'Female'),
    ('Alejandro Ruiz', '+34 612 34 56 78', 'alejandro.r@live.com', 'Male'),
    ('Ananya Desai', '+91 87654 32109', 'ananya.d@rediffmail.com', 'Female'),
    ('Mohammed Al-Farsi', '+966 50 123 4567', 'mohammed.alf@rocketmail.com', 'Male'),
    ('Elena Kowalski', '+48 501 234 567', 'elena.k@wp.pl', 'Female'),
    ('Tunde Okafor', '+234 802 345 6789', 'tunde.o@inbox.com', 'Male'),
    ('Linh Nguyen', '+84 98 123 4567', 'linh.nguyen@mailinator.com', 'Non-binary');

-- Create the country table
CREATE TABLE country (
    country_id INT AUTO_INCREMENT PRIMARY KEY,
    country_code CHAR(2) UNIQUE NOT NULL COMMENT 'ISO 2-letter code',
    country_name VARCHAR(100) NOT NULL
);

-- Insert countries
INSERT INTO country (country_code, country_name) VALUES
    ('US', 'United States'),
    ('GB', 'United Kingdom'),
    ('CA', 'Canada'),
    ('DE', 'Germany'),
    ('FR', 'France'),
    ('JP', 'Japan'),
    ('AU', 'Australia'),
    ('BR', 'Brazil'),
    ('IN', 'India'),
    ('ZA', 'South Africa'),
    ('MX', 'Mexico'),
    ('IT', 'Italy'),
    ('CN', 'China'),
    ('RU', 'Russia'),
    ('EG', 'Egypt'),
    ('AR', 'Argentina'),
    ('NG', 'Nigeria'),
    ('KR', 'South Korea');

-- Create the address table
CREATE TABLE address (
    address_id INT AUTO_INCREMENT PRIMARY KEY,
    street_number VARCHAR(20) NOT NULL,
    street_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    postal_code VARCHAR(20) NOT NULL,
    country_id INT NOT NULL,
    FOREIGN KEY (country_id) REFERENCES country(country_id)
);

-- Insert addresses
INSERT INTO address (street_number, street_name, city, postal_code, country_id)
VALUES
    ('123', 'Main Street', 'New York', '10001', 1),
    ('456', 'Elm Avenue', 'Los Angeles', '90001', 1),
    ('789', 'Oak Drive', 'Chicago', '60601', 1),
    ('101', 'Pine Road', 'Houston', '77001', 1),
    ('202', 'Maple Lane', 'Phoenix', '85001', 1),
    ('27', 'High Street', 'London', 'SW1A 1AA', 2),
    ('44', 'Park Lane', 'Manchester', 'M1 1AA', 2),
    ('15', 'Baker Street', 'Birmingham', 'B1 1AA', 2),
    ('3', 'Abbey Road', 'Liverpool', 'L1 1AA', 2),
    ('100', 'Queen Street', 'Toronto', 'M5V 2H1', 3),
    ('200', 'Yonge Street', 'Vancouver', 'V6B 2T1', 3),
    ('300', 'Bank Street', 'Montreal', 'H3B 2Y3', 3),
    ('400', 'Jasper Avenue', 'Calgary', 'T2P 1L9', 3),
    ('10', 'Friedrichstraße', 'Berlin', '10117', 4),
    ('20', 'Marienplatz', 'Munich', '80331', 4),
    ('30', 'Königsallee', 'Düsseldorf', '40212', 4),
    ('40', 'Römerberg', 'Frankfurt', '60311', 4),
    ('5', 'Rue de Rivoli', 'Paris', '75004', 5),
    ('15', 'Avenue des Champs-Élysées', 'Lyon', '69001', 5),
    ('25', 'Boulevard Saint-Germain', 'Marseille', '13001', 5),
    ('35', 'Rue de la Paix', 'Nice', '06000', 5),
    ('1', 'Chome-1-2 Oshiage', 'Tokyo', '131-0045', 6),
    ('2', 'Chome-2-3 Shinjuku', 'Osaka', '530-0001', 6),
    ('3', 'Chome-3-4 Shibuya', 'Kyoto', '600-8001', 6),
    ('4', 'Chome-4-5 Roppongi', 'Yokohama', '220-0001', 6),
    ('100', 'George Street', 'Sydney', '2000', 7),
    ('200', 'Swanston Street', 'Melbourne', '3000', 7),
    ('300', 'Queen Street', 'Brisbane', '4000', 7),
    ('400', 'Adelaide Terrace', 'Perth', '6000', 7),
    ('500', 'Avenida Paulista', 'São Paulo', '01310-200', 8),
    ('600', 'Rua Oscar Freire', 'Rio de Janeiro', '20040-040', 8),
    ('700', 'Avenida Afonso Pena', 'Belo Horizonte', '30130-007', 8),
    ('800', 'Rua da Praia', 'Porto Alegre', '90010-030', 8),
    ('22', 'MG Road', 'Mumbai', '400001', 9),
    ('33', 'Brigade Road', 'Bangalore', '560001', 9),
    ('44', 'Park Street', 'Kolkata', '700016', 9),
    ('55', 'Anna Salai', 'Chennai', '600002', 9),
    ('11', 'Adderley Street', 'Cape Town', '8001', 10),
    ('22', 'Rissik Street', 'Johannesburg', '2001', 10),
    ('33', 'Steve Biko Road', 'Pretoria', '0002', 10),
    ('44', 'Florida Road', 'Durban', '4001', 10);

-- Create the customer_address table (missing in your original script, added based on prior context)
CREATE TABLE customer_address (
    customer_id INT NOT NULL,
    address_id INT NOT NULL,
    address_1 INT NOT NULL,
    address_2 INT NULL,
    address_3 INT NULL,
    PRIMARY KEY (customer_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE,
    FOREIGN KEY (address_1) REFERENCES address(address_id) ON DELETE RESTRICT,
    FOREIGN KEY (address_2) REFERENCES address(address_id) ON DELETE RESTRICT,
    FOREIGN KEY (address_3) REFERENCES address(address_id) ON DELETE RESTRICT
);

-- Insert sample data into customer_address
INSERT INTO customer_address (customer_id, address_id, address_1, address_2, address_3)
VALUES
    (1, 33, 33, 34, 35),  -- Raj Patel: Mumbai, Bangalore, Kolkata
    (2, 1, 1, 2, 3),      -- Amina Diop: New York, Los Angeles, Chicago
    (3, 11, 11, 12, 13),  -- Juan Martínez: Toronto, Vancouver, Montreal
    (4, 22, 22, 23, 24),  -- Yuki Tanaka: Tokyo, Osaka, Kyoto
    (5, 18, 18, 19, 20),  -- Olivier Dubois: Paris, Lyon, Marseille
    (6, 37, 37, 38, 39),  -- Ngozi Eze: Cape Town, Johannesburg, Pretoria
    (7, 14, 14, 15, 16),  -- Mikhail Ivanov: Berlin, Munich, Düsseldorf
    (8, 6, 6, 7, 8),      -- Leila Abbas: London, Manchester, Birmingham
    (9, 30, 30, 31, 32),  -- Carlos Silva: São Paulo, Rio, Belo Horizonte
    (10, 26, 26, 27, 28), -- Priya Sharma: Sydney, Melbourne, Brisbane
    (11, 4, 4, 5, NULL),  -- Kwame Asante: Houston, Phoenix
    (12, 9, 9, 10, NULL), -- Sophie Müller: Liverpool, Toronto
    (13, 25, 25, 29, NULL), -- Hiroshi Sato: Yokohama, Perth
    (14, 36, 36, 40, NULL), -- Fatima Zahra: Chennai, Durban
    (15, 17, 17, 21, 24), -- Alejandro Ruiz: Frankfurt, Nice, Yokohama
    (16, 34, 34, 35, 36), -- Ananya Desai: Bangalore, Kolkata, Chennai
    (17, 30, 30, 31, NULL), -- Mohammed Al-Farsi: São Paulo, Rio
    (18, 14, 14, 15, NULL), -- Elena Kowalski: Berlin, Munich
    (19, 37, 37, 38, 39), -- Tunde Okafor: Cape Town, Johannesburg, Pretoria
    (20, 1, 1, 2, NULL);  -- Linh Nguyen: New York, Los Angeles

-- Create the address_status table
CREATE TABLE address_status (
    status_id INT AUTO_INCREMENT PRIMARY KEY,
    status_name VARCHAR(50) NOT NULL UNIQUE COMMENT 'e.g., Current, Old'
);

-- Insert address status values
INSERT INTO address_status (status_name) VALUES
    ('Current'),
    ('Old');

-- Alter customer_address to add address_status columns
ALTER TABLE customer_address
    ADD COLUMN address_1_status INT NOT NULL DEFAULT 1 COMMENT 'Status for address_1',
    ADD COLUMN address_2_status INT NULL COMMENT 'Status for address_2',
    ADD COLUMN address_3_status INT NULL COMMENT 'Status for address_3',
    ADD FOREIGN KEY (address_1_status) REFERENCES address_status(status_id) ON DELETE RESTRICT,
    ADD FOREIGN KEY (address_2_status) REFERENCES address_status(status_id) ON DELETE RESTRICT,
    ADD FOREIGN KEY (address_3_status) REFERENCES address_status(status_id) ON DELETE RESTRICT;

-- Update customer_address with address status (fixing ERROR 1175)
SET sql_safe_updates = 0; -- Disable safe updates mode
UPDATE customer_address
SET 
    address_1_status = 1, -- Current
    address_2_status = CASE WHEN address_2 IS NOT NULL THEN 2 ELSE NULL END, -- Old or NULL
    address_3_status = CASE WHEN address_3 IS NOT NULL THEN 2 ELSE NULL END; -- Old or NULL
SET sql_safe_updates = 1; -- Re-enable safe updates mode

