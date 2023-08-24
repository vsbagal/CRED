
 /*Easy Problem Statements:
 1. **Easy - Users List:**
 Retrieve a list of all users along with their first names, last names, and email addresses. */
	SELECT FirstName, LastName, Email FROM Users;
    
/*2. **Easy - Account Balances:**
   Display the account numbers and current balances of all credit card accounts.*/
	SELECT CardNumber, Balance FROM CreditCards;

/*3. **Easy - Transaction Count:**
   Calculate and display the total number of transactions in the system.*/
   SELECT * FROM transactions;

/*4. **Easy - High Balance Users:**
   List the first names and last names of users who have a credit card balance greater than 10000.*/
	SELECT u.FirstName, u.LastName, c.balance FROM Users u 
    JOIN creditcards c ON u.UserID = c.UserID
	WHERE c.balance > '10000';
    
/*5. **Easy - Transaction Types:**
   Show a distinct list of transaction types (e.g., Purchase, Withdrawal) from the Transactions table.*/
SELECT DISTINCT TransactionType, TransactionID FROM Transactions;

/*6. **Easy - User Addresses:**
Retrieve the first name, last name, and address of users who live in Delhi.*/
SELECT FirstName, LastName, address FROM Users 
WHERE Address LIKE '%Delhi';

/*7. **Easy - Oldest Card Expiry:**
   Find the user with the credit card that is expiring soonest and display their name and email.*/
SELECT u.FirstName, u.LastName, c.ExpiryDate FROM Users u
JOIN creditcards c ON u.userid = c.userid
WHERE ExpiryDate = (SELECT MIN(ExpiryDate) FROM creditcards);

/*8. **Easy - Payment Amounts:**
   List the amounts of payments made by users.*/
SELECT u.FirstName, u.LastName, p.Amount FROM Users U
JOIN Payments p ON u.UserID = p.PaymentID;

/*9. **Easy - Available Credit:**
   Calculate and display the available credit for each credit card (credit limit - balance).*/
SELECT u.FirstName, u.LastName, Balance, (CreditLimit - Balance) AS AvailableCredit, c.CardID FROM creditcards c
JOIN  Users u ON c.UserID = u.UserID;

/*10. **Easy - Transaction Timestamps:**
    Retrieve the timestamps of the latest three transactions.*/
SELECT Timestamp FROM transactions
ORDER BY Timestamp DESC LIMIT 3;
 
/*11. **Easy - User Count:**
    Count the total number of users in the Users table.*/
SELECT DISTINCT COUNT(*) FROM USERS;

/*12. **Easy - Card Count:**
    Count the total number of credit cards in the system.*/
SELECT DISTINCT COUNT(*) FROM creditcards;

/*13. **Easy - Payment Dates:**
    List the payment dates of payments made by users.*/
SELECT PaymentDate FROM Payments;

/*14. **Easy - User Email:**
    Retrieve the email addresses of all users.*/
    SELECT Email, UserID FROM Users;

/*15. **Easy - Card Expiry Dates:**
    Display the expiry dates of all credit cards.*/
    SELECT ExpiryDate, CardID 
    FROM CreditCards ORDER BY ExpiryDate;

### Moderate Problem Statements:

/*1. **Moderate - Total Balance:**
   Calculate and display the total balance of all credit card accounts combined.*/
   SELECT SUM(Balance) as TotalBalance FROM creditcards;
   SELECT SUM(CreditLimit) as TotalLimit FROM creditcards;

/* 2. **Moderate - Recent Transactions:**
   Retrieve the details of the last five transactions by amount asc, including sender/receiver, amount, and type.*/
SELECT TransactionID, CardID, Amount, TransactionType FROM Transactions
ORDER BY Amount LIMIT 5;

/* 3. **Moderate - Average Transaction Amount:**
   Calculate and display the average amount of all transactions.*/
SELECT AVG(Amount) AS AVGTransaction FROM Transactions;

/*4. **Moderate - User Transaction Count:**
   List the names of users along with the number of transactions they've made.*/
SELECT u.FirstName, u.LastName, COUNT(t.TransactionID) AS TransactionCount
FROM Users u
LEFT JOIN Transactions t ON u.UserID = t.CardID
GROUP BY u.FirstName, u.LastName;


/*5. **Moderate - Highest Credit Limit:**
   Find and display the user with the highest credit limit and their credit limit value.*/
SELECT u.FirstName, u.LastName, c.CreditLimit FROM Users u 
JOIN CreditCards c ON u.UserID = c.UserID
WHERE CreditLimit = (SELECT MAX(CreditLimit) FROM CreditCards);

SELECT u.FirstName, u.LastName, c.CreditLimit
FROM Users u INNER JOIN CreditCards c ON u.UserID = c.UserID
ORDER BY c.CreditLimit DESC
LIMIT 1;

