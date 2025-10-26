-- Script para crear la tabla de Vehículos
CREATE TABLE Vehiculos (
    VehiculoID INT PRIMARY KEY IDENTITY(1,1),
    Placa VARCHAR(10) NOT NULL UNIQUE,
    Marca VARCHAR(50) NOT NULL,
    Modelo VARCHAR(50) NOT NULL,
    Anio INT,
    CapacidadBateria FLOAT, -- kWh
    Estado VARCHAR(20) NOT NULL DEFAULT 'Activo' -- Activo, En Mantenimiento, Fuera de Servicio
);