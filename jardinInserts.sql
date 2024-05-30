-- Inserts para la tabla 'oficina'
INSERT INTO oficina (nombre) VALUES ('BCN-ES');
INSERT INTO oficina (nombre) VALUES ('BOS-USA');
INSERT INTO oficina (nombre) VALUES ('LON-UK');
INSERT INTO oficina (nombre) VALUES ('MAD-ES');
INSERT INTO oficina (nombre) VALUES ('PAR-FR');
INSERT INTO oficina (nombre) VALUES ('SFC-USA');
INSERT INTO oficina (nombre) VALUES ('SYD-AU');
INSERT INTO oficina (nombre) VALUES ('TAL-ES');
INSERT INTO oficina (nombre) VALUES ('TOK-JP');

-- Inserts para la tabla 'pais'
INSERT INTO pais (nombre) VALUES ('España');
INSERT INTO pais (nombre) VALUES ('EEUU');
INSERT INTO pais (nombre) VALUES ('Inglaterra');
INSERT INTO pais (nombre) VALUES ('Francia');
INSERT INTO pais (nombre) VALUES ('Australia');
INSERT INTO pais (nombre) VALUES ('Japón');

-- Inserts para la tabla 'region'
INSERT INTO region (nombre) VALUES ('Barcelona');
INSERT INTO region (nombre) VALUES ('MA');
INSERT INTO region (nombre) VALUES ('EMEA');
INSERT INTO region (nombre) VALUES ('Madrid');
INSERT INTO region (nombre) VALUES ('Castilla-LaMancha');
INSERT INTO region (nombre) VALUES ('Chiyoda-Ku');

-- Inserts para la tabla 'ciudad'
INSERT INTO ciudad (nombre, codigo_postal) VALUES ('Barcelona', '08019');
INSERT INTO ciudad (nombre, codigo_postal) VALUES ('Boston', '02108');
INSERT INTO ciudad (nombre, codigo_postal) VALUES ('Londres', 'EC2N 1HN');
INSERT INTO ciudad (nombre, codigo_postal) VALUES ('Madrid', '28032');
INSERT INTO ciudad (nombre, codigo_postal) VALUES ('Paris', '75017');
INSERT INTO ciudad (nombre, codigo_postal) VALUES ('San Francisco', '94080');
INSERT INTO ciudad (nombre, codigo_postal) VALUES ('Sydney', 'NSW 2010');
INSERT INTO ciudad (nombre, codigo_postal) VALUES ('Talavera de la Reina', '45632');
INSERT INTO ciudad (nombre, codigo_postal) VALUES ('Tokyo', '102-8578');

-- Inserts para la tabla 'tipo_telefono'
INSERT INTO tipo_telefono (tipo) VALUES ('Fijo');
INSERT INTO tipo_telefono (tipo) VALUES ('Movil');
INSERT INTO tipo_telefono (tipo) VALUES ('Fax');


-- Inserts para la tabla 'telefono_oficina'
-- Estos inserts asumen que todos los teléfonos son del tipo principal
INSERT INTO telefono_oficina (oficina_id, tipo_id, numero) VALUES (1, 1, '+34 93 3561182');
INSERT INTO telefono_oficina (oficina_id, tipo_id, numero) VALUES (2, 2, '+1 215 837 0825');
INSERT INTO telefono_oficina (oficina_id, tipo_id, numero) VALUES (3, 3, '+44 20 78772041');
INSERT INTO telefono_oficina (oficina_id, tipo_id, numero) VALUES (4, 1, '+34 91 7514487');
INSERT INTO telefono_oficina (oficina_id, tipo_id, numero) VALUES (5, 2, '+33 14 723 4404');
INSERT INTO telefono_oficina (oficina_id, tipo_id, numero) VALUES (6, 3, '+1 650 219 4782');
INSERT INTO telefono_oficina (oficina_id, tipo_id, numero) VALUES (7, 1, '+61 2 9264 2451');
INSERT INTO telefono_oficina (oficina_id, tipo_id, numero) VALUES (8, 2, '+34 925 867231');
INSERT INTO telefono_oficina (oficina_id, tipo_id, numero) VALUES (9, 3, '+81 33 224 5000');

