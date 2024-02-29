USE db_edumanage;

#Se debe de crear un trigger que actualice los cupos de una materia una vez que un alumno
#haya inscrito materias.
SHOW TABLES;
SELECT * FROM tb_materias;
SELECT * FROM tb_inscripciones;

DROP TRIGGER IF EXISTS actualizar_cupos_materia;

DELIMITER //

CREATE TRIGGER actualizar_cupos_materia
BEFORE INSERT ON tb_inscripciones
FOR EACH ROW
BEGIN
    UPDATE tb_materias
    SET cupos_materia = cupos_materia - 1
    WHERE id_materia = NEW.id_materia;
END;
//
DELIMITER ;


#Los insert de todas las tablas se deben de realizar utilizando un procedimiento almacenado
SHOW TABLES;
SELECT * FROM tb_alumnos;
DESCRIBE tb_alumnos;

DELIMITER //
CREATE PROCEDURE pd_insert_alumnos(
    IN carnet_alumno VARCHAR(10),
    IN nombre_alumno VARCHAR(50),
    IN apellido_alumno VARCHAR(50),
    IN edad_alumno INT
)
BEGIN
	INSERT INTO tb_alumnos(id_alumno,carnet_alumno, nombre_alumno, apellido_alumno, edad_alumno)
	VALUES (UUID(),carnet_alumno, nombre_alumno, apellido_alumno, edad_alumno);
END
//
DELIMITER ;

CALL pd_insert_alumnos('1234567890', 'Adriana Paola', 'Mejia Mendez', 18);
CALL pd_insert_alumnos('123', 'Juan', 'Pérez', 20);
CALL pd_insert_alumnos('456', 'María', 'González', 19);
CALL pd_insert_alumnos('789', 'Carlos', 'Martínez', 18);
CALL pd_insert_alumnos('987', 'Laura', 'López', 17);
CALL pd_insert_alumnos('654', 'Pedro', 'Sánchez', 20);
CALL pd_insert_alumnos('321', 'Ana', 'Ramírez', 20);
CALL pd_insert_alumnos('147', 'Diego', 'Hernández', 16);
CALL pd_insert_alumnos('258', 'Sofía', 'Díaz', 15);
CALL pd_insert_alumnos('369', 'Javier', 'Torres', 17);
CALL pd_insert_alumnos('963', 'Elena', 'Fernández', 19);
CALL pd_insert_alumnos('852', 'Miguel', 'Ruiz', 18);
CALL pd_insert_alumnos('741', 'Lucía', 'García', 19);
CALL pd_insert_alumnos('159', 'Pablo', 'Moreno', 20);
CALL pd_insert_alumnos('753', 'Carmen', 'Álvarez', 15);

SELECT * FROM tb_alumnos;

#--------------------------------
SHOW TABLES;
SELECT * FROM tb_profesores;
DESCRIBE tb_profesores;

DELIMITER //
CREATE PROCEDURE pd_insert_profesores(
    IN nombre_profesor VARCHAR(100),
    IN apellido_profesor VARCHAR(100),
    IN correo_electronico_profesor VARCHAR(100)
)
BEGIN
	INSERT INTO tb_profesores(id_profesor, nombre_profesor, apellido_profesor, correo_electronico_profesor)
	VALUES (UUID(),nombre_profesor, apellido_profesor, correo_electronico_profesor);
END
//
DELIMITER ;

CALL pd_insert_profesores('Jackeline', 'Melanie', 'melanie@gmail.com');
CALL pd_insert_profesores('Juan', 'López', 'juan.lopez@gmail.com');
CALL pd_insert_profesores('Maria', 'Gonzalez', 'maria.gonzalez@gmail.com');
CALL pd_insert_profesores('Carlos', 'Martinez', 'carlos.martinez@gmail.com');
CALL pd_insert_profesores('Laura', 'Sanchez', 'laura.sanchez@gmail.com');
CALL pd_insert_profesores('Pedro', 'Ramirez', 'pedro.ramirez@gmail.com');
CALL pd_insert_profesores('Ana', 'Hernandez', 'ana.hernandez@gmail.com');
CALL pd_insert_profesores('Diego', 'Diaz', 'diego.diaz@gmail.com');
CALL pd_insert_profesores('Sofía', 'Torres', 'sofia.torres@gmail.com');
CALL pd_insert_profesores('Javier', 'Fernandez', 'javier.fernandez@gmail.com');
CALL pd_insert_profesores('Elena', 'Ruiz', 'elena.ruiz@gmail.com');
CALL pd_insert_profesores('Miguel', 'Garcia', 'miguel.garcia@gmail.com');
CALL pd_insert_profesores('Lucia', 'Moreno', 'lucia.moreno@gmail.com');
CALL pd_insert_profesores('Pablo', 'Alvarez', 'pablo.alvarez@gmail.com');
CALL pd_insert_profesores('Carmen', 'Martin', 'carmen.martin@gmail.com');

