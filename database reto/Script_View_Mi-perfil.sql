use reto_sensor;

SELECT Perfiles.nombre AS `Nombre`, Perfiles.apellido AS `Apellido`, Sensor_oxi.medicion_oxi AS `% Oxigenación`, Sensor_cardio.medicion_cardio AS `Ritmo Cardiaco`, Sensor_cardio.fecha AS `Fecha`, Sensor_oxi.fecha AS `Fecha`
FROM reto_sensor.Perfiles
JOIN reto_sensor.Sensor_cardio
ON reto_sensor.Perfiles.id_perfil = reto_sensor.Sensor_cardio.id_perfil
JOIN reto_sensor.Sensor_oxi
ON reto_sensor.Perfiles.id_perfil = reto_sensor.Sensor_oxi.id_perfil;


-- ALTER TABLE tablename AUTO_INCREMENT = 1;
 -- SELECT * FROM Perfiles;
-- SELECT * FROM Sensor_oxi;
 -- SELECT * FROM Perfiles; 