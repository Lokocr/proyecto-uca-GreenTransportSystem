-- Script para insertar datos de prueba en la tabla de Mantenimientos
INSERT INTO Mantenimientos (VehiculoID, ConductorID, FechaMantenimiento, TipoServicio, Costo) VALUES
(1, 1, '2024-09-01', 'Revisión General', 150.00),
(2, 2, '2024-08-20', 'Cambio Neumáticos', 300.00),
(3, NULL, '2024-10-25', 'Diagnóstico Batería', 50.00), -- Mantenimiento actual
(4, 3, '2024-07-10', 'Revisión General', 150.00);

-- El vehículo ELEC003 (ID 3) está en mantenimiento, simulando el caso de uso.