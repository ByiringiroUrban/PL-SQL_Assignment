# Names: 
## Byiringiro Urbain Bobola 27150
## Serutamba heritier 27141
## Mwungeri Bonheur 29337
## Gakiza Lievin     28391

# PL-SQL_Assignment

# Screeenshoot images

<img width="752" height="208" alt="image" src="https://github.com/user-attachments/assets/e0458509-9cc6-45c6-9533-8a3911897c6a" />
<img width="780" height="250" alt="image" src="https://github.com/user-attachments/assets/57246907-e277-4702-9086-fc9d98f39d2d" />
<img width="816" height="220" alt="image" src="https://github.com/user-attachments/assets/db39d451-52a3-4f4d-b384-636d68c7595f" />



# Student-Course Enrollment SQL Project

## 📖 Overview
This project demonstrates fundamental database concepts using SQL:
- Creating normalized tables with constraints (PK, FK, UNIQUE, NOT NULL, CHECK).
- Performing different types of joins (INNER, LEFT, RIGHT, FULL).
- Creating indexes to optimize query performance.
- Creating a view to simplify data access.
- Generating a simple report to explain the design and results.

It is designed as part of a **Class Quiz (Group Work)** assignment.

---

## 🗂 Database Schema
The project uses **three tables**:

1. **students**
   - Stores student details.
   - Constraints: `PRIMARY KEY`, `UNIQUE(email)`, `NOT NULL`.

2. **courses**
   - Stores available courses.
   - Constraints: `PRIMARY KEY`, `CHECK(credits > 0)`.

3. **enrollments**
   - Join table linking students to courses.
   - Constraints: `PRIMARY KEY`, `FOREIGN KEY`, `UNIQUE(student_id, course_id)`, `CHECK(grade)`.

### ER Diagram (Conceptual)




---

## ⚙️ Setup Instructions

### 1. Requirements
- PostgreSQL (preferred) or MySQL.
- VS Code with SQL extension (e.g., SQLTools, PostgreSQL).

### 2. Steps
1. Create a new database:
   ```sql
   CREATE DATABASE dbname;

