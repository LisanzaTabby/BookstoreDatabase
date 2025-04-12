-- Creating a bookstore database
Create database bookstore;

CREATE TABLE author(
    Customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_Name VARCHAR(100),
    last_Name VARCHAR(100)
);

CREATE TABLE book_language(
    langauge_id INT AUTO_INCREMENT PRIMARY KEY,
    language_name VARCHAR(50)
);

CREATE TABLE publisher(
    Publisher_id INT AUTO_INCREMENT PRIMARY KEY,
    publisher_Name VARCHAR (50),
    contact_email VARCHAR (50),
    phone INT,
    Address INT
);


CREATE TABLE book(
    Book_id INT PRIMARY KEY,
    Title VARCHAR(50),
    ISBN INT UNIQUE,
    publisher_id INT NOT NULL,                       -- FK to publisher
    language_id INT NOT NULL,  
    Publication_Year YEAR,
    Price DECIMAL(10,2),
    FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id),
    FOREIGN KEY (langauge_id) REFERENCES langauge_id(langauge_id)
);

CREATE TABLE book_author( 
    book_id INT,
    author_id INT,
    first_Name VARCHAR(50)
    last_Name VARCHAR(50)
    FOREIGN KEY (book_id) REFERENCES book(book_id)
    FOREIGN KEY (author_id) REFERENCES author(author_id)
);


