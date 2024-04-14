Шаг 1: Создание базы данных academy

CREATE DATABASE academy;


Шаг 2: Создание таблиц

-- Создаем таблицу Students
CREATE TABLE Students (
    s_id INT PRIMARY KEY,
    name VARCHAR(100),
    start_year INT
);

-- Создаем таблицу Courses
CREATE TABLE Courses (
    c_no INT PRIMARY KEY,
    title VARCHAR(100),
    hours INT
);

-- Создаем таблицу Exams
CREATE TABLE Exams (
    s_id INT,
    c_no INT,
    score DECIMAL(5,2),
    FOREIGN KEY (s_id) REFERENCES Students(s_id),
    FOREIGN KEY (c_no) REFERENCES Courses(c_no)
);
В этом скрипте я использовала тип данных INT для идентификаторов и начального года, VARCHAR(100) для имён и названий курсов, и DECIMAL(5,2) для оценок.

Шаг 3: Добавление записей в таблицы

-- Добавляем записи в таблицу Students
INSERT INTO Students (s_id, name, start_year) VALUES
(1, 'Иван Иванов', 2020),
(2, 'Мария Петрова', 2021),
(3, 'Алексей Смирнов', 2022);

-- Добавляем записи в таблицу Courses
INSERT INTO Courses (c_no, title, hours) VALUES
(101, 'Математика', 64),
(102, 'Физика', 72),
(103, 'История', 54);

-- Добавляем записи в таблицу Exams
INSERT INTO Exams (s_id, c_no, score) VALUES
(1, 101, 4.5),
(1, 102, 4.0),
(2, 101, 3.5);
Эти записи являются примерами. 

Шаг 4: Запрос на поиск студентов, не сдавших экзамены

SELECT *
FROM Students
WHERE s_id NOT IN (SELECT DISTINCT s_id FROM Exams);
Этот запрос возвращает всех студентов, которые еще не сдали ни одного экзамена.

Шаг 5: Запрос на возвращение списка студентов и количества сданных ими экзаменов
sql
SELECT Students.s_id, Students.name, COUNT(Exams.c_no) AS exams_count
FROM Students
JOIN Exams ON Students.s_id = Exams.s_id
GROUP BY Students.s_id, Students.name
HAVING COUNT(Exams.c_no) > 0;

Этот запрос возвращает список студентов, у которых есть сданные экзамены, и количество этих экзаменов.

Шаг 6: Список курсов со средним баллом по экзамену, отсортированный по убыванию среднего балла
sql
Copy code
SELECT Courses.c_no, title, AVG(score) as average_score
FROM Courses
JOIN Exams ON Courses.c_no = Exams.c_no
GROUP BY Courses.c_no
ORDER BY average_score DESC;
Этот запрос возвращает список курсов со средним баллом по экзаменам, отсортированный по убыванию среднего балла.
