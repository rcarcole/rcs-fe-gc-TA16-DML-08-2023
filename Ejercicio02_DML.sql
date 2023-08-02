CREATE DATABASE IF NOT EXISTS ex02_DDL;
USE ex02_DDL;

CREATE TABLE piezas(
	codigo int auto_increment,
    nombre nvarchar(100),
    PRIMARY KEY (codigo)
);

CREATE TABLE proveedores(
	id char(4),
    nombre nvarchar(100),
    PRIMARY KEY (id)
);

CREATE TABLE suministra(
	codigo_pieza int auto_increment,
    id_proveedor char(4),
    precio int,
    PRIMARY KEY (codigo_pieza, id_proveedor),
    FOREIGN KEY (codigo_pieza) REFERENCES piezas(codigo)
    ON DELETE cascade
    ON UPDATE cascade, 
    FOREIGN KEY (id_proveedor) REFERENCES proveedores(id)
    ON DELETE cascade
    ON UPDATE cascade
);

-- DML

-- Insertar
INSERT INTO piezas (nombre)
VALUES ('NombrePieza');

INSERT INTO proveedores (id, nombre)
VALUES ('ABCD', 'NombreProveedor');

INSERT INTO suministra (codigo_pieza, id_proveedor, precio)
VALUES (1, 'ABCD', 100);


-- Actualizar
UPDATE piezas
SET nombre = 'NuevoNombrePieza'
WHERE codigo = 1;

UPDATE proveedores
SET nombre = 'NuevoNombreProveedor'
WHERE id = 'ABCD';

UPDATE suministra
SET precio = 150
WHERE codigo_pieza = 1 AND id_proveedor = 'ABCD';


-- Borrar
DELETE FROM piezas
WHERE codigo = 1;

DELETE FROM proveedores
WHERE id = 'ABCD';

DELETE FROM suministra
WHERE codigo_pieza = 1 AND id_proveedor = 'ABCD';