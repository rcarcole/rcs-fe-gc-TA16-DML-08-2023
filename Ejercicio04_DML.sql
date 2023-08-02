CREATE DATABASE IF NOT EXISTS ex04_DDL;
USE ex04_DDL;

CREATE TABLE cajeros(
	codigo int,
    nom_apels varchar(225),
    PRIMARY KEY (codigo)
);

CREATE TABLE productos(
	codigo int,
    nombre varchar(100),
    precio int,
    PRIMARY KEY (codigo)
);

CREATE TABLE maquinas_registradas(
	codigo int,
    piso int,
    PRIMARY KEY (codigo)
);

CREATE TABLE ventas(
	cajero int,
    maquina int,
    producto int,
    PRIMARY KEY (cajero, maquina, producto),
    FOREIGN KEY (cajero) REFERENCES cajeros (codigo)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY (producto) REFERENCES productos (codigo)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY (maquina) REFERENCES maquinas_registradas (codigo)
    ON DELETE cascade
    ON UPDATE cascade
);

-- DML

-- Insertar
INSERT INTO cajeros(codigo, nom_apels) 
VALUES (1, 'Juan Perez');

INSERT INTO productos(codigo, nombre, precio)
VALUES (1, 'Producto A', 100);

INSERT INTO maquinas_registradas(codigo, piso) 
VALUES (1, 2);

INSERT INTO ventas(cajero, maquina, producto) 
VALUES (1, 1, 1);


-- Actualizar
UPDATE cajeros 
SET nom_apels = 'Carlos Gomez' WHERE codigo = 1;

UPDATE productos 
SET nombre = 'Producto B', precio = 200 WHERE codigo = 1;

UPDATE maquinas_registradas 
SET piso = 3 WHERE codigo = 1;

UPDATE ventas 
SET maquina = 2 
WHERE cajero = 1 AND maquina = 1 AND producto = 1;


-- Borrar
DELETE FROM cajeros 
WHERE codigo = 1;

DELETE FROM productos 
WHERE codigo = 1;

DELETE FROM maquinas_registradas 
WHERE codigo = 1;

DELETE FROM ventas 
WHERE cajero = 1 AND maquina = 1 AND producto = 1;

