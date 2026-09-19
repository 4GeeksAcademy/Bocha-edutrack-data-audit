## Sección 1 — Lectura y filtrado
 
## 1. Inscripciones en 'Intro to Python'
 
Resultado: 5 inscripciones

| student_name | student_email                     | completion_percentage |
| ------------ | --------------------------------- | --------------------- |
| Emily Watson | emily.watson@student.edutrack.com | 85                    |
| Klaus Weber  | klaus.weber@student.edutrack.com  | 92                    |
| Marco Rossi  | marco.rossi@student.edutrack.com  | 88                    |
| James Miller | james.miller@test.com             | 30                    |
| Priya Sharma | priya.sharma@student.edutrack.com | 55                    |

## 2. Posibles abandonos (completion_percentage < 10)
 
Resultado: 4 inscripciones

| id | student_name    | course_title          | completion_percentage |
| -- | --------------- | --------------------- | --------------------- |
| 5  | Lucia Fernandes | Web Design Basics     | 5                     |
| 6  | Lucia Fernandes | Digital Marketing 101 | 3                     |
| 10 | Yuki Nakamura   | UI/UX Fundamentals    | 0                     |
| 11 | Pierre Dubois   | UI/UX Fundamentals    | 0                     |

## 3. Inscripciones con instructor NULL
 
Resultado: 2 inscripciones

| id | student_name  | course_title       | instructor |
| -- | ------------- | ------------------ | ---------- |
| 10 | Yuki Nakamura | UI/UX Fundamentals | null       |
| 11 | Pierre Dubois | UI/UX Fundamentals | null       |

## 4. Top 5 estudiantes con mayor % de completado sin aprobar (passed = false)
 
Resultado: 5 Registros

| student_name  | course_title           | completion_percentage | passed |
| ------------- | ---------------------- | --------------------- | ------ |
| Emily Watson  | Web Design Basics      | 60                    | false  |
| Priya Sharma  | Intro to Python        | 55                    | false  |
| Yuki Nakamura | Data Analysis with SQL | 45                    | false  |
| Emily Watson  | Advanced Python        | 40                    | false  |
| James Miller  | Intro to Python        | 30                    | false  |

## 5. Inscripciones del último año (ordenadas por enrollment_date descendente)
 
Resultado: 0 inscripciones - Success. No rows returned

---
 
## Sección 2 — Corrección de datos
 
## 6. INSERT — registro de inscripción faltante
Resultado: 1 fila insertada (id = 18) - Success. No rows returned

Se agregó la inscripción de Lucia Fernandes al curso 'Advanced Python' (student_id 3, course_id 5, enrollment_date 2025-04-01, completion_percentage 0, passed false, monthly_fee_paid 69.99, instructor 'Carlos Vega')

## 7. UPDATE — instructores NULL → 'Pending assignment'
Resultado: 2 filas actualizadas (ids 10 y 11) - Success. No rows returned
 
Ambas inscripciones del curso 'UI/UX Fundamentals' quedaron con `instructor = 'Pending assignment'` en lugar de NULL.

## 8. DELETE — cuentas de prueba (@test.com)
SELECT previo — filas afectadas: 2
 
| id | student_name | student_email         | course_title      |
| -- | ------------ | --------------------- | ----------------- |
| 13 | James Miller | james.miller@test.com | Intro to Python   |
| 14 | Alex Chen    | alex.chen@test.com    | Web Design Basics |
 
Resultado del DELETE: 2 filas eliminadas (ids 13 y 14). Tabla `enrollments` final: 16 filas (17 originales + 1 insertada − 2 eliminadas). - Success. No rows returned
 
---
 
## Sección 3 — Agregación e informe
 
## 9. Inscripciones por categoría
 
Resultado:
| category    | total_enrollments |
| ----------- | ----------------- |
| Programming | 7                 |
| Design      | 4                 |
| Data        | 3                 |
| Marketing   | 2                 |

## 10. Promedio de completion_percentage por curso (menor a mayor)
 
Resultado:
| course_title           | avg_completion |
| ---------------------- | -------------- |
| UI/UX Fundamentals     | 0.00           |
| Web Design Basics      | 32.50          |
| Digital Marketing 101  | 36.50          |
| Advanced Python        | 45.00          |
| Data Analysis with SQL | 47.67          |
| Intro to Python        | 80.00          |

## 11. Cursos con más de 3 inscripciones (HAVING)
 
Resultado:
| course_title    | total_enrollments |
| --------------- | ----------------- |
| Intro to Python | 4                 |

## 12. Ingresos totales por categoría (mayor a menor)
 
Resultado:
| category    | total_revenue |
| ----------- | ------------- |
| Programming | 409.93        |
| Data        | 179.97        |
| Design      | 169.96        |
| Marketing   | 59.98         |