-- 1 a -Listar mantenimientos por conductor
SELECT 
    c.conductor_id,
    CONCAT(c.nombre, ' ', c.apellido) AS nombre_completo,
    v.placa,
    m.tipo_mantenimiento,
    m.descripcion,
    m.fecha_inicio,
    m.fecha_fin,
    m.estado
FROM Mantenimientos m
INNER JOIN Conductores c ON m.conductor_id = c.conductor_id
INNER JOIN Vehiculos v ON m.vehiculo_id = v.vehiculo_id
ORDER BY c.conductor_id, m.fecha_inicio DESC;


-- 1 b - Mostrar vehículos sin mantenimiento en el último mes
SELECT 
    v.vehiculo_id,
    v.placa,
    v.marca,
    v.modelo
FROM Vehiculos v
LEFT JOIN Mantenimientos m 
    ON v.vehiculo_id = m.vehiculo_id 
    AND m.fecha_inicio >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
WHERE m.mantenimiento_id IS NULL;


-- 2 a Union

SELECT placa, marca, modelo, estado
FROM Vehiculos
WHERE estado IN ('Disponible', 'En Ruta')

UNION

SELECT placa, marca, modelo, estado
FROM Vehiculos
WHERE estado = 'En Mantenimiento';

-- 2 b  Intersect
SELECT placa, marca, modelo, estado
FROM Vehiculos
WHERE estado IN ('Disponible', 'En Ruta')

INTERSECT

SELECT placa, marca, modelo, estado
FROM Vehiculos
WHERE estado = 'En Mantenimiento';


-- 2 c  Except
SELECT placa, marca, modelo, estado
FROM Vehiculos
WHERE estado IN ('Disponible', 'En Ruta')

EXCEPT

SELECT placa, marca, modelo, estado
FROM Vehiculos
WHERE estado = 'En Mantenimiento';


-- 3 - Transacción para registrar mantenimiento y actualizar estado del vehículo

BEGIN TRANSACTION;

BEGIN TRY
    -- a. Registrar un mantenimiento
    INSERT INTO Mantenimientos (
        vehiculo_id, conductor_id, tipo_mantenimiento, descripcion, fecha_inicio, kilometraje_actual, costo, taller, estado
    ) VALUES (
        @vehiculo_id, @conductor_id, @tipo_mantenimiento, @descripcion, @fecha_inicio, @kilometraje_actual, @costo, @taller, 'En Proceso'
    );

    -- b. Cambiar estado del vehículo a 'En Mantenimiento'
    UPDATE Vehiculos
    SET estado = 'En Mantenimiento'
    WHERE vehiculo_id = @vehiculo_id;

    COMMIT;
END TRY
BEGIN CATCH
    ROLLBACK;
    -- Opcional: Mostrar el error
    SELECT ERROR_MESSAGE() AS Error;
END CATCH

