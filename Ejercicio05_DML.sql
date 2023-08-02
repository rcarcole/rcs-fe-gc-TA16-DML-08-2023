CREATE DATABASE IF NOT EXISTS ex05_DDL;
USE ex05_DDL;

CREATE TABLE Facultad (
    codigo INT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE Investigadores (
    dni VARCHAR(15) PRIMARY KEY,
    NomApels VARCHAR(255) NOT NULL,
    codigoFacultad INT,
    FOREIGN KEY (codigoFacultad) REFERENCES Facultad(codigo)
);

CREATE TABLE Equipos (
    numSerie INT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    codigoFacultad INT NOT NULL,
    FOREIGN KEY (codigoFacultad) REFERENCES Facultad(codigo)
);

CREATE TABLE Reserva (
    dni VARCHAR(15),
    numSerie INT,
    comienzo DATETIME NOT NULL,
    fin DATETIME NOT NULL,
    PRIMARY KEY (dni, numSerie),
    FOREIGN KEY (dni) REFERENCES Investigadores(dni),
    FOREIGN KEY (numSerie) REFERENCES Equipos(numSerie)
);


-- DML

-- Insertar
INSERT INTO Facultad(codigo, nombre) 
VALUES (1, 'Facultad de Ciencias');

INSERT INTO Investigadores(dni, NomApels, codigoFacultad) 
VALUES ('1234567890', 'Juan Perez', 1);

INSERT INTO Equipos(numSerie, nombre, codigoFacultad) 
VALUES (100, 'Equipo 1', 1);

INSERT INTO Reserva(dni, numSerie, comienzo, fin) 
VALUES ('1234567890', 100, '2023-09-01 08:00:00', '2023-09-01 12:00:00');

-- Actualizar
UPDATE Facultad 
SET nombre = 'Facultad de Ingeniería' 
WHERE codigo = 1;

UPDATE Investigadores 
SET NomApels = 'Jose Garcia', codigoFacultad = 1 
WHERE dni = '1234567890';

UPDATE Equipos 
SET nombre = 'Equipo 2', codigoFacultad = 1 
WHERE numSerie = 100;

UPDATE Reserva 
SET comienzo = '2023-09-02 08:00:00', fin = '2023-09-02 12:00:00' 
WHERE dni = '1234567890' AND numSerie = 100;


-- Borrar
DELETE FROM Reserva 
WHERE dni = '1234567890' AND numSerie = 100;

DELETE FROM Equipos 
WHERE numSerie = 100;

DELETE FROM Investigadores 
WHERE dni = '1234567890';

DELETE FROM Facultad 
WHERE codigo = 1;
