CREATE DATABASE IF NOT EXISTS ex03_DDL;
USE ex03_DDL;

CREATE TABLE cientificos(
	DNI varchar(8),
    nom_apels varchar(225),
    PRIMARY KEY (DNI)
);

CREATE TABLE proyectos(
	id char(4),
    nombre varchar(225),
    horas int,
    PRIMARY KEY (id)
);

CREATE TABLE asignado_a(
	cientifico varchar(8),
    proyecto char(4),
    PRIMARY KEY (cientifico, proyecto),
    FOREIGN KEY (cientifico) REFERENCES cientificos (DNI)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY (proyecto) REFERENCES proyectos (id)
    ON DELETE cascade
    ON UPDATE cascade
);


-- DML


-- Insertar
INSERT INTO cientificos(DNI, nom_apels)
VALUES ('12345678', 'John Doe');

INSERT INTO proyectos(id, nombre, horas)
VALUES ('P001', 'Proyecto 1', 100);

INSERT INTO asignado_a(cientifico, proyecto)
VALUES ('12345678', 'P001');


-- Actualizar
UPDATE cientificos
SET nom_apels = 'Jane Doe'
WHERE DNI = '12345678';

UPDATE proyectos
SET nombre = 'Proyecto 1 actualizado', horas = 120
WHERE id = 'P001';

UPDATE asignado_a
SET cientifico = '12345678', proyecto = 'P001'
WHERE cientifico = '12345678' AND proyecto = 'P001';


-- Borrar
DELETE FROM asignado_a
WHERE cientifico = '12345678' AND proyecto = 'P001';

DELETE FROM proyectos
WHERE id = 'P001';

DELETE FROM cientificos
WHERE DNI = '12345678';
