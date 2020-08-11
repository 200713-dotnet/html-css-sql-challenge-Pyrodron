CREATE DATABASE p1Challenge;
GO

USE p1Challenge;
GO

CREATE SCHEMA Project;
GO

CREATE TABLE Project.Department(
  ID INT IDENTITY(1, 1) PRIMARY KEY,
  [Name] VARCHAR(100),
  [Location] VARCHAR(250)
);
GO

CREATE TABLE Project.Employee(
  ID INT IDENTITY(1, 1) PRIMARY KEY,
  FirstName VARCHAR(50),
  LastName VARCHAR(50),
  SSN VARCHAR(10) NOT NULL,
  DeptID INT NOT NULL FOREIGN KEY REFERENCES Project.Department(ID)
);
GO

CREATE TABLE Project.EmpDetails(
  EmployeeID INT NOT NULL FOREIGN KEY REFERENCES Project.Employee(ID),
  Salary DECIMAL(18, 2) NOT NULL,
  Address1 VARCHAR(150),
  Address2 VARCHAR(150),
  City VARCHAR(25),
  [State] VARCHAR(2),
  Country VARCHAR(10)
);
GO

INSERT INTO Project.Department VALUES
('Marketing', 'Austin, TX'), ('Development', 'Dallas, TX'), ('Management', 'Grand Rapids, MI');
GO

INSERT INTO Project.Employee VALUES
('Tina', 'Smith', '1234567890', 1), ('Kyle', 'Dick', '9999999999', 2), ('Fred', 'Belottle', '0000000000', 3);
GO

INSERT INTO Project.EmpDetails VALUES
(1, 40,000.00, '123 Fake Street', '', 'Somewhere', 'TX', 'USA'), (2, 63,000.00, '456 Wall Street', 'NULL', 'Fake', 'TX', 'USA'), (3, 10,000.00, '789 Trainer Street', 'NULL', 'Nowhere', 'MI', 'USA');
GO

CREATE FUNCTION Project.EmployeesFromDepartment(@empID INT)
RETURNS TABLE
AS
RETURN
  SELECT *
  FROM Project.Employee WHERE ID = @empID;
GO

SELECT * FROM Project.EmployeesFromDepartment(1);

