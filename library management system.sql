CREATE DATABASE LIBRARY;
USE LIBRARY;
SELECT *FROM Branch;
SELECT  Branch_no, Manager_Id, Branch_address, Contact_no FROM Branch;
INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no) VALUES
(1, 123, 'AMain St', '9876543210'),
 (2,124, 'Hill road','9992344567'),
 (3,125,'lotus street','8978564534'),
 (4,126,'pine street','9089785645'),
 (5,127,'river drive','9823456700');
 DESC Branch;

USE LIBRARY;
USE LIBRARY;
CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(25),
    Position VARCHAR(10),
    Salary DECIMAL(10, 2),
    Branch_no INT);
    DESC Employee;
    SELECT *FROM Employee;
SELECT  Emp_Id,Emp_name, Position,Salary,Branch_no FROM Employee;
INSERT INTO Employee(Emp_Id,Emp_name, Position,Salary,Branch_no) VALUES
( 101,'ANUSREE','manager',100000,4),
(202,'AMEYA','Builder',40000,3),
(303,'SALINI','Sales',25000,4),
(404,'JECOB','Engineer',100000,1),
(505,'PREENU','Police',50000,5),
(606,'RENIIL','teacher',60000,2),
(707,'DHILEEP','Doctor',400000,5),
(808,'KIRAN','Engineer',80000,2);
DESC Employee;
    
    CREATE TABLE Books (
    ISBN VARCHAR(13) PRIMARY KEY,
    Book_title VARCHAR(50),
    Category VARCHAR(10),
    Rental_Price DECIMAL(10, 2),
    Status VARCHAR(3) CHECK (Status IN ('yes', 'no')),
    Author VARCHAR(25),
    Publisher VARCHAR(25)
);
SELECT *FROM Books;
SELECT ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher FROM Books;
INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) VALUES 
('9780131103627', 'The Great Adventure','Fiction', 299.99,'yes', 'John Doe', 'Doe Publishing'),
('9780201485677', 'Learning SQL','Education', 199.99, 'no', 'Jane Smith', 'Tech Press'),
('9780321751041', 'Mastering Algorithms','Science', 149.99, 'yes', 'Alan Turing', 'CompSci Books'),
('978144935579', 'Python Cookbook','Program', 249.99, 'no', 'David Beazley', 'O\'Reilly Media'),
('9783161484100', 'Clean Code','Program', 299.99, 'yes', 'Robert Martin', 'Prentice Hall');

DESC Books;
USE LIBRARY;
CREATE TABLE Customer (
    Cust_Id INT PRIMARY KEY,    Cust_name VARCHAR(25),
    Cust_address TEXT,
    Reg_date DATE
);

SELECT *FROM Customer;
SELECT Cust_Id,Cust_name,Cust_address,Reg_date FROM Customer;
INSERT INTO Customer(Cust_Id,Cust_name,Cust_address,Reg_date) VALUES 
(1, 'John',' Maple Street', '2025-02-12'),
(2, 'Janelia',' Oak Avenue', '2023-03-10'),
(3, 'Anu',' Apple Street', '2024-05-12'),
(4, 'Smitha', 'Park Avenue', '2022-07-11'),
(5, 'Jinu', ' Marine Street', '2021-06-12'),
(6, 'Terry', 'Silk Avenue', '2025-09-18');
DESC Customer;
CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(255),
    Issue_date DATE,
    Isbn_book VARCHAR(13),
    FOREIGN KEY (Issued_cust) REFERENCES CUSTOMER(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES BOOKS(ISBN)
);
DESC  IssueStatus;
SELECT *FROM IssueStatus;
SELECT Issue_Id,Issued_cust,Issued_bookname, Issue_date,Isbn_book FROM IssueStatus;
INSERT INTO IssueStatus(Issue_Id,Issued_cust,Issued_bookname, Issue_date,Isbn_book) VALUES 
('1111',1,'The Great Adventure','2025-02-12','9780131103627'),
('2222',2, 'Learning SQL','2023-03-10','9780201485677'),
('3333',3,'Mastering Algorithms','2024-05-12','9780321751041'),
#('4444',4,'PythonCookbook','2022-07-11','978144935579'),
(#'5555',5,'Clean Code','2021-06-12','978316148410'),
('6666',6,'The Great Adventure', '2025-09-18','978013110362');
DESC IssueStatus;
USE LIBRARY;
USE LIBRARY;

CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_bookname VARCHAR(25),
    Return_date DATE,
    Isbn_book VARCHAR(13),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);