SELECT * FROM tb_profesores;

#--------------------------------
SHOW TABLES;
SELECT * FROM tb_materias;
DESCRIBE tb_materias;

DELIMITER //
CREATE PROCEDURE pd_insert_materias(
    IN nombre_materia VARCHAR(100),
    IN grupo_materia INT,
    IN correo_electronico_profesor VARCHAR(100),
    IN cupos_materia INT
)
BEGIN
    DECLARE p_id_profesor VARCHAR(36);

    -- Seleccionar el id_profesor, ordenar por algún criterio y limitar a una fila
    SELECT id_profesor INTO p_id_profesor 
    FROM tb_profesores 
    WHERE correo_electronico_profesor = correo_electronico_profesor
    ORDER BY id_profesor ASC
    LIMIT 1;

    INSERT INTO tb_materias(id_materia, nombre_materia, grupo_materia, id_profesor, cupos_materia)
    VALUES (UUID(), nombre_materia, grupo_materia, p_id_profesor, cupos_materia);
END
//
DELIMITER ;

CALL pd_insert_materias('Matematicas', 1, 'melanie@gmail.com', 5);
CALL pd_insert_materias('Lenguaje', 2, 'juan.lopez@gmail.com', 10);
CALL pd_insert_materias('Ciencias', 3, 'maria.gonzalez@gmail.com', 8);
CALL pd_insert_materias('Sociales', 4, 'carlos.martinez@gmail.com', 9);
CALL pd_insert_materias('Ingles', 5, 'laura.sanchez@gmail.com', 70);
CALL pd_insert_materias('Quimica', 6, 'pedro.ramirez@gmail.com', 20);
CALL pd_insert_materias('Algebra', 7, 'ana.hernandez@gmail.com', 6);
CALL pd_insert_materias('Biologia', 8, 'diego.diaz@gmail.com', 40);
CALL pd_insert_materias('Espanol', 9, 'sofia.torres@gmail.com', 30);
CALL pd_insert_materias('Psicologia', 10, 'javier.fernandez@gmail.com' , 35);
CALL pd_insert_materias('Pastoral', 11, 'elena.ruiz@gmail.com', 20);
CALL pd_insert_materias('Artes plasticas', 12, 'miguel.garcia@gmail.com', 40);
CALL pd_insert_materias('Artistica', 13, 'lucia.moreno@gmail.com', 80);
CALL pd_insert_materias('Caligrafia', 14, 'pablo.alvarez@gmail.com', 60);
CALL pd_insert_materias('Ortografia', 15, 'carmen.martin@gmail.com', 40);

SELECT * FROM tb_materias;

#--------------------------------
SHOW TABLES;
SELECT * FROM tb_inscripciones;
DESCRIBE tb_inscripciones;
SELECT * FROM tb_alumnos;
SELECT * FROM tb_materias;

SHOW TABLES;
SELECT * FROM tb_inscripciones;
DESCRIBE tb_inscripciones;
SELECT * FROM tb_alumnos;
SELECT * FROM tb_materias

DELIMITER //
CREATE PROCEDURE pd_insert_inscripciones(
    IN carnet_alumnoa VARCHAR(10),
    IN nombre_materiaa VARCHAR(100),
    IN fecha_inscripcion DATE,
    IN estado ENUM('Activo', 'Inactivo')
)
BEGIN
    DECLARE p_id_alumno VARCHAR(36);
    DECLARE p_id_materia VARCHAR(36);
 
    -- Obtener el ID del alumno
    SELECT id_alumno INTO p_id_alumno 
    FROM tb_alumnos 
    WHERE carnet_alumno = carnet_alumnoa;
 
    -- Obtener el ID de la materia
    SELECT id_materia INTO p_id_materia 
    FROM tb_materias 
    WHERE nombre_materia = nombre_materiaa;
 
    -- Insertar la inscripción
    INSERT INTO tb_inscripciones (id_inscripcion, id_alumno, id_materia, fecha_inscripcion, estado)
    VALUES (UUID(), p_id_alumno, p_id_materia, fecha_inscripcion, estado);
