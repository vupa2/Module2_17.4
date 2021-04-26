DROP DATABASE IF EXISTS LibraryManager;
CREATE DATABASE LibraryManager;
USE LibraryManager;

CREATE TABLE Student
(
    student_number VARCHAR(15) PRIMARY KEY,
    student_name   VARCHAR(50),
    address        VARCHAR(500),
    email          VARCHAR(50),
    image          VARCHAR(50)
);

CREATE TABLE Category
(
    number INT PRIMARY KEY,
    name   VARCHAR(50)
);

CREATE TABLE Book
(
    code           VARCHAR(15) PRIMARY KEY,
    name           VARCHAR(150),
    publisher      VARCHAR(50),
    author         VARCHAR(50),
    publish_date   DATE,
    edition_number INT,
    price          INT,
    image          varchar(50)
);

CREATE TABLE BorrowOrder
(
    id          INT PRIMARY KEY,
    borrow_date DATE,
    return_date DATE
);

ALTER TABLE Book
    ADD category_number INT,
    ADD FOREIGN KEY (category_number) REFERENCES Category (number);

ALTER TABLE BorrowOrder
    ADD student_number VARCHAR(15),
    ADD FOREIGN KEY (student_number) REFERENCES Student (student_number),
    ADD book_code VARCHAR(15),
    ADD FOREIGN KEY (book_code) REFERENCES Book (code);
