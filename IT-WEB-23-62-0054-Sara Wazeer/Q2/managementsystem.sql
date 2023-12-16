-- ii
-- Create Courses table if it doesn't exist
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Courses')
BEGIN
    CREATE TABLE Courses (
        CourseId INT PRIMARY KEY,
        Name VARCHAR(255),
        LecturerName VARCHAR(255)
    );

    -- Add data to Courses table
    INSERT INTO Courses (CourseId, Name, LecturerName) VALUES
    (1, 'Web Development', 'M.M. Herath'),
    (2, 'Graphic Design', 'J.S.V. Piyasena'),
    (3, 'Mobile App Development', 'K.K.S. Dias'),
    (4, 'Java', 'U.H.S. Perera');
END

-- Create Students table if it doesn't exist
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Students')
BEGIN
    CREATE TABLE Students (
        StudentId INT PRIMARY KEY IDENTITY(1,1),
        Name VARCHAR(255),
        City VARCHAR(255),
        CourseId INT,
        FOREIGN KEY (CourseId) REFERENCES Courses(CourseId)
    );
END

-- Reset the identity seed for Students table
DBCC CHECKIDENT ('Students', RESEED, 10);

-- Add more data to Students table
INSERT INTO Students (StudentId, Name, City, CourseId) VALUES
(5, 'Kasun Gamage', 'Kandy', 2),
(6, 'Daniel Sam', 'Jaffna', 3),
(7, 'Hansi Silva', 'Colombo', 1),
(8, 'Ranidu Heath', 'Matara', 3),
(9, 'Praneeth Wijasinghe', 'Kandy', 4),
(10, 'Nuwani Herath', 'Rathnapura', 1);

-- iv
-- a
SELECT * FROM Students;
-- b
SELECT StudentId, Name, City FROM Students WHERE City = 'Kandy';
-- c
UPDATE Students SET City = 'Galle' WHERE StudentId = 14;
-- d
SELECT Students.*, Courses.Name AS CourseName
FROM Students
JOIN Courses ON Students.CourseId = Courses.CourseId;
