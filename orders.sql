USE bookstore;
-- create address_Status table
CREATE TABLE address_Status (
    statusID INT PRIMARY KEY AUTO_INCREMENT,
    statusDescription VARCHAR(30)
);

-- Inserting Data to address_Status table
INSERT INTO address_status (statusDescription) VALUES
('Current'),
('Old');

-- create shippingMethod table
CREATE TABLE shippingMethod (
    shipping_Method_ID INT PRIMARY KEY AUTO_INCREMENT,
    methodName VARCHAR(100)
);
-- inserting Data to shippingMethod table
INSERT INTO shippingmethod (methodName) VALUES 
('Standard Shipping'),
('Express Shipping'),
('Overnight Delivery'),
('Same Day Delivery'),
('Economy Shipping'),
('Courier Pickup'),
('In-store Pickup'),
('Drone Delivery'),
('Weekend Shipping'),
('International Shipping'),
('Next Day Shipping');

-- create customer_orders table
CREATE TABLE customer_orders (
    orderID INT NOT NULL AUTO_INCREMENT,
    orderDate TIMESTAMP,
    statusID INT NULL,
    shipping_Method_ID INT NULL,
    PRIMARY KEY (orderID),
    FOREIGN KEY (statusID) REFERENCES address_Status(statusID)
        ON UPDATE CASCADE 
        ON DELETE SET NULL,
    FOREIGN KEY (shipping_Method_ID) REFERENCES shippingMethod(shipping_Method_ID)
        ON UPDATE CASCADE 
        ON DELETE SET NULL
);
-- inserting Data to customer_orders table
INSERT INTO customer_orders (orderDate, statusID, shipping_Method_ID) VALUES
(NOW(), 1, 1),
(NOW(), 2, 2),
(NOW(), 1, 3),
(NOW(), 1, 4),
(NOW(), 2, 5),
(NOW(), 1, 6),
(NOW(), 2, 7),
(NOW(), 1, 8),
(NOW(), 2, 9),
(NOW(), 1, 10);

-- create orderStatus table
CREATE TABLE order_Status (
    orderStatus_ID INT PRIMARY KEY AUTO_INCREMENT,
    statusName VARCHAR(100)
);

-- Inserting Data to orderStatus table
INSERT INTO order_Status (statusName) VALUES
('Pending'),
('Shipped'),
('Delivered');

-- create order_history table
CREATE TABLE order_history (
    historyID INT PRIMARY KEY AUTO_INCREMENT,
    orderID INT NULL,
    orderStatus_ID INT NULL,
    date DATETIME,
    FOREIGN KEY (orderID) REFERENCES customer_orders(orderID)
        ON UPDATE CASCADE 
        ON DELETE SET NULL,
    FOREIGN KEY (orderStatus_ID) REFERENCES order_Status(orderStatus_ID)
        ON UPDATE CASCADE 
        ON DELETE SET NULL
);
-- inserting Data to order_history table
INSERT INTO order_history (orderID, orderStatus_ID, date) VALUES
(21, 1, NOW()),
(22, 2, NOW()),
(23, 3, NOW()),
(24, 1, NOW()),
(25, 3, NOW()),
(26, 1, NOW()),
(27, 2, NOW()),
(28, 3, NOW()),
(29, 1, NOW()),
(30, 1, NOW());
-- create orderLine table (corrected 'book_ID' → 'bookID')
CREATE TABLE orderLine (
    orderLine_ID INT PRIMARY KEY AUTO_INCREMENT,
    orderID INT NULL,
    bookID INT NULL,
    quantity INT,
    price INT,
    FOREIGN KEY (orderID) REFERENCES customer_orders(orderID)
        ON UPDATE CASCADE 
        ON DELETE SET NULL,
    FOREIGN KEY (bookID) REFERENCES books(bookID)
        ON UPDATE CASCADE 
        ON DELETE SET NULL
);
-- inserting Data to orderLine table
INSERT INTO orderLine (orderID, bookID, quantity, price) VALUES
(21, 1, 1, 1200),
(22, 2, 2, 2000),
(23, 3, 1, 950),
(24, 4, 3, 2400),
(25, 5, 2, 2200),
(26, 6, 1, 1300),
(27, 7, 1, 900),
(28, 8, 2, 1940),
(29, 9, 1, 1050),
(30, 10, 1, 1500);
