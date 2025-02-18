-- use this to create database
CREATE DATABASE ward;

-- this will use created database
USE ward;


CREATE TABLE residents (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    house_no VARCHAR(10),
    occupation VARCHAR(50),
    business VARCHAR(50),
    no_of_children INT DEFAULT 0
);

INSERT INTO residents (name, age, house_no, occupation, business, no_of_children) VALUES
('Aarav Sharma', 35, 'H101', 'Teacher', 'None', 2),
('Kavya Gupta', 28, 'H102', 'Engineer', 'Freelancer', 0),
('Rohan Iyer', 42, 'H103', 'Doctor', 'Clinic', 3),
('Priya Desai', 30, 'H104', 'Designer', 'Boutique', 0),
('Amit Kumar', 45, 'H105', 'Businessman', 'Retail', 4),
('Sanya Singh', 33, 'H106', 'Lawyer', 'None', 0),
('Anjali Verma', 27, 'H107', 'Software Developer', 'Startup', 0),
('Rajesh Patel', 50, 'H108', 'Farmer', 'Dairy', 5),
('Meera Joshi', 29, 'H109', 'Artist', 'Gallery', 0),
('Vikram Chauhan', 38, 'H110', 'Police Officer', 'None', 2),
('Deepika Reddy', 41, 'H111', 'Chef', 'Restaurant', 3),
('Aditya Nair', 26, 'H112', 'Student', 'None', 0),
('Neha Mehta', 34, 'H113', 'HR Manager', 'None', 1),
('Siddharth Malhotra', 37, 'H114', 'Scientist', 'None', 0),
('Pooja Yadav', 31, 'H115', 'Writer', 'Publishing', 2),
('Karan Kapoor', 39, 'H116', 'Photographer', 'Studio', 3),
('Isha Jain', 25, 'H117', 'Researcher', 'None', 0),
('Ravi Thakur', 44, 'H118', 'Architect', 'Construction', 4),
('Simran Gill', 28, 'H119', 'Banker', 'None', 0),
('Arjun Das', 46, 'H120', 'Shopkeeper', 'Retail', 3);



SELECT * FROM residents;

-- INSERT INTO residents (name, age, house_no, occupation, business, no_of_children) VALUES
-- ('Aarav Sharma', 35, 'H101', 'Teacher', 'None', 2),
-- ('Kavya Gupta', 28, 'H102', 'Engineer', 'Freelancer', 0);


-- SELECT name, house_no, COUNT(*) 
-- FROM residents 
-- GROUP BY name, house_no 
-- HAVING COUNT(*) > 1;

-- DELETE r1
-- FROM residents r1
-- JOIN residents r2
-- ON r1.name = r2.name 
--    AND r1.house_no = r2.house_no 
--    AND r1.id > r2.id;

-- for adding users use the following commands(for the login purpose):
-- run this after running migration and after running server (this will insert data in auth_user)

