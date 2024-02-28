DROP DATABASE IF EXISTS db_edumanage;

CREATE DATABASE db_edumanage;
USE db_edumanage;

CREATE TABLE tb_profesores
(
	id_profesor VARCHAR(36) PRIMARY KEY, #UUID PK
	nombre_profesor VARCHAR(100) NOT NULL, #NN
	apellido_profesor VARCHAR(100) NOT NULL, #NN
	correo_electronico_profesor VARCHAR(100) NOT NULL #NN UNIQUE
);

#-----Restricciones profesores-----
ALTER TABLE tb_profesores ADD
CONSTRAINT unique_correo
UNIQUE (correo_electronico_profesor);

CREATE TABLE tb_materias
(
	id_materia VARCHAR(36) PRIMARY KEY, #UUID PK
	nombre_materia VARCHAR(100) NOT NULL, #NN UNIQUE
	grupo_materia INT NOT NULL, #CHECK NN
	id_profesor VARCHAR(36), #FK
	cupos_materia INT NOT NULL #CHECK NN
);

#-----Restricciones materias-----
ALTER TABLE tb_materias ADD
CONSTRAINT check_grupo 
CHECK (grupo_materia > 0);

ALTER TABLE tb_materias ADD
CONSTRAINT check_cupos 
CHECK (cupos_materia >= 0);

ALTER TABLE tb_materias ADD
CONSTRAINT unique_nombre_materia 
UNIQUE (nombre_materia );

#-----FK materias-----
ALTER TABLE tb_materias ADD 
CONSTRAINT fk_profesor_materia 
FOREIGN KEY (id_profesor)
REFERENCES tb_profesores(id_profesor);

CREATE TABLE tb_alumnos
(
	id_alumno VARCHAR(36) PRIMARY KEY, #NN
	carnet_alumno VARCHAR(10) NOT NULL, #NN UNIQUE
	nombre_alumno VARCHAR(50) NOT NULL, #NN
	apellido_alumno VARCHAR(50) NOT NULL, #NN
	edad_alumno INT NOT NULL #NN CHECK
);

#-----Restricciones alumnos-----
ALTER TABLE tb_alumnos ADD
CONSTRAINT unique_carnet 
UNIQUE (carnet_alumno);

#-----Restricciones alumnos-----
ALTER TABLE tb_alumnos ADD
CONSTRAINT check_edad 
CHECK (edad_alumno > 0);

CREATE TABLE tb_inscripciones
(
	id_inscripcion VARCHAR(36) PRIMARY KEY, #UUID PK
	id_alumno VARCHAR(36), #FK
	id_materia VARCHAR(36), #FK
	fecha_inscripcion DATE NOT NULL DEFAULT(CURRENT_DATE()), #DEFAULT NN
	estado ENUM('Activo', 'Inactivo') NOT NULL #NN
	
);

#-----FK inscripciones-----
ALTER TABLE tb_inscripciones ADD 
CONSTRAINT fk_alumnos_inscripciones 
FOREIGN KEY (id_alumno)
REFERENCES tb_alumnos(id_alumno);

ALTER TABLE tb_inscripciones ADD 
CONSTRAINT fk_materia_inscripciones 
FOREIGN KEY (id_materia)
REFERENCES tb_materias(id_materia);

CREATE TABLE tb_calificaciones
(
	id_calificacion VARCHAR(36) PRIMARY KEY, #UUID PK
	id_inscripcion VARCHAR(36), #FK
	calificacion_final DECIMAL(5,2), #CHECK
	fecha_calificacion DATE DEFAULT(CURRENT_DATE()) #DEFAULT CHECK
);

#-----Restricciones calificaciones-----
ALTER TABLE tb_calificaciones ADD
CONSTRAINT check_calificacion_final 
CHECK (calificacion_final >= 0);

#-----FK calificaciones-----
ALTER TABLE tb_calificaciones ADD 
CONSTRAINT fk_inscripcion_calificacion 
FOREIGN KEY (id_inscripcion)
REFERENCES tb_inscripciones(id_inscripcion);

