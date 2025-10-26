-- 5. Implementar una transacci�n que registra mantenimiento y actualiza el estado del veh�culo

-- Variables de ejemplo
DECLARE @VehiculoID INT = 4; -- Veh�culo ELEC004 (Activo)
DECLARE @CostoServicio DECIMAL(10, 2) = 250.00;
DECLARE @ConductorID INT = 3;

BEGIN TRANSACTION;
BEGIN TRY
    -- a. Registra el mantenimiento
    INSERT INTO Mantenimientos (VehiculoID, ConductorID, FechaMantenimiento, TipoServicio, Costo)
    VALUES (@VehiculoID, @ConductorID, GETDATE(), 'Revisi�n Menor', @CostoServicio);

    -- b. Descuenta temporalmente la disponibilidad del veh�culo (cambia el estado)
    UPDATE Vehiculos
    SET Estado = 'En Mantenimiento'
    WHERE VehiculoID = @VehiculoID;

    -- Si ambas operaciones tienen �xito, confirma los cambios
    COMMIT TRANSACTION;
    PRINT 'Transacci�n exitosa: Mantenimiento registrado y veh�culo actualizado a En Mantenimiento.';

END TRY
BEGIN CATCH
    -- Si ocurre alg�n error (ej. VehiculoID no existe), deshace todos los cambios
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;

    PRINT 'Transacci�n fallida: Se realiz� un ROLLBACK.';
    -- Opcional: Mostrar el mensaje de error
    THROW;

END CATCH;

-- Para probar el ROLLBACK, cambie @VehiculoID a un valor que no existe (ej. 999)