INSERT INTO auth_user (username, password, first_name, last_name, email, is_staff, is_active, is_superuser, date_joined) 
VALUES 
('Aarav Sharma', 'pbkdf2_sha256$870000$u7hAKuIZrCxDjIvsHa8bpq$3ehVmELniSBJAHor7SZ87qdA5WOGk/EsL03EwRprA3k=', 'Aarav', 'Sharma', 'aarav@example.com', 0, 1, 0, NOW()),
('Kavya Gupta', 'pbkdf2_sha256$870000$u7hAKuIZrCxDjIvsHa8bpq$3ehVmELniSBJAHor7SZ87qdA5WOGk/EsL03EwRprA3k=', 'Kavya', 'Gupta', 'kavya@example.com', 0, 1, 0, NOW()),
('Rohan Iyer', 'pbkdf2_sha256$870000$u7hAKuIZrCxDjIvsHa8bpq$3ehVmELniSBJAHor7SZ87qdA5WOGk/EsL03EwRprA3k=', 'Rohan', 'Iyer', 'rohan@example.com', 0, 1, 0, NOW()),
('Priya Desai', 'pbkdf2_sha256$870000$u7hAKuIZrCxDjIvsHa8bpq$3ehVmELniSBJAHor7SZ87qdA5WOGk/EsL03EwRprA3k=', 'Priya', 'Desai', 'priya@example.com', 0, 1, 0, NOW()),
('Amit Kumar', 'pbkdf2_sha256$870000$u7hAKuIZrCxDjIvsHa8bpq$3ehVmELniSBJAHor7SZ87qdA5WOGk/EsL03EwRprA3k=', 'Amit', 'Kumar', 'amit@example.com', 0, 1, 0, NOW()),
('Sanya Singh', 'pbkdf2_sha256$870000$u7hAKuIZrCxDjIvsHa8bpq$3ehVmELniSBJAHor7SZ87qdA5WOGk/EsL03EwRprA3k=', 'Sanya', 'Singh', 'sanya@example.com', 0, 1, 0, NOW()),
('Anjali Verma', 'pbkdf2_sha256$870000$u7hAKuIZrCxDjIvsHa8bpq$3ehVmELniSBJAHor7SZ87qdA5WOGk/EsL03EwRprA3k=', 'Anjali', 'Verma', 'anjali@example.com', 0, 1, 0, NOW()),
('Rajesh Patel', 'pbkdf2_sha256$870000$u7hAKuIZrCxDjIvsHa8bpq$3ehVmELniSBJAHor7SZ87qdA5WOGk/EsL03EwRprA3k=', 'Rajesh', 'Patel', 'rajesh@example.com', 0, 1, 0, NOW()),
('Meera Joshi', 'pbkdf2_sha256$870000$u7hAKuIZrCxDjIvsHa8bpq$3ehVmELniSBJAHor7SZ87qdA5WOGk/EsL03EwRprA3k=', 'Meera', 'Joshi', 'meera@example.com', 0, 1, 0, NOW()),
('Vikram Chauhan', 'pbkdf2_sha256$870000$u7hAKuIZrCxDjIvsHa8bpq$3ehVmELniSBJAHor7SZ87qdA5WOGk/EsL03EwRprA3k=', 'Vikram', 'Chauhan', 'vikram@example.com', 0, 1, 0, NOW()),
('Deepika Reddy', 'pbkdf2_sha256$870000$u7hAKuIZrCxDjIvsHa8bpq$3ehVmELniSBJAHor7SZ87qdA5WOGk/EsL03EwRprA3k=', 'Deepika', 'Reddy', 'deepika@example.com', 0, 1, 0, NOW()),
('Aditya Nair', 'pbkdf2_sha256$870000$u7hAKuIZrCxDjIvsHa8bpq$3ehVmELniSBJAHor7SZ87qdA5WOGk/EsL03EwRprA3k=', 'Aditya', 'Nair', 'aditya@example.com', 0, 1, 0, NOW()),
('Neha Mehta', 'pbkdf2_sha256$870000$u7hAKuIZrCxDjIvsHa8bpq$3ehVmELniSBJAHor7SZ87qdA5WOGk/EsL03EwRprA3k=', 'Neha', 'Mehta', 'neha@example.com', 0, 1, 0, NOW()),
('Pooja Yadav', 'pbkdf2_sha256$870000$u7hAKuIZrCxDjIvsHa8bpq$3ehVmELniSBJAHor7SZ87qdA5WOGk/EsL03EwRprA3k=', 'Pooja', 'Yadav', 'pooja@example.com', 0, 1, 0, NOW()),
('Karan Kapoor', 'pbkdf2_sha256$870000$u7hAKuIZrCxDjIvsHa8bpq$3ehVmELniSBJAHor7SZ87qdA5WOGk/EsL03EwRprA3k=', 'Karan', 'Kapoor', 'karan@example.com', 0, 1, 0, NOW()),
('Isha Jain', 'pbkdf2_sha256$870000$u7hAKuIZrCxDjIvsHa8bpq$3ehVmELniSBJAHor7SZ87qdA5WOGk/EsL03EwRprA3k=', 'Isha', 'Jain', 'isha@example.com', 0, 1, 0, NOW()),
('Ravi Thakur', 'pbkdf2_sha256$870000$u7hAKuIZrCxDjIvsHa8bpq$3ehVmELniSBJAHor7SZ87qdA5WOGk/EsL03EwRprA3k=', 'Ravi', 'Thakur', 'ravi@example.com', 0, 1, 0, NOW()),
('Simran Gill', 'pbkdf2_sha256$870000$u7hAKuIZrCxDjIvsHa8bpq$3ehVmELniSBJAHor7SZ87qdA5WOGk/EsL03EwRprA3k=', 'Simran', 'Gill', 'simran@example.com', 0, 1, 0, NOW()),
('Karan Rajiwade', 'pbkdf2_sha256$870000$u7hAKuIZrCxDjIvsHa8bpq$3ehVmELniSBJAHor7SZ87qdA5WOGk/EsL03EwRprA3k=', 'Karan', 'Rajiwade', 'karanraj@example.com', 0, 1, 0, NOW());

UPDATE residents 
JOIN auth_user ON residents.name = auth_user.username 
SET residents.user_id = auth_user.id
WHERE residents.id > 0;