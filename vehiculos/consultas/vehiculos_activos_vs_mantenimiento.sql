-- 4.a: Comparar veh�culos activos vs. en mantenimiento usando UNION
-- Muestra dos conjuntos: Activos y En Mantenimiento
SELECT Placa, Modelo, 'ACTIVO' AS EstadoFlota FROM Vehiculos WHERE Estado = 'Activo'
UNION
SELECT Placa, Modelo, 'EN MANTENIMIENTO' AS EstadoFlota FROM Vehiculos WHERE Estado = 'En Mantenimiento'
ORDER BY EstadoFlota DESC, Placa;

-- NOTA: Si quisiera usar EXCEPT, se podr�a ver qu� veh�culos est�n activos pero no han tenido un mantenimiento reciente.