-- Crear la base de datos
CREATE DATABASE Tabla_Clase2;

-- Seleccionar la base de datos
USE Tabla_Clase2;

-- Creación de tabla DEPARTAMENTO
CREATE TABLE departamento (
    id INT(10) AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50)
);
-- Creación de tabla PERSONA
CREATE TABLE persona (
    id INT(10) AUTO_INCREMENT PRIMARY KEY,
    nif VARCHAR(9),
    nombre VARCHAR(25) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50),
    ciudad VARCHAR(25) NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    telefono VARCHAR(9),
    fecha_nacimiento DATE NOT NULL,
    sexo ENUM('H', 'M') NOT NULL,
    tipo ENUM('profesor', 'alumno') NOT NULL
);
-- Creación de tabla PROFESOR
CREATE TABLE profesor (
    id_profesor INT(10) PRIMARY KEY,
    id_departamento INT(10) NOT NULL,
    FOREIGN KEY (id_profesor) REFERENCES persona(id),
    FOREIGN KEY (id_departamento) REFERENCES departamento(id)
);
-- Creación de tabla GRADO
CREATE TABLE grado (
    id INT(10) AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);
-- Creación de tabla CURSO
CREATE TABLE curso_escolar (
    id INT(10) AUTO_INCREMENT PRIMARY KEY,
    anyo_inicio YEAR(4) NOT NULL,
    anyo_fin YEAR(4) NOT NULL
);
-- Creación de tabla ASIGNATURA
CREATE TABLE asignatura (
    id INT(10) AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    creditos FLOAT NOT NULL,
    tipo ENUM('a', 'b') NOT NULL,
    curso TINYINT(3) NOT NULL,
    cuatrimestre TINYINT(3) NOT NULL,
    id_profesor INT(10),
    id_grado INT(10) NOT NULL,
    FOREIGN KEY (id_profesor) REFERENCES profesor(id_profesor),
    FOREIGN KEY (id_grado) REFERENCES grado(id)
);
-- Creación de tabla ALUMNO.S.M.A
CREATE TABLE alumno_se_matricula_asignatura (
    id_alumno INT(10),
    id_asignatura INT(10),
    id_curso_escolar INT(10),
    PRIMARY KEY (id_alumno, id_asignatura, id_curso_escolar),
    FOREIGN KEY (id_alumno) REFERENCES persona(id),
    FOREIGN KEY (id_asignatura) REFERENCES asignatura(id),
    FOREIGN KEY (id_curso_escolar) REFERENCES curso_escolar(id)
);