-- Inserts para la tabla 'direccion_oficina'
INSERT INTO direccion_oficina (oficina_id, pais_id, region_id, ciudad_id, detalle) VALUES (1, 1, 1, 1, 'Avenida Diagonal, 38 - 3A escalera Derecha');
INSERT INTO direccion_oficina (oficina_id, pais_id, region_id, ciudad_id, detalle) VALUES (2, 2, 2, 2, '1550 Court Place - Suite 102');
INSERT INTO direccion_oficina (oficina_id, pais_id, region_id, ciudad_id, detalle) VALUES (3, 3, 3, 3, '52 Old Broad Street - Ground Floor');
INSERT INTO direccion_oficina (oficina_id, pais_id, region_id, ciudad_id, detalle) VALUES (4, 1, 4, 4, 'Bulevar Indalecio Prieto, 32');
INSERT INTO direccion_oficina (oficina_id, pais_id, region_id, ciudad_id, detalle) VALUES (5, 4, 3, 5, '29 Rue Jouffroy d''abbans');
INSERT INTO direccion_oficina (oficina_id, pais_id, region_id, ciudad_id, detalle) VALUES (6, 2, 2, 6, '100 Market Street - Suite 300');
INSERT INTO direccion_oficina (oficina_id, pais_id, region_id, ciudad_id, detalle) VALUES (7, 5, 6, 7, '5-11 Wentworth Avenue - Floor #2');
INSERT INTO direccion_oficina (oficina_id, pais_id, region_id, ciudad_id, detalle) VALUES (8, 1, 4, 8, 'Francisco Aguirre, 32 - 5º piso (exterior)');
INSERT INTO direccion_oficina (oficina_id, pais_id, region_id, ciudad_id, detalle) VALUES (9, 6, 6, 9, '4-1 Kioicho');


-- Inserts para los puestos
INSERT INTO puesto (puesto) VALUES ('Director General');
INSERT INTO puesto (puesto) VALUES ('Subdirector Marketing');
INSERT INTO puesto (puesto) VALUES ('Subdirector Ventas');
INSERT INTO puesto (puesto) VALUES ('Secretaria');
INSERT INTO puesto (puesto) VALUES ('Representante Ventas');

