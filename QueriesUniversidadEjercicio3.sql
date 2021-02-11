SELECT count(*) FROM persona WHERE tipo = 'alumno'
SELECT COUNT(*) FROM persona WHERE tipo = 'alumno' AND fecha_nacimiento BETWEEN '1999-01-01' AND '1999-12-31'
SELECT d.nombre, count(*) AS "numero_profesores" FROM departamento d LEFT JOIN profesor p ON p.id_departamento = d.id WHERE p.id_profesor IS NOT NULL GROUP BY d.nombre having count(*)>=1 ORDER BY numero_profesores DESC
SELECT d.nombre, count(*) AS "numero_profesores" FROM departamento d LEFT JOIN profesor p ON p.id_departamento = d.id WHERE p.id_profesor IS NOT NULL GROUP BY d.nombre having count(*)>=1 UNION SELECT d.nombre, "0" AS "numero_profesores" FROM departamento d LEFT JOIN profesor p ON p.id_departamento = d.id WHERE p.id_profesor IS NULL ORDER BY numero_profesores DESC
SELECT g.nombre, count(*) AS "numero_asignaturas" FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado WHERE a.id IS NOT NULL GROUP BY g.nombre having count(*)>=1 UNION SELECT g.nombre, 0 AS "numero_asignaturas" FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado WHERE a.id IS NULL ORDER BY numero_asignaturas DESC
SELECT g.nombre, count(*) AS "numero_asignaturas" FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre having count(*)>40 



SELECT * FROM persona WHERE tipo IN ("alumno") ORDER BY fecha_nacimiento ASC LIMIT 1
SELECT * FROM persona per LEFT JOIN profesor pr ON per.id = pr.id_profesor LEFT JOIN asignatura asi ON pr.id_profesor = asi.id_profesor WHERE per.tipo IN ("profesor") AND asi.nombre IS NULL AND pr.id_departamento IS NOT NULL