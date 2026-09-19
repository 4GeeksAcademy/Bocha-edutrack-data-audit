-- ============================================================
-- 1- Consultas — Lectura y filtrado
-- ============================================================
 
-- Query1. Listar todas las inscripciones del curso `'Intro to Python'`, mostrando nombre del estudiante, email y porcentaje de completado
SELECT student_name, student_email, completion_percentage
FROM enrollments
WHERE course_title = 'Intro to Python';

 
-- Query2. Obtener todas las inscripciones donde `completion_percentage` sea menor que 10 — estos son posibles abandonos  
SELECT
    id,
    student_name,
    course_title,
    completion_percentage
FROM enrollments
WHERE completion_percentage < 10;
 
 
-- Query3. Encontrar todas las inscripciones donde el campo instructor sea 'NULL'
SELECT
    id,
    student_name,
    course_title,
    instructor
FROM enrollments
WHERE instructor IS NULL;
 
 
-- Query4. Listar los 5 estudiantes con mayor `completion_percentage` que todavía no han aprobado (`passed = false`)  
SELECT
    student_name,
    course_title,
    completion_percentage,
    passed
FROM enrollments
WHERE passed = false
ORDER BY completion_percentage DESC
LIMIT 5;
 
 
-- Query5. Mostrar todas las inscripciones creadas en el último año, ordenadas por `enrollment_date` descendente
SELECT
    id,
    student_name,
    course_title,
    enrollment_date
FROM enrollments
WHERE enrollment_date >= (CURRENT_DATE - INTERVAL '1 year')
ORDER BY enrollment_date DESC;
 
-- ============================================================
-- 2- Consultas — Corrección de datos
-- ============================================================


-- Query6.  INSERT del registro de inscripción faltante indicado en el brief (el nombre del estudiante, email, curso, fecha y valores iniciales están especificados en los comentarios del archivo `edutrack.sql`)  
INSERT INTO enrollments (
    id, student_id, student_name, student_email,
    course_id, course_title, category, enrollment_date,
    completion_percentage, passed, monthly_fee_paid, instructor
) VALUES (
    18, 3, 'Lucia Fernandes', 'lucia.fernandes@student.edutrack.com',
    5, 'Advanced Python', 'Programming', '2025-04-01',
    0, FALSE, 69.99, 'Carlos Vega'
);
 
 
-- Query7.   UPDATE de todas las inscripciones donde `instructor` sea `NULL` — asignar el valor por defecto `'Pending assignment'`  
UPDATE enrollments
SET instructor = 'Pending assignment'
WHERE instructor IS NULL;
 
 
-- Query8.  DELETE de todas las inscripciones ligadas a las cuentas de prueba importadas (`@test.com`) — confirmar las filas afectadas con un `SELECT` previo  
--     Paso 1: SELECT previo para confirmar qué filas se van a borrar.
SELECT
    id,
    student_name,
    student_email,
    course_title
FROM enrollments
WHERE student_email LIKE '%@test.com';
 
--     Paso 2: DELETE de esas mismas filas.
DELETE FROM enrollments WHERE student_email LIKE '%@test.com';
 
-- ============================================================
-- 3- Consultas — Agregación e informe
-- ============================================================

-- Query9.   Contar el número de inscripciones agrupado por `category`  
SELECT category, COUNT(*) AS total_enrollments
FROM enrollments
GROUP BY category
ORDER BY total_enrollments DESC;


-- Query10.   Calcular el promedio de `completion_percentage` agrupado por `course_title`, ordenado de menor a mayor  
SELECT course_title, ROUND(AVG(completion_percentage), 2) AS avg_completion
FROM enrollments
GROUP BY course_title
ORDER BY avg_completion ASC;


-- Query11.   Mostrar únicamente los cursos con más de 3 inscripciones (usar `HAVING`)  
SELECT course_title, COUNT(*) AS total_enrollments
FROM enrollments
GROUP BY course_title
HAVING COUNT(*) > 3
ORDER BY total_enrollments DESC;


-- Query12.   Calcular los ingresos totales (`SUM` de `monthly_fee_paid`) agrupados por `category`, ordenados de mayor a menor 
SELECT category, SUM(monthly_fee_paid) AS total_revenue
FROM enrollments
GROUP BY category
ORDER BY total_revenue DESC;