-- 3.a: Listar mantenimientos por conductor
SELECT
    C.Nombre AS NombreConductor,
    V.Placa AS PlacaVehiculo,
    M.FechaMantenimiento,
    M.TipoServicio,
    M.Costo
FROM
    Conductores C
JOIN
    Vehiculos V ON C.VehiculoAsignadoID = V.VehiculoID
LEFT JOIN
    Mantenimientos M ON V.VehiculoID = M.VehiculoID
WHERE
    M.MantenimientoID IS NOT NULL -- Solo muestra registros con mantenimiento
ORDER BY
    C.Nombre, M.FechaMantenimiento DESC;