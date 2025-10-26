-- Script para crear la tabla de Conductores
CREATE TABLE Conductores (
    ConductorID INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(100) NOT NULL,
    Licencia VARCHAR(50) NOT NULL UNIQUE,
    FechaContratacion DATE NOT NULL,
    VehiculoAsignadoID INT UNIQUE,
    FOREIGN KEY (VehiculoAsignadoID) REFERENCES Vehiculos(VehiculoID)
);