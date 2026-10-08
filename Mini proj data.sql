USE skillbridge;

SELECT * FROM users;

-- 1. View all student users
SELECT id, full_name, email, college, course, year, level, availability 
FROM users;

-- 2. View all skills & categories
SELECT s.id, s.name AS skill_name, c.name AS category, s.description 
FROM skills s 
JOIN skill_categories c ON s.category_id = c.id;

-- 3. View skill exchange requests
SELECT * FROM skill_exchange_requests;