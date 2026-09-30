Sección 1 — INNER JOIN

1. Inscripciones con nombre del estudiante, curso y % completado

| student_name    | course_title           | completion_percentage |
| --------------- | ---------------------- | --------------------- |
| Emily Watson    | Intro to Python        | 85                    |
| Emily Watson    | Web Design Basics      | 60                    |
| Klaus Weber     | Intro to Python        | 92                    |
| Klaus Weber     | Data Analysis with SQL | 78                    |
| Lucia Fernandes | Web Design Basics      | 5                     |
| Lucia Fernandes | Digital Marketing 101  | 3                     |
| Marco Rossi     | Advanced Python        | 95                    |
| Marco Rossi     | Intro to Python        | 88                    |
| Yuki Nakamura   | Data Analysis with SQL | 45                    |
| Yuki Nakamura   | UI/UX Fundamentals     | 0                     |
| Pierre Dubois   | UI/UX Fundamentals     | 0                     |
| Priya Sharma    | Digital Marketing 101  | 70                    |
| Priya Sharma    | Intro to Python        | 55                    |
| Pierre Dubois   | Data Analysis with SQL | 20                    |
| Emily Watson    | Advanced Python        | 40                    |
| Lucia Fernandes | Advanced Python        | 0                     |

2. Estudiantes que aprobaron al menos un curso

| name         | email                             | approved_course        |
| ------------ | --------------------------------- | ---------------------- |
| Emily Watson | emily.watson@student.edutrack.com | Intro to Python        |
| Klaus Weber  | klaus.weber@student.edutrack.com  | Intro to Python        |
| Klaus Weber  | klaus.weber@student.edutrack.com  | Data Analysis with SQL |
| Marco Rossi  | marco.rossi@student.edutrack.com  | Advanced Python        |
| Marco Rossi  | marco.rossi@student.edutrack.com  | Intro to Python        |
| Priya Sharma | priya.sharma@student.edutrack.com | Digital Marketing 101  |

3. Promedio de completado por instructor (desc)

| instructor_name    | avg_completion         |
| ------------------ | ---------------------- |
| Marta López        | 66.1428571428571429    |
| Carlos Vega        | 40.0000000000000000    |
| Lucia Prades       | 36.5000000000000000    |
| Pending assignment | 0.00000000000000000000 |

Sección 2 — LEFT JOIN

4. Estudiantes sin inscripciones

| id | name          | email                              |
| -- | ------------- | ---------------------------------- |
| 8  | Giulia Romano | giulia.romano@student.edutrack.com |

5. Cursos sin inscripciones

| id | title           | category  |
| -- | --------------- | --------- |
| 7  | Email Campaigns | Marketing |

Sección 3 — Agregación entre tablas

6. Estudiantes con más de un curso inscrito

| name            | total_courses |
| --------------- | ------------- |
| Lucia Fernandes | 3             |
| Yuki Nakamura   | 2             |
| Marco Rossi     | 2             |
| Pierre Dubois   | 2             |
| Klaus Weber     | 2             |
| Priya Sharma    | 2             |
| Emily Watson    | 3             |

7. Ingresos totales por categoría (monthly_fee)

| category    | total_revenue |
| ----------- | ------------- |
| Marketing   | 59.98         |
| Programming | 409.93        |
| Design      | 169.96        |
| Data        | 179.97        |

8. Instructores y cantidad de estudiantes inscritos

| instructor_name    | total_students |
| ------------------ | -------------- |
| Carlos Vega        | 5              |
| Pending assignment | 2              |
| Lucia Prades       | 2              |
| Marta López        | 7              |

Sección 4 — Integridad de datos

9. Inscripciones con student_id inexistente

Resultado: 0 registros huérfanos. Success. No rows returned

10. Inscripciones con course_id inexistente

Resultado: 0 registros huérfanos. Success. No rows returned