DESC ReturnStatus;
SELECT* FROM ReturnStatus; 
SELECT Return_Id, Return_cust, Return_bookname, Return_date, Isbn_book FROM ReturnStatus;

INSERT INTO ReturnStatus(Return_Id, Return_cust, Return_bookname, Return_date, Isbn_book) VALUES
  (10,1,'The Great Adventure','2025-12-12','9780131103627'),
   (20,2, 'Learning SQL','2023-10-10','9780201485677'),
('30',3,'Mastering Algorithms','2024-11-22','9780321751041'),
('40',4,'Python Cookbook','2022-12-11','978144935579');
#(50, 5,'Clean Code','2021-12-12','9783161484100'),
#(60, 6,'The Great Adventure', '2025-12-18','9780131103627');
USE LIBRARY;
# get the book title, category, and rental price of all available books.
 SELECT Book_title , Category, Rental_Price FROM  Books
WHERE status = 'yes';
#List the employee names and their respective salaries in descending order of salary. 
SELECT Emp_name, Salary FROM Employee
ORDER BY Salary DESC;
#get the book titles and the corresponding customers who have issued those books. 
SELECT B.Book_title, C.Cust_name
FROM IssueStatus I
JOIN BOOKS B ON I.Isbn_book = B.ISBN
JOIN CUSTOMER C ON I.Issued_cust = C.Cust_Id;
#Display the total count of books in each category.
SELECT Category, COUNT(*) AS TotalCount
FROM BOOKS
GROUP BY Category;

#Retrieve the employee names and their positions for the employees
 #whose salaries are above Rs.50,000. 
SELECT Emp_name, Position
FROM Employee
WHERE Salary > 50000;
USE LIBRARY;

# 6. List the customer names who registered before 2022-01-01 and 
 #have not issued any books yet. 
SELECT C.Cust_name
FROM Customer C
LEFT JOIN IssueStatus I ON C.Cust_Id = I.Issued_cust
WHERE C.Reg_date < '2022-01-01' AND I.Issue_Id IS NULL;
 #7. Display the branch numbers and the total count of employees in each branch.
SELECT Branch_no, COUNT(*) AS TotalEmployees
FROM Employee
GROUP BY Branch_no;
# Display the names of customers who have issued books in the month of June 2023

SELECT C.Cust_name
FROM IssueStatus I
JOIN Customer C ON I.Issued_cust = C.Cust_Id
WHERE MONTH(I.Issue_date) = 2 AND YEAR(I.Issue_date) = 2025;

# Retrieve book_title from book table containing history.
SELECT Book_title
FROM BOOKS
WHERE Book_title LIKE '%history%';
#10.Retrieve the branch numbers along with the count of 
#employees for branches having more than 5 employees 
SELECT Branch_no, COUNT(*) AS TotalEmployees
FROM Employee
GROUP BY Branch_no
HAVING COUNT(*) < 5;
USE LIBRARY;

#Retrieve the names of employees who manage branches and 
#their respective branch addresses. 

SELECT E.Emp_name AS ManagerName, B.Branch_address
FROM Employee E
JOIN Branch B ON E.Emp_Id = B.Manager_Id;
#Display the names of customers who have issued books
 with a rental price higher than Rs. 25. 
SELECT C.Cust_name
FROM IssueStatus I
JOIN Customer C ON I.Issued_cust = C.Cust_Id
JOIN BOOKS B ON I.Isbn_book = B.ISBN
WHERE B.Rental_Price > 25;



