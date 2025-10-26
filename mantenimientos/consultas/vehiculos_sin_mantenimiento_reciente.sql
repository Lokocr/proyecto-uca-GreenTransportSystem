-- 3.b: Mostrar veh�culos sin mantenimiento en el �ltimo mes
SELECT
    V.Placa,
    V.Modelo,
    MAX(M.FechaMantenimiento) AS UltimoMantenimiento
FROM
    Vehiculos V
LEFT JOIN
    Mantenimientos M ON V.VehiculoID = M.VehiculoID
GROUP BY
    V.Placa, V.Modelo
HAVING
    -- Filtra los que NO tienen mantenimiento o cuyo �ltimo mantenimiento es anterior a 30 d�as
    MAX(M.FechaMantenimiento) IS NULL OR MAX(M.FechaMantenimiento) < DATEADD(month, -1, GETDATE())
ORDER BY
    UltimoMantenimiento;