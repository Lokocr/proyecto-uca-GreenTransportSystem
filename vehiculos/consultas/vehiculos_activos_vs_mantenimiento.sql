-- 4.a: Comparar vehículos activos vs. en mantenimiento usando UNION
-- Muestra dos conjuntos: Activos y En Mantenimiento
SELECT Placa, Modelo, 'ACTIVO' AS EstadoFlota FROM Vehiculos WHERE Estado = 'Activo'
UNION
SELECT Placa, Modelo, 'EN MANTENIMIENTO' AS EstadoFlota FROM Vehiculos WHERE Estado = 'En Mantenimiento'
ORDER BY EstadoFlota DESC, Placa;

-- NOTA: Si quisiera usar EXCEPT, se podría ver qué vehículos están activos pero no han tenido un mantenimiento reciente.