-- Inserts para la tabla de empleados
INSERT INTO empleado (nombre, apellido1, apellido2, extension, email, oficina_id, jefe_id, puesto_id) VALUES ( 'Marcos', 'Magaña', 'Perez', '3897', 'marcos@jardineria.es', 8, NULL, 1);
INSERT INTO empleado (nombre, apellido1, apellido2, extension, email, oficina_id, jefe_id, puesto_id) VALUES ( 'Ruben', 'López', 'Martinez', '2899', 'rlopez@jardineria.es', 8, 1, 2);
INSERT INTO empleado (nombre, apellido1, apellido2, extension, email, oficina_id, jefe_id, puesto_id) VALUES ( 'Alberto', 'Soria', 'Carrasco', '2837', 'asoria@jardineria.es', 8, 2, 3);
INSERT INTO empleado (nombre, apellido1, apellido2, extension, email, oficina_id, jefe_id, puesto_id) VALUES ( 'Maria', 'Solís', 'Jerez', '2847', 'msolis@jardineria.es', 8, 2, 4);
INSERT INTO empleado (nombre, apellido1, apellido2, extension, email, oficina_id, jefe_id, puesto_id) VALUES ( 'Felipe', 'Rosas', 'Marquez', '2844', 'frosas@jardineria.es', 8, 3, 5);
INSERT INTO empleado (nombre, apellido1, apellido2, extension, email, oficina_id, jefe_id, puesto_id) VALUES ( 'Juan Carlos', 'Ortiz', 'Serrano', '2845', 'cortiz@jardineria.es', 8, 3, 5);
INSERT INTO empleado (nombre, apellido1, apellido2, extension, email, oficina_id, jefe_id, puesto_id) VALUES ( 'Carlos', 'Soria', 'Jimenez', '2444', 'csoria@jardineria.es', 4, 3, 1);
INSERT INTO empleado (nombre, apellido1, apellido2, extension, email, oficina_id, jefe_id, puesto_id) VALUES ( 'Mariano', 'López', 'Murcia', '2442', 'mlopez@jardineria.es', 4, 7, 5);
INSERT INTO empleado (nombre, apellido1, apellido2, extension, email, oficina_id, jefe_id, puesto_id) VALUES ( 'Lucio', 'Campoamor', 'Martín', '2442', 'lcampoamor@jardineria.es', 4, 7, 5);
INSERT INTO empleado (nombre, apellido1, apellido2, extension, email, oficina_id, jefe_id, puesto_id) VALUES ( 'Hilario', 'Rodriguez', 'Huertas', '2444', 'hrodriguez@jardineria.es', 4, 7, 5);
INSERT INTO empleado (nombre, apellido1, apellido2, extension, email, oficina_id, jefe_id, puesto_id) VALUES ( 'Emmanuel', 'Magaña', 'Perez', '2518', 'manu@jardineria.es', 1, 3, 1);
INSERT INTO empleado (nombre, apellido1, apellido2, extension, email, oficina_id, jefe_id, puesto_id) VALUES ( 'José Manuel', 'Martinez', 'De la Osa', '2519', 'jmmart@hotmail.es', 1, 11, 5);
INSERT INTO empleado (nombre, apellido1, apellido2, extension, email, oficina_id, jefe_id, puesto_id) VALUES ( 'David', 'Palma', 'Aceituno', '2519', 'dpalma@jardineria.es', 1, 11, 5);
INSERT INTO empleado (nombre, apellido1, apellido2, extension, email, oficina_id, jefe_id, puesto_id) VALUES ( 'Oscar', 'Palma', 'Aceituno', '2519', 'opalma@jardineria.es', 1, 11, 5);
INSERT INTO empleado (nombre, apellido1, apellido2, extension, email, oficina_id, jefe_id, puesto_id) VALUES ( 'Francois', 'Fignon', '', '9981', 'ffignon@gardening.com', 5, 3, 1);
INSERT INTO empleado (nombre, apellido1, apellido2, extension, email, oficina_id, jefe_id, puesto_id) VALUES ( 'Lionel', 'Narvaez', '', '9982', 'lnarvaez@gardening.com', 5, 15, 5);
INSERT INTO empleado (nombre, apellido1, apellido2, extension, email, oficina_id, jefe_id, puesto_id) VALUES ( 'Laurent', 'Serra', '', '9982', 'lserra@gardening.com', 5, 15, 5);
INSERT INTO empleado (nombre, apellido1, apellido2, extension, email, oficina_id, jefe_id, puesto_id) VALUES ( 'Michael', 'Bolton', '', '7454', 'mbolton@gardening.com', 6, 3, 1);
INSERT INTO empleado (nombre, apellido1, apellido2, extension, email, oficina_id, jefe_id, puesto_id) VALUES ( 'Walter Santiago', 'Sanchez', 'Lopez', '7454', 'wssanchez@gardening.com', 6, 18, 5);
INSERT INTO empleado (nombre, apellido1, apellido2, extension, email, oficina_id, jefe_id, puesto_id) VALUES ( 'Hilary', 'Washington', '', '7565', 'hwashington@gardening.com', 2, 3, 1);
INSERT INTO empleado (nombre, apellido1, apellido2, extension, email, oficina_id, jefe_id, puesto_id) VALUES ( 'Marcus', 'Paxton', '', '7565', 'mpaxton@gardening.com', 2, 20, 5);
INSERT INTO empleado (nombre, apellido1, apellido2, extension, email, oficina_id, jefe_id, puesto_id) VALUES ( 'Lorena', 'Paxton', '', '7665', 'lpaxton@gardening.com', 2, 20, 5);
INSERT INTO empleado (nombre, apellido1, apellido2, extension, email, oficina_id, jefe_id, puesto_id) VALUES ( 'Nei', 'Nishikori', '', '8734', 'nnishikori@gardening.com', 9, 3, 1);
INSERT INTO empleado (nombre, apellido1, apellido2, extension, email, oficina_id, jefe_id, puesto_id) VALUES ( 'Narumi', 'Riko', '', '8734', 'nriko@gardening.com', 9, 23, 5);
INSERT INTO empleado (nombre, apellido1, apellido2, extension, email, oficina_id, jefe_id, puesto_id) VALUES ( 'Takuma', 'Nomura', '', '8735', 'tnomura@gardening.com', 9, 23, 5);
INSERT INTO empleado (nombre, apellido1, apellido2, extension, email, oficina_id, jefe_id, puesto_id) VALUES ( 'Amy', 'Johnson', '', '3321', 'ajohnson@gardening.com', 3, 3, 1);
INSERT INTO empleado (nombre, apellido1, apellido2, extension, email, oficina_id, jefe_id, puesto_id) VALUES ( 'Larry', 'Westfalls', '', '3322', 'lwestfalls@gardening.com', 3, 26, 5);
INSERT INTO empleado (nombre, apellido1, apellido2, extension, email, oficina_id, jefe_id, puesto_id) VALUES ( 'John', 'Walton', '', '3322', 'jwalton@gardening.com', 3, 26, 5);
INSERT INTO empleado (nombre, apellido1, apellido2, extension, email, oficina_id, jefe_id, puesto_id) VALUES ( 'Kevin', 'Fallmer', '', '3210', 'kfalmer@gardening.com', 7, 3, 1);
INSERT INTO empleado (nombre, apellido1, apellido2, extension, email, oficina_id, jefe_id, puesto_id) VALUES ( 'Julian', 'Bellinelli', '', '3211', 'jbellinelli@gardening.com', 7, 29, 5);
INSERT INTO empleado (nombre, apellido1, apellido2, extension, email, oficina_id, jefe_id, puesto_id) VALUES ( 'Mariko', 'Kishi', '', '3211', 'mkishi@gardening.com', 7, 29, 5);



