-- ============================================================
-- 1- Consultas — INNER JOIN
-- ============================================================
 
-- Query1. - Listar todas las inscripciones mostrando el nombre completo del estudiante, el título del curso y su porcentaje de completado  
SELECT s.name AS student_name,
       c.title AS course_title,
       e.completion_percentage
FROM enrollments e
INNER JOIN students s ON e.student_id = s.id
INNER JOIN courses c ON e.course_id = c.id;

-- Query2. - Mostrar el nombre y email de los estudiantes que han aprobado al menos un curso, junto con el título del curso que aprobaron  
SELECT s.name,
       s.email,
       c.title AS approved_course
FROM enrollments e
INNER JOIN students s ON e.student_id = s.id
INNER JOIN courses c ON e.course_id = c.id
WHERE e.passed = TRUE;

-- Query3. - Calcular el porcentaje de completado medio por instructor, ordenado de mayor a menor
SELECT c.instructor_name,
       AVG(e.completion_percentage) AS avg_completion
FROM enrollments e
INNER JOIN courses c ON e.course_id = c.id
GROUP BY c.instructor_name
ORDER BY avg_completion DESC;

-- ============================================================
-- 2- Consultas — LEFT JOIN (detección de datos faltantes)  
-- ============================================================
 
-- Query4. - Encontrar todos los estudiantes que no tienen ninguna inscripción — se registraron en la plataforma pero nunca se apuntaron a un curso  
SELECT s.id, s.name, s.email
FROM students s
LEFT JOIN enrollments e ON s.id = e.student_id
WHERE e.id IS NULL;

-- Query5. - Encontrar todos los cursos que no tienen ninguna inscripción — existen en el catálogo pero nadie se ha apuntado
SELECT c.id, c.title, c.category
FROM courses c
LEFT JOIN enrollments e ON c.id = e.course_id
WHERE e.id IS NULL;

-- ============================================================
-- 3- Consultas — Agregación entre tablas
-- ============================================================
 
-- Query6. - Contar cuántos cursos tiene inscrito cada estudiante; mostrar solo los estudiantes inscritos en más de un curso  
SELECT s.name,
       COUNT(e.course_id) AS total_courses
FROM students s
INNER JOIN enrollments e ON s.id = e.student_id
GROUP BY s.id
HAVING COUNT(e.course_id) > 1;

-- Query7. - Calcular los ingresos totales por categoría usando el precio del curso de la tabla courses (monthly_fee), no el pago histórico de enrollments  
SELECT c.category,
       SUM(c.monthly_fee) AS total_revenue
FROM enrollments e
INNER JOIN courses c ON e.course_id = c.id
GROUP BY c.category;

-- Query8. - Mostrar cada instructor junto con el número de estudiantes inscritos actualmente en sus cursos
SELECT c.instructor_name,
       COUNT(e.student_id) AS total_students
FROM courses c
INNER JOIN enrollments e ON c.id = e.course_id
GROUP BY c.instructor_name;

-- ============================================================
-- 4- Consultas — Integridad de datos  
-- ============================================================
 
-- Query9. - Comprobar si hay inscripciones cuyo student_id no corresponde a ningún estudiante existente (registros huérfanos)  
SELECT e.*
FROM enrollments e
LEFT JOIN students s ON e.student_id = s.id
WHERE s.id IS NULL;

-- Query10. - Comprobar si hay inscripciones cuyo course_id no corresponde a ningún curso existente (registros huérfanos)
SELECT e.*
FROM enrollments e
LEFT JOIN courses c ON e.course_id = c.id
WHERE c.id IS NULL;
