CREATE TABLE Mantenimientos (
    mantenimiento_id INT PRIMARY KEY AUTO_INCREMENT,
    vehiculo_id INT NOT NULL,
    conductor_id INT,
    tipo_mantenimiento ENUM('Preventivo', 'Correctivo', 'Inspección', 'Emergencia') NOT NULL,
    descripcion TEXT NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE,
    kilometraje_actual DECIMAL(10,2),
    costo DECIMAL(10,2),
    taller VARCHAR(100),
    estado ENUM('Programado', 'En Proceso', 'Completado', 'Cancelado') DEFAULT 'Programado',
    observaciones TEXT,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (vehiculo_id) REFERENCES Vehiculos(vehiculo_id) ON DELETE CASCADE,
    FOREIGN KEY (conductor_id) REFERENCES Conductores(conductor_id) ON DELETE SET NULL,
    INDEX idx_fecha_inicio (fecha_inicio),
    INDEX idx_vehiculo (vehiculo_id),
    INDEX idx_estado (estado)
);

-- =====================================================
-- 2. INSERCIÓN DE DATOS - MANTENIMIENTOS
-- =====================================================

INSERT INTO Mantenimientos (vehiculo_id, conductor_id, tipo_mantenimiento, descripcion, fecha_inicio, fecha_fin, kilometraje_actual, costo, taller, estado, observaciones) VALUES
-- Mantenimientos completados (últimos 3 meses)
(1, 4, 'Preventivo', 'Cambio de aceite y filtros', '2024-08-15', '2024-08-15', 23000.00, 150.00, 'Taller Central', 'Completado', 'Todo en orden'),
(2, 1, 'Inspección', 'Revisión general de 15,000 km', '2024-09-10', '2024-09-10', 15000.00, 200.00, 'Taller Central', 'Completado', 'Se recomendó cambio de frenos próximamente'),
(4, 7, 'Correctivo', 'Reparación de sistema eléctrico', '2024-09-20', '2024-09-22', 58000.00, 450.00, 'Taller Especializado', 'Completado', 'Reemplazo de alternador'),
(5, 2, 'Preventivo', 'Rotación de llantas y alineación', '2024-09-25', '2024-09-25', 7500.00, 120.00, 'Taller Central', 'Completado', 'Sin problemas'),
(6, 8, 'Preventivo', 'Cambio de aceite', '2024-08-30', '2024-08-30', 28000.00, 140.00, 'Taller Norte', 'Completado', 'Mantenimiento regular'),
(8, 3, 'Inspección', 'Revisión pre-viaje', '2024-10-01', '2024-10-01', 11500.00, 80.00, 'Taller Central', 'Completado', 'Aprobado para viaje'),
(9, 9, 'Preventivo', 'Cambio de pastillas de freno', '2024-09-05', '2024-09-06', 27000.00, 280.00, 'Taller Sur', 'Completado', 'Desgaste normal'),
(10, NULL, 'Preventivo', 'Mantenimiento mayor', '2024-08-20', '2024-08-22', 49000.00, 850.00, 'Taller Especializado', 'Completado', 'Cambio de correa de distribución'),
(12, 10, 'Correctivo', 'Reparación de suspensión', '2024-09-15', '2024-09-16', 9500.00, 380.00, 'Taller Central', 'Completado', 'Reemplazo de amortiguadores delanteros'),
(13, 5, 'Preventivo', 'Cambio de aceite y filtros', '2024-10-05', '2024-10-05', 19500.00, 145.00, 'Taller Norte', 'Completado', 'Todo correcto'),

-- Mantenimientos en proceso (últimos 30 días)
(3, NULL, 'Correctivo', 'Reparación de transmisión', '2024-10-15', NULL, 45000.00, 1200.00, 'Taller Especializado', 'En Proceso', 'Requiere piezas especiales'),
(7, NULL, 'Correctivo', 'Cambio de batería y sistema eléctrico', '2024-10-18', NULL, 35000.00, 320.00, 'Taller Central', 'En Proceso', 'Diagnóstico completo en progreso'),

-- Mantenimientos programados (próximos)
(1, 4, 'Preventivo', 'Cambio de aceite programado', '2024-11-15', NULL, 25000.00, 150.00, 'Taller Central', 'Programado', 'Mantenimiento cada 5,000 km'),
(4, 7, 'Inspección', 'Revisión de sistema de frenos', '2024-11-10', NULL, 60000.00, 180.00, 'Taller Central', 'Programado', 'Recomendado en inspección anterior'),
(6, 8, 'Preventivo', 'Cambio de filtro de aire', '2024-11-20', NULL, 30000.00, 90.00, 'Taller Norte', 'Programado', 'Mantenimiento de rutina'),
(9, 9, 'Preventivo', 'Rotación de llantas', '2024-11-25', NULL, 28000.00, 100.00, 'Taller Central', 'Programado', 'Cada 10,000 km'),
(12, 10, 'Preventivo', 'Cambio de aceite', '2024-12-01', NULL, 10000.00, 145.00, 'Taller Norte', 'Programado', 'Primer mantenimiento del vehículo nuevo'),
(14, 12, 'Inspección', 'Revisión general', '2024-11-18', NULL, 5000.00, 120.00, 'Taller Central', 'Programado', 'Primera revisión'),

-- Mantenimientos antiguos (más de 3 meses)
(11, NULL, 'Preventivo', 'Mantenimiento antes de inactivar', '2024-06-10', '2024-06-12', 54000.00, 450.00, 'Taller Central', 'Completado', 'Vehículo quedó en reserva'),
(15, NULL, 'Inspección', 'Inspección inicial', '2024-07-20', '2024-07-20', 2000.00, 100.00, 'Taller Central', 'Completado', 'Vehículo nuevo incorporado a la flota');