END //
DELIMITER ;

CALL pd_insert_inscripciones('A001', 'Lenguaje', '2023-03-03', 'Activo');
CALL pd_insert_inscripciones('A002', 'Matematicas', '2023-03-03', 'Activo');
CALL pd_insert_inscripciones('A003', 'Ciencias', '2023-03-03', 'Inactivo');
CALL pd_insert_inscripciones('A004', 'Sociales', '2023-03-03', 'Activo');
CALL pd_insert_inscripciones('A005', 'Ingles', '2023-03-03', 'Activo');
CALL pd_insert_inscripciones('A006', 'Quimica', '2023-03-03', 'Activo');
CALL pd_insert_inscripciones('A007', 'Algebra', '2023-03-03', 'Inactivo');
CALL pd_insert_inscripciones('A008', 'Biologia', '2023-03-03', 'Inactivo');
CALL pd_insert_inscripciones('A009', 'Espanol', '2023-03-03', 'Activo');
CALL pd_insert_inscripciones('A010', 'Psicologia', '2023-03-03', 'Activo');
CALL pd_insert_inscripciones('A011', 'Pastoral', '2023-03-03', 'Inactivo');
CALL pd_insert_inscripciones('A012', 'Artes plasticas', '2023-03-03', 'Activo');
CALL pd_insert_inscripciones('A013', 'Artistica', '2023-03-03', 'Inactivo');
CALL pd_insert_inscripciones('A014', 'Caligrafia', '2023-03-03', 'Activo');
CALL pd_insert_inscripciones('A015', 'Ortografia', '2023-03-03', 'Inactivo');

SELECT * FROM tb_inscripciones;

#--------------------------------
SHOW TABLES;
SELECT * FROM tb_calificaciones;
DESCRIBE tb_calificaciones;

DELIMITER //

CREATE PROCEDURE pd_insert_calificaciones(
    IN carnet_alumno VARCHAR(10),
    IN calificacion_final DECIMAL(5,2),
    IN fecha_calificacion DATE
)
BEGIN
    DECLARE p_id_inscripcion VARCHAR(36);
    
    SELECT id_inscripcion INTO p_id_inscripcion 
    FROM tb_inscripciones 
    WHERE id_alumno = (SELECT id_alumno FROM tb_alumnos WHERE carnet_alumno = carnet_alumno LIMIT 1)
    LIMIT 1;

    INSERT INTO tb_calificaciones(id_calificacion, id_inscripcion, calificacion_final, fecha_calificacion)
    VALUES (UUID(), p_id_inscripcion, calificacion_final, fecha_calificacion);
END
//
DELIMITER ;

CALL pd_insert_calificaciones('B001', 9, '2023/03/03');
CALL pd_insert_calificaciones('B002', 8, '2023/03/03');
CALL pd_insert_calificaciones('B003', 6, '2023/03/03');
CALL pd_insert_calificaciones('B004', 5, '2023/03/03');
CALL pd_insert_calificaciones('B005', 7, '2023/03/03');
CALL pd_insert_calificaciones('B006', 8, '2023/03/03');
CALL pd_insert_calificaciones('B007', 6, '2023/03/03');
CALL pd_insert_calificaciones('B008', 10, '2023/03/03');
CALL pd_insert_calificaciones('B009', 4, '2023/03/03');
CALL pd_insert_calificaciones('B010', 9, '2023/03/03');
CALL pd_insert_calificaciones('B011', 7, '2023/03/03');
CALL pd_insert_calificaciones('B012', 6, '2023/03/03');
CALL pd_insert_calificaciones('B013', 7, '2023/03/03');
CALL pd_insert_calificaciones('B014', 4, '2023/03/03');
CALL pd_insert_calificaciones('B015', 7, '2023/03/03');

SELECT * FROM tb_calificaciones;