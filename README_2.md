# Database Fundamentals Assignment

## Introduction
This assignment is designed to enhance your practical skills in managing databases using PostgreSQL. You will install PostgreSQL, create a database, design tables according to a given schema, and perform several queries to manipulate and retrieve data.

## Tasks and Instructions

### 1. Install PostgreSQL
- **Preferred Method:** Docker
- **Instructions:**
  - If installing via Docker, document the commands used.
  - Example command:
    ```bash
    docker run --name postgres -e POSTGRES_PASSWORD=mysecretpassword -d postgres
    ```

### 2. Create Database
- **Database Name:** `academy`
- **Script:**
  - Attach the script used to create the database.
  - Example script:
    ```sql
    CREATE DATABASE academy;
    ```

### 3. Add Tables According to the Schema
- **Schema Image:**
  ![Database Schema](schema.jpg)
- **Instructions:**
  - Create tables as per the attached schema `Figure 1`.
  - Fields, relationships must match the schema; integrity constraints, uniqueness, default values, and data types are at the discretion of the intern.
- **Script:**
  - Attach the script used to create tables.
  - Example script:
    ```sql
    CREATE TABLE students (
        id SERIAL PRIMARY KEY,
        name VARCHAR(100),
        age INT
    );
    ```

### 4. Insert Records into Tables
- **Instructions:**
  - Add a few records to each table.
- **Script:**
  - Attach the script used to insert records.
  - Example script:
    ```sql
    INSERT INTO students (name, age) VALUES ('John Doe', 21);
    ```

### 5. Query to Find Students Who Have Not Passed Any Exams
- **Script:**
  - Attach the script for this query.
  - Example script:
    ```sql
    SELECT * FROM students WHERE id NOT IN (SELECT student_id FROM exams);
    ```

### 6. Query to List Students and the Number of Exams They Have Passed
- **Instructions:**
  - Return only students who have passed at least one exam.
- **Script:**
  - Attach the script for this query.
  - Example script:
    ```sql
    SELECT s.name, COUNT(e.exam_id) AS exams_count
    FROM students s
    JOIN exams e ON s.id = e.student_id
    GROUP BY s.name
    HAVING COUNT(e.exam_id) > 0;
    ```

### 7. List Courses with the Average Exam Score
- **Instructions:**
  - The list should be sorted by the average score in descending order.
- **Script:**
  - Attach the script for this query.
  - Example script:
    ```sql
    SELECT c.name, AVG(e.score) AS average_score
    FROM courses c
    JOIN exams e ON c.id = e.course_id
    GROUP BY c.name
    ORDER BY average_score DESC;
    ```

### 8. *(Optional) Generate Script to Populate Tables with Random Data
- **Instructions:**
  - You may use psql commands or any programming language to generate this data.
- **Script:**
  - Attach the script for data generation.

## Submission Guidelines
Ensure all scripts are correctly attached and documented. Provide clear explanations for each step and the logic behind your SQL queries. This README should accompany your submitted scripts in your GitHub repository.

## Conclusion
This assignment will help solidify your understanding of basic database operations and SQL scripting, preparing you for more advanced database management tasks.
