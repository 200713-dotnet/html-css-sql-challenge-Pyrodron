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

