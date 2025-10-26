-- Script para crear la tabla de Mantenimientos
CREATE TABLE Mantenimientos (
    MantenimientoID INT PRIMARY KEY IDENTITY(1,1),
    VehiculoID INT NOT NULL,
    ConductorID INT,
    FechaMantenimiento DATE NOT NULL,
    TipoServicio VARCHAR(100) NOT NULL, -- Revisión, Batería, Neumáticos, General
    Costo DECIMAL(10, 2),
    FOREIGN KEY (VehiculoID) REFERENCES Vehiculos(VehiculoID),
    FOREIGN KEY (ConductorID) REFERENCES Conductores(ConductorID)
);