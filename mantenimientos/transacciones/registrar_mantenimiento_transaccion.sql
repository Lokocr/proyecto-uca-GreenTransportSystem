-- 5. Implementar una transacción que registra mantenimiento y actualiza el estado del vehículo

-- Variables de ejemplo
DECLARE @VehiculoID INT = 4; -- Vehículo ELEC004 (Activo)
DECLARE @CostoServicio DECIMAL(10, 2) = 250.00;
DECLARE @ConductorID INT = 3;

BEGIN TRANSACTION;
BEGIN TRY
    -- a. Registra el mantenimiento
    INSERT INTO Mantenimientos (VehiculoID, ConductorID, FechaMantenimiento, TipoServicio, Costo)
    VALUES (@VehiculoID, @ConductorID, GETDATE(), 'Revisión Menor', @CostoServicio);

    -- b. Descuenta temporalmente la disponibilidad del vehículo (cambia el estado)
    UPDATE Vehiculos
    SET Estado = 'En Mantenimiento'
    WHERE VehiculoID = @VehiculoID;

    -- Si ambas operaciones tienen éxito, confirma los cambios
    COMMIT TRANSACTION;
    PRINT 'Transacción exitosa: Mantenimiento registrado y vehículo actualizado a En Mantenimiento.';

END TRY
BEGIN CATCH
    -- Si ocurre algún error (ej. VehiculoID no existe), deshace todos los cambios
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;

    PRINT 'Transacción fallida: Se realizó un ROLLBACK.';
    -- Opcional: Mostrar el mensaje de error
    THROW;

END CATCH;

-- Para probar el ROLLBACK, cambie @VehiculoID a un valor que no existe (ej. 999)