/*6. **Moderate - Account With Most Transactions:**
   Identify the credit card with the most transactions and display its card number.*/
SELECT  c.CardNumber, COUNT(t.TransactionID) AS TransactionCount
FROM CreditCards c
LEFT JOIN Transactions t ON c.CardNumber = t.Cardid
GROUP BY c.CardNumber
ORDER BY TransactionCount 
LIMIT 1;

/*7. **Moderate - Users with Overdue Payments:**
   Retrieve a list of users who have payments due today or earlier.*/
SELECT DISTINCT u.FirstName, u.LastName, p.PaymentDate
FROM Users u
INNER JOIN CreditCards c ON u.UserID = c.UserID
INNER JOIN Payments p ON c.CardID = p.CardID
WHERE p.PaymentDate <= CURDATE();

/*8. **Moderate - Card Expiry by Year:**
   Count and display how many credit cards will expire in each year.*/
SELECT YEAR(ExpiryDate) AS ExpiryYear, COUNT(*) AS CardCount
FROM CreditCards
GROUP BY ExpiryYear
ORDER BY ExpiryYear;


/*9. **Moderate - User Balances:**
   List the users along with the sum of their credit card balances.*/
SELECT u.FirstName, u.LastName, SUM(c.Balance) AS TotalBalance
FROM Users u
INNER JOIN CreditCards c ON u.UserID = c.UserID
GROUP BY u.FirstName, u.LastName;

/* 10. **Moderate - Transaction Type Distribution:**
    Display the distribution of transaction types (e.g., percentage of purchases, withdrawals).*/
SELECT TransactionType, COUNT(*) AS TransactionCount,
       COUNT(*) * 100 / (SELECT COUNT(*) FROM Transactions) AS Percentage
FROM Transactions
GROUP BY TransactionType;

/* 11. **Moderate - Highest Transaction Amount:**
    Find the highest transaction amount and display the transaction details.*/
    SELECT Amount FROM transactions
    ORDER BY Amount DESC limit 1;
	
    SELECT Amount FROM Transactions 
    WHERE Amount = (SELECT MAX(Amount) FROM transactions);
    
/*12. **Moderate - Expensive Transactions:**
    Retrieve transactions with amounts greater than 1000 and display user names and transaction amounts.*/
SELECT Amount FROM transactions
WHERE Amount > 1000;

/* Add new column 'BirthDate' to Users table and insert Values*/

ALTER TABLE Users
ADD Birthdate DATE;

UPDATE Users
SET Birthdate = '1990-05-15' WHERE UserID = 1;

UPDATE Users
SET Birthdate = '1985-08-20' WHERE UserID = 2;

UPDATE Users
SET Birthdate = '1992-03-10' WHERE UserID = 3;

UPDATE Users
SET Birthdate = '1978-11-25' WHERE UserID = 4;

UPDATE Users
SET Birthdate = '1995-06-02' WHERE UserID = 5;

UPDATE Users
SET Birthdate = '1987-09-14' WHERE UserID = 6;

UPDATE Users
SET Birthdate = '1998-02-18' WHERE UserID = 7;

UPDATE Users
SET Birthdate = '1982-04-30' WHERE UserID = 8;

UPDATE Users
SET Birthdate = '1991-07-08' WHERE UserID = 9;

UPDATE Users
SET Birthdate = '1975-12-12' WHERE UserID = 10;

SELECT * FROM Users;

/*13. **Moderate - Oldest User:**
    Find the oldest user (based on date of birth) and display their name and birthdate.*/
SELECT FirstName, LastName, Birthdate
FROM Users
ORDER BY Birthdate ASC
LIMIT 1;

SELECT * FROM Users 
WHERE BirthDate = (SELECT MIN(BirthDate) FROM Users);

/* 14. **Moderate - Payment Distribution:**
    Display the distribution of payment amounts (e.g., number of payments between certain ranges).*/
    SELECT CASE
        WHEN Amount >= 0 AND Amount < 200 THEN '0-199'
        WHEN Amount >= 200 AND Amount < 400 THEN '100-399'
        WHEN Amount >= 400 AND Amount < 600 THEN '400-600'
        ELSE '700 and above'
    END AS PaymentRange,
    COUNT(*) AS PaymentCount
FROM Payments
GROUP BY PaymentRange;

/*15. **Moderate - Card Usage Frequency:**
    Calculate the average number of transactions per card and display it.*/
SELECT AVG(CardID) AS AverageTransactionsPerCard
FROM (
    SELECT CardID, COUNT(*) AS TransactionCount
    FROM Transactions
    GROUP BY CardID
) AS TransactionCounts;

### Advanced Problem Statements:

/*1. **Advanced - Credit Utilization:**
   Calculate and display the credit utilization ratio (total balance / total credit limit)*100 for each user.*/
