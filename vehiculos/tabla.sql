CREATE TABLE Vehiculos (
    vehiculo_id INT PRIMARY KEY AUTO_INCREMENT,
    placa VARCHAR(10) UNIQUE NOT NULL,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    anio INT NOT NULL,
    tipo_vehiculo ENUM('Sedán', 'SUV', 'Van', 'Camión', 'Pickup') NOT NULL,
    kilometraje DECIMAL(10,2) DEFAULT 0,
    estado ENUM('Disponible', 'En Mantenimiento', 'En Ruta', 'Inactivo') DEFAULT 'Disponible',
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX idx_estado (estado),
    INDEX idx_placa (placa)
);

-- =====================================================
-- 2. INSERCIÓN DE DATOS - VEHÍCULOS
-- =====================================================

INSERT INTO Vehiculos (placa, marca, modelo, anio, tipo_vehiculo, kilometraje, estado) VALUES
('ABC-123', 'Toyota', 'Corolla', 2022, 'Sedán', 25000.00, 'Disponible'),
('DEF-456', 'Honda', 'CR-V', 2023, 'SUV', 15000.00, 'En Ruta'),
('GHI-789', 'Ford', 'Transit', 2021, 'Van', 45000.00, 'En Mantenimiento'),
('JKL-012', 'Chevrolet', 'Silverado', 2020, 'Pickup', 60000.00, 'Disponible'),
('MNO-345', 'Nissan', 'Sentra', 2023, 'Sedán', 8000.00, 'En Ruta'),
('PQR-678', 'Mazda', 'CX-5', 2022, 'SUV', 30000.00, 'Disponible'),
('STU-901', 'Hyundai', 'Tucson', 2021, 'SUV', 35000.00, 'En Mantenimiento'),
('VWX-234', 'Toyota', 'Hilux', 2023, 'Pickup', 12000.00, 'En Ruta'),
('YZA-567', 'Ford', 'F-150', 2022, 'Pickup', 28000.00, 'Disponible'),
('BCD-890', 'Mercedes-Benz', 'Sprinter', 2021, 'Van', 50000.00, 'Disponible'),
('EFG-123', 'Volkswagen', 'Amarok', 2020, 'Pickup', 55000.00, 'Inactivo'),
('HIJ-456', 'Kia', 'Sportage', 2023, 'SUV', 10000.00, 'Disponible'),
('KLM-789', 'Chevrolet', 'Spark', 2022, 'Sedán', 20000.00, 'En Ruta'),
('NOP-012', 'Isuzu', 'D-Max', 2021, 'Pickup', 40000.00, 'Disponible'),
('QRS-345', 'Mitsubishi', 'L200', 2023, 'Pickup', 5000.00, 'Disponible');
