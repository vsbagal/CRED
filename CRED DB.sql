-- Create Database
CREATE DATABASE CRED;
USE CRED;

-- Create the Users table
CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Password VARCHAR(255) NOT NULL,
    PhoneNumber VARCHAR(15),
    Address VARCHAR(255)
);

-- Insert sample users
INSERT INTO Users (FirstName, LastName, Email, Password, PhoneNumber, Address)
VALUES
    ('Rahul', 'Sharma', 'rahul@example.com', 'hashed_password_1', '+91-9876543210', '123 Main Street, Bangalore'),
    ('Priya', 'Verma', 'priya@example.com', 'hashed_password_2', '+91-8765432109', '456 Park Avenue, Mumbai'),
    ('Amit', 'Singh', 'amit@example.com', 'hashed_password_3', '+91-7654321098', '789 Orchard Road, Delhi'),
    ('Neha', 'Gupta', 'neha@example.com', 'hashed_password_4', '+91-6543210987', '321 River Lane, Kolkata'),
    ('Sandeep', 'Kumar', 'sandeep@example.com', 'hashed_password_5', '+91-5432109876', '567 Hillside Avenue, Chennai'),
    ('Kavita', 'Patel', 'kavita@example.com', 'hashed_password_6', '+91-9876543201', '789 Rose Street, Ahmedabad'),
    ('Ankur', 'Shah', 'ankur@example.com', 'hashed_password_7', '+91-8765432102', '456 Sunshine Road, Pune'),
    ('Sunita', 'Rao', 'sunita@example.com', 'hashed_password_8', '+91-7654321093', '123 Ocean Drive, Hyderabad'),
    ('Vijay', 'Chopra', 'vijay@example.com', 'hashed_password_9', '+91-6543210984', '567 Moonlight Lane, Chandigarh'),
    ('Preeti', 'Malik', 'preeti@example.com', 'hashed_password_10', '+91-5432109875', '321 Star Avenue, Jaipur');

-- Create the CreditCards table
CREATE TABLE CreditCards (
    CardID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    CardNumber VARCHAR(20) UNIQUE,
    ExpiryDate DATE,
    CVV VARCHAR(4),
    CreditLimit DECIMAL(15, 2) DEFAULT 0,
    Balance DECIMAL(15, 2) DEFAULT 0,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Insert sample credit cards
INSERT INTO CreditCards (UserID, CardNumber, ExpiryDate, CVV, CreditLimit, Balance)
VALUES
    (1, '1234-5678-9012-3456', '2025-12-31', '123', 50000.00, 1500.00),
    (2, '9876-5432-1098-7654', '2024-06-30', '456', 75000.00, 20000.00),
    (3, '5678-1234-9012-3456', '2026-03-15', '789', 60000.00, 5000.00),
    (4, '4321-8765-2109-5432', '2025-08-31', '234', 35000.00, 15000.00),
    (5, '8765-4321-5432-1098', '2023-11-30', '567', 25000.00, 1000.00),
    (6, '2345-6789-0123-4567', '2024-09-15', '678', 40000.00, 5000.00),
    (7, '8901-2345-5678-9012', '2023-04-30', '789', 30000.00, 8000.00),
    (8, '3456-7890-1234-5678', '2025-07-22', '890', 45000.00, 6000.00),
    (9, '9012-3456-7890-1234', '2024-01-10', '901', 55000.00, 3000.00),
    (10, '4567-8901-2345-6789', '2023-12-05', '012', 20000.00, 15000.00);

-- Create the Transactions table
CREATE TABLE Transactions (
    TransactionID INT AUTO_INCREMENT PRIMARY KEY,
    CardID INT,
    Amount DECIMAL(15, 2),
    TransactionType VARCHAR(50),
    Timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (CardID) REFERENCES CreditCards(CardID)
);

-- Insert sample transactions
INSERT INTO Transactions (CardID, Amount, TransactionType)
VALUES
    (1, 1000.00, 'Purchase'),
    (2, 500.00, 'Withdrawal'),
    (3, 1500.00, 'Purchase'),
    (4, 200.00, 'Payment'),
    (5, 800.00, 'Withdrawal'),
    (6, 300.00, 'Purchase'),
    (7, 100.00, 'Withdrawal'),
    (8, 700.00, 'Purchase'),
    (9, 400.00, 'Withdrawal'),
    (10, 1200.00, 'Purchase');

-- Create the Payments table
CREATE TABLE Payments (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    CardID INT,
    Amount DECIMAL(15, 2),
    PaymentDate DATE,
    FOREIGN KEY (CardID) REFERENCES CreditCards(CardID)
);

-- Insert sample payments
INSERT INTO Payments (CardID, Amount, PaymentDate)
VALUES
    (1, 800.00, '2023-08-20'),
    (2, 350.00, '2023-09-05'),
    (3, 1000.00, '2023-08-25'),
    (4, 100.00, '2023-08-15'),
    (5, 200.00, '2023-08-10'),
    (6, 150.00, '2023-08-18'),
    (7, 50.00, '2023-09-01'),
    (8, 500.00, '2023-08-28'),
    (9, 300.00, '2023-08-16'),
    (10, 800.00, '2023-09-10');
