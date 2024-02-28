USE db_edumanage;

#Se debe de crear un trigger que actualice los cupos de una materia una vez que un alumno
#haya inscrito materias.
SHOW TABLES;
SELECT * FROM tb_materias;
SELECT * FROM tb_inscripciones;

DROP TRIGGER actualizar_cupos_materia

DELIMITER //
CREATE TRIGGER actualizar_cupos_materia
AFTER INSERT ON tb_inscripciones
FOR EACH ROW
BEGIN
    UPDATE tb_materias
    SET tb_materias.cupos_materias = tb_materias.cupos_materia - 1
    WHERE id_materia = NEW.id_materia;
END
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

CALL pd_insert_alumnos('1234567890', 'Adriana Paola', 'Mejia Mendez', 18)
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
CALL pd_insert_profesores('Jackeline', 'Melanie', 'melanie@gmail.com')
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
	SELECT id_profesor INTO p_id_profesor FROM tb_profesores WHERE correo_electronico_profesor = correo_electronico_profesor;

	INSERT INTO tb_materias(id_materia, nombre_materia, grupo_materia, id_profesor, cupos_materia)
	VALUES (UUID(), nombre_materia, grupo_materia, p_id_profesor, cupos_materia);
END
//
DELIMITER ;

CALL pd_insert_materias('Matematicas', 1, 'melanie@gmail.com', 5)
SELECT * FROM tb_materias;
#--------------------------------
SHOW TABLES;
SELECT * FROM tb_inscripciones;
DESCRIBE tb_inscripciones;
SELECT * FROM tb_alumnos
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
    SELECT id_alumno INTO p_id_alumno FROM tb_alumnos WHERE carnet_alumno = carnet_alumnoa;
 
    -- Obtener el ID de la materia
    SELECT id_materia INTO p_id_materia FROM tb_materias WHERE nombre_materia = nombre_materiaa;
 
    -- Insertar la inscripción
    INSERT INTO tb_inscripciones (id_inscripcion, id_alumno, id_materia, fecha_inscripcion, estado)
    VALUES (UUID(), p_id_alumno, p_id_materia, fecha_inscripcion, estado);
END //
DELIMITER ;

CALL pd_insert_inscripciones(0, 0, '2023/03/03', 'Activo')
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
	
	SELECT id_inscripcion INTO p_id_inscripcion FROM tb_inscripciones WHERE 
	id_alumno = (SELECT id_alumno FROM tb_alumnos WHERE carnet_alumno = carnet_alumno);

	INSERT INTO tb_calificaciones(id_calificacion, id_inscripcion, calificacion_final, fecha_calificacion)
	VALUES (UUID(),p_id_inscripcion, calificacion_final, fecha_calificacion);
END
//
DELIMITER ;

CALL pd_insert_calificaciones(1, 5, '2023/03/03')
SELECT * FROM tb_inscripciones;