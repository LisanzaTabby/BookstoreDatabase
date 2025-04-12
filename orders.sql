USE bookstore;

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
    customer_id INT NOT NULL,
    orderDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status_id INT NULL,
    shipping_Method_ID INT NULL,
    order_Status_ID INT NULL,
    PRIMARY KEY (orderID),
    FOREIGN KEY (customer_ID) REFERENCES customers(customer_ID)
        ON UPDATE CASCADE 
        ON DELETE SET NULL,
    FOREIGN KEY (status_id) REFERENCES address_status(status_id)
        ON UPDATE CASCADE 
        ON DELETE SET NULL,
    FOREIGN KEY (shipping_Method_ID) REFERENCES shippingMethod(shipping_Method_ID)
        ON UPDATE CASCADE 
        ON DELETE SET NULL,
    FOREIGN KEY (order_Status_ID) REFERENCES order_Status(order_Status_ID)
        ON UPDATE CASCADE 
        ON DELETE SET NULL
);
-- inserting Data to customer_orders table
INSERT INTO customer_orders (customer_ID, orderDate, status_id, shipping_Method_ID, order_Status_ID) VALUES
(1, '2025-04-10 10:15:00', 2, 1, 1),
(2, '2025-04-10 11:30:00', 1, 2, 2),
(3, '2025-04-10 12:45:00', 2, 3, 3),
(4, '2025-04-11 08:00:00', 1, 4, 1),
(5, '2025-04-11 09:20:00', 1, 5, 2),
(6, '2025-04-11 10:30:00', 2, 6, 3),
(7, '2025-04-11 11:45:00', 1, 7, 1),
(8, '2025-04-12 08:15:00', 2, 8, 2),
(9, '2025-04-12 09:30:00', 2, 9, 3),
(10, '2025-04-12 10:45:00', 1, 10, 2);


-- create orderStatus table
CREATE TABLE order_Status (
    order_Status_ID INT PRIMARY KEY AUTO_INCREMENT,
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
    order_Status_ID INT NULL,
    date DATETIME,
    FOREIGN KEY (orderID) REFERENCES customer_orders(orderID)
        ON UPDATE CASCADE 
        ON DELETE SET NULL,
    FOREIGN KEY (orderStatus_ID) REFERENCES order_Status(order_Status_ID)
        ON UPDATE CASCADE 
        ON DELETE SET NULL
);
-- inserting Data to order_history table
INSERT INTO order_history (orderID, orderStatus_ID, date) VALUES
(1, 1, NOW()),
(2, 2, NOW()),
(3, 3, NOW()),
(4, 1, NOW()),
(5, 3, NOW()),
(6, 1, NOW()),
(7, 2, NOW()),
(8, 3, NOW()),
(9, 1, NOW()),
(10, 1, NOW());
-- create orderLine table (corrected 'book_ID' → 'bookID')
CREATE TABLE orderLine (
    orderLine_ID INT PRIMARY KEY AUTO_INCREMENT,
    orderID INT NULL,
    book_id INT NULL,
    quantity INT,
    Price DECIMAL(10, 2),
    FOREIGN KEY (orderID) REFERENCES customer_orders(orderID)
        ON UPDATE CASCADE 
        ON DELETE SET NULL,
    FOREIGN KEY (book_id) REFERENCES books(book_id)
        ON UPDATE CASCADE 
        ON DELETE SET NULL
);
-- inserting Data to orderLine table
INSERT INTO orderLine (orderID, book_id, quantity, Totalprice) VALUES
(1, 1, 1, 1200),
(2, 2, 2, 2000),
(3, 3, 1, 950),
(4, 4, 3, 2400),
(5, 5, 2, 2200),
(6, 6, 1, 1300),
(7, 7, 1, 900),
(8, 8, 2, 1940),
(9, 9, 1, 1050),
(10, 10, 1, 1500);