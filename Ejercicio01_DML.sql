CREATE DATABASE IF NOT EXISTS ex01_DDL;
USE ex01_DDL;

CREATE TABLE Despachos (
    numero INT PRIMARY KEY,
    capacidad INT NOT NULL
);

CREATE TABLE Directores (
    dni VARCHAR(9) PRIMARY KEY,
    nomApels VARCHAR(255) NOT NULL,
    DNIJefe VARCHAR(15),
    Despacho INT NOT NULL,
    FOREIGN KEY (DNIJefe) REFERENCES Directores(dni)
    ON DELETE cascade
    ON UPDATE cascade,
    FOREIGN KEY (Despacho) REFERENCES Despachos(numero)
    ON DELETE cascade
    ON UPDATE cascade
);


-- DML

-- Insertar
INSERT INTO Despachos (numero, capacidad) 
VALUES (1, 10);

INSERT INTO Directores (dni, nomApels, Despacho)
VALUES ('12345678A', 'Juan Pérez', 1);


-- Actualizar
UPDATE Directores
SET nomApels = 'Juan García'
WHERE dni = '12345678A';


-- Eliminar 
DELETE FROM Directores
WHERE dni = '12345678A';

DELETE FROM Despachos
WHERE numero = 1;