SELECT CardID, CreditLimit, Balance, 
(Balance/CreditLimit * 100) as CardUtilization 
FROM creditcards;

/*2. **Advanced - Frequent Transactors:**
   List users who have made more than 10 transactions and display their names along with the transaction count.*/
SELECT u.FirstName, u.LastName, COUNT(c.CardID) AS TransactionCount 
FROM Users u JOIN CreditCards c ON u.userid = c.userid
GROUP BY c.CardID 
ORDER BY TransactionCount;

/* 3. **Advanced - Highest Payment Amount:**
   Find the user who made the highest payment and display their name and the payment amount.*/
SELECT u.FirstName, u.LastName, t.Amount FROM Users u
JOIN transactions t on u.userid = t.TransactionID
ORDER BY t.Amount DESC LIMIT 3;

/*4. **Advanced - Average Payment Delay:**
   Calculate the average delay between the due date and the actual payment date for bill payments.*/
   
SELECT AVG(DATEDIFF(PaymentDate, CURRENT_DATE())) AS AverageDelay
FROM Payments
WHERE PaymentDate > CURRENT_Date();

/*5. **Advanced - Largest Transaction Difference:**
   Find the second highest transaction and retrive the FirstName and LastName of user.*/
 SELECT u.FirstName, u.LastName,
 LEAD(t.Amount, 1) OVER(ORDER BY Amount DESC) AS SecondHighestTransaction
 FROM Users u 
 JOIN Transactions t ON u.userid = t.TransactionID;

/*6. **Advanced - Fraudulent Transactions:**
   Detect any transactions where the transaction amount exceeds the credit card's available balance.*/
SELECT t.TransactionID, t.CardID, t.Amount, c.Balance AS AvailableBalance
FROM Transactions t
JOIN CreditCards c ON t.CardID = c.CardID
WHERE t.Amount > c.Balance;

/*7. **Advanced - Most Common Transaction Type:**
   Determine the most common transaction type across all transactions and display it.*/
SELECT TransactionType, COUNT(*) AS TransactionCount
FROM Transactions
GROUP BY TransactionType
ORDER BY TransactionCount DESC LIMIT 1;

/*8. **Advanced - Payment Trend Analysis:**
   Analyze the trend of payments over the last 6 months and display the total payment amounts for each month.*/
   SELECT 
    YEAR(PaymentDate) AS PaymentYear, 
    MONTH(PaymentDate) AS PaymentMonth, 
    SUM(Amount) AS TotalPaymentAmount
FROM Payments
WHERE PaymentDate >= DATE_SUB(CURRENT_DATE(), INTERVAL 6 MONTH)
GROUP BY PaymentYear, PaymentMonth
ORDER BY PaymentYear, PaymentMonth;

/*9. **Advanced - Total Payment Amount:**
   Calculate the total amount paid by all users and display it.*/
SELECT SUM(Amount) AS TotalAmountPaid
FROM Payments;

/*10. **Advanced - Active Users:**
    Identify users who have made transactions in the last 30 days and display their names.*/
SELECT u.FirstName, u.LastName, t.TimeStamp
FROM Users u
JOIN Transactions t 
ON u.UserID = t.TransactionID
WHERE t.TimeStamp > DATE_SUB(current_date(), INTERVAL 30 DAY);

/*11. **Advanced - Average Age:**
    Calculate the average age of all users based on their birthdates.*/
SELECT AVG(YEAR(CURDATE()) - YEAR(Birthdate) - (DATE_FORMAT(CURDATE(), '%m%d') < DATE_FORMAT(Birthdate, '%m%d'))) AS AverageAge
FROM Users;

SELECT AVG(TIMESTAMPDIFF(YEAR, Birthdate, CURDATE())) AS AverageAge
FROM Users;


/* 12. **Advanced - Frequent Withdrawal Users:**
    List users who have made more than 2 withdrawals and display their names along with the withdrawal count.*/
SELECT u.FirstName, u.LastName, COUNT(*) AS WithdrawalCount
FROM Users u
INNER JOIN Transactions t ON u.UserID = t.TransactionID
WHERE t.TransactionType = 'Withdrawal'
GROUP BY u.FirstName, u.LastName
HAVING WithdrawalCount > 0;

/*13. **Advanced - Monthly Transaction Count:**
    Display a bar chart of the monthly transaction counts over the past year.*/

/*14. **Advanced - Payment Patterns:**
    Analyze the pattern of payment amounts (e.g., increasing, decreasing) over time.*/

/*15. **Advanced - Highest Average Transaction:**
    Find the user with the highest average transaction amount and display their name and average amount. */
SELECT u.FirstName, u.LastName, AVG(t.Amount) AS AverageTransactionAmount
FROM Users u
JOIN Transactions t ON u.UserID = t.TransactionID
GROUP BY u.FirstName, u.LastName
ORDER BY AverageTransactionAmount DESC
LIMIT 1;
