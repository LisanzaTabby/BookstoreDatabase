-- Creating a bookstore database
Create database bookstore;

CREATE TABLE author(
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    first_Name VARCHAR(100),
    last_Name VARCHAR(100)
);

INSERT INTO author (first_Name, last_Name) VALUES 
('John', 'Doe'),
('Jane', 'Smith'),
('Alice', 'Johnson'),
('Bob', 'Williams'),
('Charlie', 'Brown'),
('David', 'Davis'),
('Eva', 'Martinez'),
('Frank', 'Harris'),
('Grace', 'Clark'),
('Hank', 'Lewis');

CREATE TABLE book_language(
    langauge_id INT AUTO_INCREMENT PRIMARY KEY,
    language_name VARCHAR(100)
);

INSERT INTO book_language (language_name) VALUES 
('English'),
('Spanish'),
('French'),
('German'),
('Italian'),
('Chinese'),
('Japanese'),
('Portuguese'),
('Russian'),
('Arabic');

CREATE TABLE publisher(
    Publisher_id INT AUTO_INCREMENT PRIMARY KEY,
    publisher_Name VARCHAR (150),
    contact_email VARCHAR (100),
    phone INT,
    Address INT
);

INSERT INTO publisher (publisher_Name, contact_email, phone, address) VALUES
('HarperCollins', 'contact@harpercollins.com', 1234567890, '123 Publisher St, NY'),
('Penguin Books', 'contact@penguin.com', 2345678901, '456 Publisher Ave, NY'),
('Random House', 'contact@randomhouse.com', 3456789012, '789 Publisher Blvd, NY'),
('Simon & Schuster', 'contact@simonandschuster.com', 4567890123, '1010 Publisher Rd, NY'),
('Hachette', 'contact@hachette.com', 5678901234, '1111 Publisher Way, NY'),
('Macmillan', 'contact@macmillan.com', 6789012345, '1212 Publisher Dr, NY'),
('Scholastic', 'contact@scholastic.com', 7890123456, '1313 Publisher Pkwy, NY'),
('Pearson', 'contact@pearson.com', 8901234567, '1414 Publisher Circle, NY'),
('Oxford University Press', 'contact@oup.com', 9012345678, '1515 Publisher Lane, NY'),
('Wiley', 'contact@wiley.com', 1230987654, '1616 Publisher Loop, NY');


CREATE TABLE book(
    Book_id INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(50),
    ISBN INT UNIQUE,
    publisher_id INT NOT NULL,                       -- FK to publisher
    language_id INT NOT NULL,  
    Publication_Year YEAR,
    Price DECIMAL(10,2),
    FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id),
    FOREIGN KEY (langauge_id) REFERENCES langauge_id(langauge_id)
);

INSERT INTO book (title, ISBN, publisher_id, language_id, publication_year, price) VALUES
('The Great Adventure', 1234567890, 1, 1, 2022, 19.99),
('Journey to the Unknown', 2345678901, 2, 2, 2021, 24.99),
('Learning to Code', 3456789012, 3, 3, 2020, 29.99),
('The Art of Cooking', 4567890123, 4, 4, 2019, 34.99),
('Mastering Python', 5678901234, 5, 5, 2018, 39.99),
('The Science of Things', 6789012345, 6, 6, 2017, 44.99),
('Exploring the Cosmos', 7890123456, 7, 7, 2016, 49.99),
('Global Politics', 8901234567, 8, 8, 2015, 54.99),
('Understanding History', 9012345678, 9, 9, 2014, 59.99),
('Economics for Dummies', 1122334455, 10, 10, 2013, 64.99);

CREATE TABLE book_author( 
    book_id INT AUTO_INCREMENT,
    author_id INT,
    first_Name VARCHAR(50)
    last_Name VARCHAR(50)
    FOREIGN KEY (book_id) REFERENCES book(book_id)
    FOREIGN KEY (author_id) REFERENCES author(author_id)
);

INSERT INTO book_author (book_id, author_id, first_Name, last_Name) VALUES
(1, 1, 'John', 'Doe'),
(2, 2, 'Jane', 'Smith'),
(3, 3, 'Alice', 'Johnson'),
(4, 4, 'Bob', 'Williams'),
(5, 5, 'Charlie', 'Brown'),
(6, 6, 'David', 'Davis'),
(7, 7, 'Eva', 'Martinez'),
(8, 8, 'Frank', 'Harris'),
(9, 9, 'Grace', 'Clark'),
(10, 10, 'Hank', 'Lewis');

