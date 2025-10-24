CREATE TABLE Conductores (
    conductor_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    cedula VARCHAR(20) UNIQUE NOT NULL,
    licencia VARCHAR(20) UNIQUE NOT NULL,
    tipo_licencia VARCHAR(5) NOT NULL,
    telefono VARCHAR(15),
    email VARCHAR(100),
    fecha_contratacion DATE NOT NULL,
    estado ENUM('Activo', 'Inactivo', 'Vacaciones', 'Suspendido') DEFAULT 'Activo',
    vehiculo_asignado_id INT,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (vehiculo_asignado_id) REFERENCES Vehiculos(vehiculo_id) ON DELETE SET NULL,
    INDEX idx_estado (estado),
    INDEX idx_cedula (cedula)
);

-- =====================================================
-- 2. INSERCIÓN DE DATOS - CONDUCTORES
-- =====================================================

INSERT INTO Conductores (nombre, apellido, cedula, licencia, tipo_licencia, telefono, email, fecha_contratacion, estado, vehiculo_asignado_id) VALUES
('Carlos', 'Ramírez', '1-0234-5678', 'LIC-001234', 'B3', '8888-1111', 'carlos.ramirez@fleet.com', '2020-03-15', 'Activo', 2),
('María', 'González', '2-0345-6789', 'LIC-002345', 'B2', '8888-2222', 'maria.gonzalez@fleet.com', '2019-06-20', 'Activo', 5),
('José', 'Hernández', '1-0456-7890', 'LIC-003456', 'B3', '8888-3333', 'jose.hernandez@fleet.com', '2021-01-10', 'Activo', 8),
('Ana', 'Mora', '2-0567-8901', 'LIC-004567', 'B1', '8888-4444', 'ana.mora@fleet.com', '2022-08-05', 'Activo', 1),
('Luis', 'Castillo', '1-0678-9012', 'LIC-005678', 'B3', '8888-5555', 'luis.castillo@fleet.com', '2020-11-12', 'Activo', 13),
('Patricia', 'Vargas', '2-0789-0123', 'LIC-006789', 'B2', '8888-6666', 'patricia.vargas@fleet.com', '2021-04-18', 'Vacaciones', NULL),
('Roberto', 'Solís', '1-0890-1234', 'LIC-007890', 'B3', '8888-7777', 'roberto.solis@fleet.com', '2019-09-25', 'Activo', 4),
('Laura', 'Jiménez', '2-0901-2345', 'LIC-008901', 'B1', '8888-8888', 'laura.jimenez@fleet.com', '2023-02-14', 'Activo', 6),
('Fernando', 'Cruz', '1-1012-3456', 'LIC-009012', 'B3', '8888-9999', 'fernando.cruz@fleet.com', '2020-05-30', 'Activo', 9),
('Diana', 'Rojas', '2-1123-4567', 'LIC-010123', 'B2', '8888-0000', 'diana.rojas@fleet.com', '2022-12-08', 'Activo', 12),
('Miguel', 'Campos', '1-1234-5678', 'LIC-011234', 'B1', '8877-1111', 'miguel.campos@fleet.com', '2021-07-22', 'Suspendido', NULL),
('Sofía', 'Paniagua', '2-1345-6789', 'LIC-012345', 'B2', '8877-2222', 'sofia.paniagua@fleet.com', '2023-05-17', 'Activo', 14);
