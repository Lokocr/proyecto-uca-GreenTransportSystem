-- Script para insertar datos de prueba en la tabla de Mantenimientos
INSERT INTO Mantenimientos (VehiculoID, ConductorID, FechaMantenimiento, TipoServicio, Costo) VALUES
(1, 1, '2024-09-01', 'Revisi�n General', 150.00),
(2, 2, '2024-08-20', 'Cambio Neum�ticos', 300.00),
(3, NULL, '2024-10-25', 'Diagn�stico Bater�a', 50.00), -- Mantenimiento actual
(4, 3, '2024-07-10', 'Revisi�n General', 150.00);

-- El veh�culo ELEC003 (ID 3) est� en mantenimiento, simulando el caso de uso.