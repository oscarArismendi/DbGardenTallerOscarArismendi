USE gardenDb;
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

-- insert gama_producto 
INSERT INTO gama_producto VALUES ('Herbaceas','Plantas para jardin decorativas',NULL,NULL);
INSERT INTO gama_producto VALUES ('Herramientas','Herramientas para todo tipo de acción',NULL,NULL);
INSERT INTO gama_producto VALUES ('Aromáticas','Plantas aromáticas',NULL,NULL);
INSERT INTO gama_producto VALUES ('Frutales','Árboles pequeños de producción frutal',NULL,NULL);
INSERT INTO gama_producto VALUES ('Ornamentales','Plantas vistosas para la decoración del jardín',NULL,NULL);
-- insert contacto
INSERT INTO contacto (nombre, apellido, email) VALUES ('Daniel G', 'GoldFish', 'danielg.goldfish@example.com');
INSERT INTO contacto (nombre, apellido, email) VALUES ('Anne', 'Wright', 'anne.wright@example.com');
INSERT INTO contacto (nombre, apellido, email) VALUES ('Link', 'Flaute', 'link.flaute@example.com');
INSERT INTO contacto (nombre, apellido, email) VALUES ('Akane', 'Tendo', 'akane.tendo@example.com');
INSERT INTO contacto (nombre, apellido, email) VALUES ('Antonio', 'Lasas', 'antonio.lasas@example.com');
INSERT INTO contacto (nombre, apellido, email) VALUES ('Jose', 'Bermejo', 'jose.bermejo@example.com');
INSERT INTO contacto (nombre, apellido, email) VALUES ('Paco', 'Lopez', 'paco.lopez@example.com');
INSERT INTO contacto (nombre, apellido, email) VALUES ('Guillermo', 'Rengifo', 'guillermo.rengifo@example.com');
INSERT INTO contacto (nombre, apellido, email) VALUES ('David', 'Serrano', 'david.serrano@example.com');
INSERT INTO contacto (nombre, apellido, email) VALUES ('Jose', 'Tacaño', 'jose.tacano@example.com');
INSERT INTO contacto (nombre, apellido, email) VALUES ('Pedro', 'Camunas', 'pedro.camunas@example.com');
INSERT INTO contacto (nombre, apellido, email) VALUES ('Juan', 'Rodriguez', 'juan.rodriguez@example.com');
INSERT INTO contacto (nombre, apellido, email) VALUES ('Javier', 'Villar', 'javier.villar@example.com');
INSERT INTO contacto (nombre, apellido, email) VALUES ('Maria', 'Rodriguez', 'maria.rodriguez@example.com');
INSERT INTO contacto (nombre, apellido, email) VALUES ('Beatriz', 'Fernandez', 'beatriz.fernandez@example.com');
INSERT INTO contacto (nombre, apellido, email) VALUES ('Victoria', 'Cruz', 'victoria.cruz@example.com');
INSERT INTO contacto (nombre, apellido, email) VALUES ('Luis', 'Martinez', 'luis.martinez@example.com');
INSERT INTO contacto (nombre, apellido, email) VALUES ('Mario', 'Suarez', 'mario.suarez@example.com');
INSERT INTO contacto (nombre, apellido, email) VALUES ('Cristian', 'Rodrigez', 'cristian.rodriguez@example.com');
INSERT INTO contacto (nombre, apellido, email) VALUES ('Francisco', 'Camacho', 'francisco.camacho@example.com');
INSERT INTO contacto (nombre, apellido, email) VALUES ('Maria', 'Santillana', 'maria.santillana@example.com');
INSERT INTO contacto (nombre, apellido, email) VALUES ('Federico', 'Gomez', 'federico.gomez@example.com');
INSERT INTO contacto (nombre, apellido, email) VALUES ('Tony', 'Muñoz Mena', 'tony.munoz@example.com');
INSERT INTO contacto (nombre, apellido, email) VALUES ('Eva María', 'Sánchez', 'eva.sanchez@example.com');
INSERT INTO contacto (nombre, apellido, email) VALUES ('Matías', 'San Martín', 'matias.sanmartin@example.com');
INSERT INTO contacto (nombre, apellido, email) VALUES ('Benito', 'Lopez', 'benito.lopez@example.com');
INSERT INTO contacto (nombre, apellido, email) VALUES ('Joseluis', 'Sanchez', 'joseluis.sanchez@example.com');
INSERT INTO contacto (nombre, apellido, email) VALUES ('Sara', 'Marquez', 'sara.marquez@example.com');
INSERT INTO contacto (nombre, apellido, email) VALUES ('Luis', 'Jimenez', 'luis.jimenez@example.com');
INSERT INTO contacto (nombre, apellido, email) VALUES ('FraÃ§ois', 'Toulou', 'francois.toulou@example.com');
INSERT INTO contacto (nombre, apellido, email) VALUES ('Pierre', 'Delacroux', 'pierre.delacroux@example.com');
INSERT INTO contacto (nombre, apellido, email) VALUES ('Jacob', 'Jones', 'jacob.jones@example.com');
INSERT INTO contacto (nombre, apellido, email) VALUES ('Antonio', 'Romero', 'antonio.romero@example.com');
INSERT INTO contacto (nombre, apellido, email) VALUES ('Richard', 'Mcain', 'richard.mcain@example.com');
INSERT INTO contacto (nombre, apellido, email) VALUES ('Justin', 'Smith', 'justin.smith@example.com');


-- insert cliente
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (1, 'GoldFish Garden', 1, 19, 3000.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (3, 'Gardening Associates', 2, 19, 6000.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (4, 'Gerudo Valley', 3, 22, 12000.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (5, 'Tendo Garden', 4, 22, 600000.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (6, 'Lasas S.A.', 5, 8, 154310.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (7, 'Beragua', 6, 11, 20000.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (8, 'Club Golf Puerta del hierro', 7, 11, 40000.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (9, 'Naturagua', 8, 11, 32000.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (10, 'DaraDistribuciones', 9, 11, 50000.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (11, 'Madrileña de riegos', 10, 11, 20000.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (12, 'Lasas S.A.', 5, 8, 154310.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (13, 'Camunas Jardines S.L.', 11, 8, 16481.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (14, 'Dardena S.A.', 12, 8, 321000.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (15, 'Jardin de Flores', 13, 30, 40000.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (16, 'Flores Marivi', 14, 5, 1500.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (17, 'Flowers, S.A', 15, 5, 3500.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (18, 'Naturajardin', 16, 30, 5050.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (19, 'Golf S.A.', 17, 12, 30000.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (20, 'Americh Golf Management SL', 18, 12, 20000.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (21, 'Aloha', 19, 12, 50000.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (22, 'El Prat', 20, 12, 30000.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (23, 'Sotogrande', 21, 12, 60000.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (24, 'Vivero Humanes', 22, 30, 7430.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (25, 'Fuenla City', 23, 5, 4500.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (26, 'Jardines y Mansiones Cactus SL', 24, 9, 76000.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (27, 'Jardinerías Matías SL', 25, 9, 100500.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (28, 'Agrojardin', 26, 30, 8040.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (29, 'Top Campo', 27, 5, 5500.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (30, 'Jardineria Sara', 28, 5, 7500.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (31, 'Campohermoso', 29, 30, 3250.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (32, 'france telecom', 30, 16, 10000.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (33, 'Musée du Louvre', 31, 16, 30000.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (35, 'Tutifruti S.A', 32, 31, 10000.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (36, 'Flores S.L.', 33, 18, 6000.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (37, 'The Magic Garden', 34, 18, 10000.00);
INSERT INTO cliente (id, nombre, contacto_id, empleado_id, limite_credito) VALUES (38, 'El Jardin Viviente S.L', 35, 31, 8000.00);

-- insert telefono_cliente

-- Fijo
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (1, 1, '5556901745');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (3, 1, '5557410345');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (4, 1, '5552323129');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (5, 1, '55591233210');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (6, 1, '34916540145');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (7, 1, '654987321');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (8, 1, '62456810');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (9, 1, '689234750');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (10, 1, '675598001');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (11, 1, '655983045');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (12, 1, '34916540146');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (13, 1, '34914873241');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (14, 1, '34912453217');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (15, 1, '654865643');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (16, 1, '666555444');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (17, 1, '698754159');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (18, 1, '612343529');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (19, 1, '916458762');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (20, 1, '964493072');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (21, 1, '916485852');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (22, 1, '916882323');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (23, 1, '915576622');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (24, 1, '654987690');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (25, 1, '675842139');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (26, 1, '916877445');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (27, 1, '916544147');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (28, 1, '675432926');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (29, 1, '685746512');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (30, 1, '675124537');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (31, 1, '645925376');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (32, 1, '(33)5120578961');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (33, 1, '(33)0140205050');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (35, 1, '2 9261-2433');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (36, 1, '654352981');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (37, 1, '926523468');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (38, 1, '2 8005-7161');

-- Fax
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (1, 3, '5556901746');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (3, 3, '5557410346');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (4, 3, '5552323128');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (5, 3, '55591233211');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (6, 3, '34914851312');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (7, 3, '916549872');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (8, 3, '919535678');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (9, 3, '916428956');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (10, 3, '916421756');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (11, 3, '916689215');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (12, 3, '34914851313');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (13, 3, '34914871541');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (14, 3, '34912484764');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (15, 3, '914538776');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (16, 3, '912458657');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (17, 3, '978453216');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (18, 3, '916548735');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (19, 3, '912354475');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (20, 3, '964493063');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (21, 3, '914489898');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (22, 3, '916493211');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (23, 3, '914825645');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (24, 3, '916040875');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (25, 3, '915483754');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (26, 3, '914477777');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (27, 3, '917897474');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (28, 3, '916549264');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (29, 3, '974315924');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (30, 3, '912475843');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (31, 3, '916159116');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (32, 3, '(33)5120578962');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (33, 3, '(33)0140205442');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (35, 3, '2 9283-1695');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (36, 3, '685249700');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (37, 3, '9364875882');
INSERT INTO telefono_cliente (cliente_id, tipo_id, numero) VALUES (38, 3, '2 8005-7162');

-- insert direccion cliente

INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (1, 2, 4, 6, 'False Street 52 2 A');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (3, 2, 4, 6, 'Wall-e Avenue');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (4, 2, 4, 6, 'Oaks Avenue nº22');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (5, 2, 4, 6, 'Null Street nº69');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (6, 1, 4, 4, 'C/Leganes 15');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (7, 1, 4, 4, 'C/pintor segundo');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (8, 1, 4, 4, 'C/sinesio delgado');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (9, 1, 4, 4, 'C/majadahonda');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (10, 1, 4, 4, 'C/azores');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (11, 1, 4, 4, 'C/Lagañas');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (12, 1, 4, 4, 'C/Leganes 15');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (13, 1, 4, 4, 'C/Virgenes 45');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (14, 1, 4, 4, 'C/Nueva York 74');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (15, 1, 4, 4, 'C/ Oña 34');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (16, 1, 4, 4, 'C/Leganes24');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (17, 1, 4, 4, 'C/Luis Salquillo4');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (18, 1, 4, 4, 'Plaza Magallón 15');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (19, 1, 4, 4, 'C/Estancado');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (20, 1, 1, 1, 'C/Letardo');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (21, 1, 1, 1, 'C/Roman 3');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (22, 1, 1, 1, 'Avenida Tibidabo');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (23, 1, 4, 4, 'C/Paseo del Parque');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (24, 1, 4, 4, 'C/Miguel Echegaray 54');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (25, 1, 4, 4, 'C/Callo 52');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (26, 1, 4, 4, 'Polígono Industrial Maspalomas, Nº52');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (27, 1, 4, 4, 'C/Francisco Arce, Nº44');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (28, 1, 4, 4, 'C/Mar Caspio 43');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (29, 1, 4, 4, 'C/Ibiza 32');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (30, 1, 4, 4, 'C/Lima 1');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (31, 1, 4, 4, 'C/Peru 78');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (32, 4, 4, 5, '6 place d Alleray 15Ã¨me');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (33, 4, 4, 5, 'Quai du Louvre');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (35, 5, 5, 7, 'level 24, St. Martins Tower.-31 Market St.');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (36, 1, 4, 4, 'Avenida España');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (37, 3, 3, 3, 'Lihgting Park');
INSERT INTO direccion_cliente (cliente_id, pais_id, region_id, ciudad_id, detalle) VALUES (38, 5, 5, 7, '176 Cumberland Street The rocks');
-- insert estado_pedido 

INSERT INTO estado_pedido (estado) VALUES ('Entregado');
INSERT INTO estado_pedido (estado) VALUES ('Rechazado');
INSERT INTO estado_pedido (estado) VALUES ('Pendiente');

-- insert pedido

INSERT INTO pedido (id, fecha_pedido, fecha_esperada, fecha_entrega, estado_pedido_id, cliente_id, pago_id, comentarios) VALUES 
(1, '2006-01-17', '2006-01-19', '2006-01-19', 1, 5, NULL, 'Pagado a plazos'),
(2, '2007-10-23', '2007-10-28', '2007-10-26', 1, 5, NULL, 'La entrega llego antes de lo esperado'),
(3, '2008-06-20', '2008-06-25', NULL, 2, 5, NULL, 'Limite de credito superado'),
(4, '2009-01-20', '2009-01-26', NULL, 3, 5, NULL, NULL),
(8, '2008-11-09', '2008-11-14', '2008-11-14', 1, 1, NULL, 'El cliente paga la mitad con tarjeta y la otra mitad con efectivo, se le realizan dos facturas'),
(9, '2008-12-22', '2008-12-27', '2008-12-28', 1, 1, NULL, 'El cliente comprueba la integridad del paquete, todo correcto'),
(10, '2009-01-15', '2009-01-20', NULL, 3, 3, NULL, 'El cliente llama para confirmar la fecha - Esperando al proveedor'),
(11, '2009-01-20', '2009-01-27', NULL, 3, 1, NULL, 'El cliente requiere que el pedido se le entregue de 16:00h a 22:00h'),
(12, '2009-01-22', '2009-01-27', NULL, 3, 1, NULL, 'El cliente requiere que el pedido se le entregue de 9:00h a 13:00h'),
(13, '2009-01-12', '2009-01-14', '2009-01-15', 1, 7, NULL, NULL),
(14, '2009-01-02', '2009-01-02', NULL, 2, 7, NULL, 'mal pago'),
(15, '2009-01-09', '2009-01-12', '2009-01-11', 1, 7, NULL, NULL),
(16, '2009-01-06', '2009-01-07', '2009-01-15', 1, 7, NULL, NULL),
(17, '2009-01-08', '2009-01-09', '2009-01-11', 1, 7, NULL, 'mal estado'),
(18, '2009-01-05', '2009-01-06', '2009-01-07', 1, 9, NULL, NULL),
(19, '2009-01-18', '2009-02-12', NULL, 3, 9, NULL, 'entregar en murcia'),
(20, '2009-01-20', '2009-02-15', NULL, 3, 9, NULL, NULL),
(21, '2009-01-09', '2009-01-09', '2009-01-09', 2, 9, NULL, 'mal pago'),
(22, '2009-01-11', '2009-01-11', '2009-01-13', 1, 9, NULL, NULL),
(23, '2008-12-30', '2009-01-10', NULL, 2, 5, NULL, 'El pedido fue anulado por el cliente'),
(24, '2008-07-14', '2008-07-31', '2008-07-25', 1, 14, NULL, NULL),
(25, '2009-02-02', '2009-02-08', NULL, 2, 1, NULL, 'El cliente carece de saldo en la cuenta asociada'),
(26, '2009-02-06', '2009-02-12', NULL, 2, 3, NULL, 'El cliente anula la operacion para adquirir mas producto'),
(27, '2009-02-07', '2009-02-13', NULL, 1, 3, NULL, 'El pedido aparece como entregado pero no sabemos en que fecha'),
(28, '2009-02-10', '2009-02-17', '2009-02-20', 1, 3, NULL, 'El cliente se queja bastante de la espera asociada al producto'),
(29, '2008-08-01', '2008-09-01', '2008-09-01', 2, 14, NULL, 'El cliente no está conforme con el pedido'),
(30, '2008-08-03', '2008-09-03', '2008-08-31', 1, 13, NULL, NULL),
(31, '2008-09-04', '2008-09-30', '2008-10-04', 2, 13, NULL, 'El cliente ha rechazado por llegar 5 dias tarde'),
(32, '2007-01-07', '2007-01-19', '2007-01-27', 1, 4, NULL, 'Entrega tardia, el cliente puso reclamacion'),
(33, '2007-05-20', '2007-05-28', NULL, 2, 4, NULL, 'El pedido fue anulado por el cliente'),
(34, '2007-06-20', '2008-06-28', '2008-06-28', 1, 4, NULL, 'Pagado a plazos'),
(35, '2008-03-10', '2009-03-20', NULL, 2, 4, NULL, 'Limite de credito superado'),
(36, '2008-10-15', '2008-12-15', '2008-12-10', 1, 14, NULL, NULL),
(37, '2008-10-15', '2008-12-20', '2008-12-12', 1, 14, NULL, NULL),
(38, '2009-02-10', '2009-02-15', NULL, 2, 14, NULL, 'El cliente anula el pedido');

-- insert detalle pedido


-- insert de tabla guia
INSERT INTO detalle_pedido VALUES (1,'FR-67',10,70,3);
INSERT INTO detalle_pedido VALUES (1,'OR-127',40,4,1);
INSERT INTO detalle_pedido VALUES (1,'OR-141',25,4,2);
INSERT INTO detalle_pedido VALUES (1,'OR-241',15,19,4);
INSERT INTO detalle_pedido VALUES (1,'OR-99',23,14,5);
INSERT INTO detalle_pedido VALUES (2,'FR-4',3,29,6);
INSERT INTO detalle_pedido VALUES (2,'FR-40',7,8,7);
INSERT INTO detalle_pedido VALUES (2,'OR-140',50,4,3);
INSERT INTO detalle_pedido VALUES (2,'OR-141',20,5,2);
INSERT INTO detalle_pedido VALUES (2,'OR-159',12,6,5);
INSERT INTO detalle_pedido VALUES (2,'OR-227',67,64,1);
INSERT INTO detalle_pedido VALUES (2,'OR-247',5,462,4);
INSERT INTO detalle_pedido VALUES (3,'FR-48',120,9,6);
INSERT INTO detalle_pedido VALUES (3,'OR-122',32,5,4);
INSERT INTO detalle_pedido VALUES (3,'OR-123',11,5,5);
INSERT INTO detalle_pedido VALUES (3,'OR-213',30,266,1);
INSERT INTO detalle_pedido VALUES (3,'OR-217',15,65,2);
INSERT INTO detalle_pedido VALUES (3,'OR-218',24,25,3);
INSERT INTO detalle_pedido VALUES (4,'FR-31',12,8,7);
INSERT INTO detalle_pedido VALUES (4,'FR-34',42,8,6);
INSERT INTO detalle_pedido VALUES (4,'FR-40',42,9,8);
INSERT INTO detalle_pedido VALUES (4,'OR-152',3,6,5);
INSERT INTO detalle_pedido VALUES (4,'OR-155',4,6,3);
INSERT INTO detalle_pedido VALUES (4,'OR-156',17,9,4);
INSERT INTO detalle_pedido VALUES (4,'OR-157',38,10,2);
INSERT INTO detalle_pedido VALUES (4,'OR-222',21,59,1);
INSERT INTO detalle_pedido VALUES (8,'FR-106',3,11,1);
INSERT INTO detalle_pedido VALUES (8,'FR-108',1,32,2);
INSERT INTO detalle_pedido VALUES (8,'FR-11',10,100,3);
INSERT INTO detalle_pedido VALUES (9,'AR-001',80,1,3);
INSERT INTO detalle_pedido VALUES (9,'AR-008',450,1,2);
INSERT INTO detalle_pedido VALUES (9,'FR-106',80,8,1);
INSERT INTO detalle_pedido VALUES (9,'FR-69',15,91,2);
INSERT INTO detalle_pedido VALUES (10,'FR-82',5,70,2);
INSERT INTO detalle_pedido VALUES (10,'FR-91',30,75,1);
INSERT INTO detalle_pedido VALUES (10,'OR-234',5,64,3);
INSERT INTO detalle_pedido VALUES (11,'AR-006',180,1,3);
INSERT INTO detalle_pedido VALUES (11,'OR-247',80,8,1);
INSERT INTO detalle_pedido VALUES (12,'AR-009',290,1,1);
INSERT INTO detalle_pedido VALUES (13,'11679',5,14,1);
INSERT INTO detalle_pedido VALUES (13,'21636',12,14,2);
INSERT INTO detalle_pedido VALUES (13,'FR-11',5,100,3);
INSERT INTO detalle_pedido VALUES (14,'FR-100',8,11,2);
INSERT INTO detalle_pedido VALUES (14,'FR-13',13,57,1);
INSERT INTO detalle_pedido VALUES (15,'FR-84',4,13,3);
INSERT INTO detalle_pedido VALUES (15,'OR-101',2,6,2);
INSERT INTO detalle_pedido VALUES (15,'OR-156',6,10,1);
INSERT INTO detalle_pedido VALUES (15,'OR-203',9,10,4);
INSERT INTO detalle_pedido VALUES (16,'30310',12,12,1);
INSERT INTO detalle_pedido VALUES (16,'FR-36',10,9,2);
INSERT INTO detalle_pedido VALUES (17,'11679',5,14,1);
INSERT INTO detalle_pedido VALUES (17,'22225',5,12,3);
INSERT INTO detalle_pedido VALUES (17,'FR-37',5,9,2);
INSERT INTO detalle_pedido VALUES (17,'FR-64',5,22,4);
INSERT INTO detalle_pedido VALUES (17,'OR-136',5,18,5);
INSERT INTO detalle_pedido VALUES (18,'22225',4,12,2);
INSERT INTO detalle_pedido VALUES (18,'FR-22',2,4,1);
INSERT INTO detalle_pedido VALUES (18,'OR-159',10,6,3);
INSERT INTO detalle_pedido VALUES (19,'30310',9,12,5);
INSERT INTO detalle_pedido VALUES (19,'FR-23',6,8,4);
INSERT INTO detalle_pedido VALUES (19,'FR-75',1,32,2);
INSERT INTO detalle_pedido VALUES (19,'FR-84',5,13,1);
INSERT INTO detalle_pedido VALUES (19,'OR-208',20,4,3);
INSERT INTO detalle_pedido VALUES (20,'11679',14,14,1);
INSERT INTO detalle_pedido VALUES (20,'30310',8,12,2);
INSERT INTO detalle_pedido VALUES (21,'21636',5,14,3);
INSERT INTO detalle_pedido VALUES (21,'FR-18',22,4,1);
INSERT INTO detalle_pedido VALUES (21,'FR-53',3,8,2);
INSERT INTO detalle_pedido VALUES (22,'OR-240',1,6,1);
INSERT INTO detalle_pedido VALUES (23,'AR-002',110,1,4);
INSERT INTO detalle_pedido VALUES (23,'FR-107',50,22,3);
INSERT INTO detalle_pedido VALUES (23,'FR-85',4,70,2);
INSERT INTO detalle_pedido VALUES (23,'OR-249',30,5,1);
INSERT INTO detalle_pedido VALUES (24,'22225',3,15,1);
INSERT INTO detalle_pedido VALUES (24,'FR-1',4,7,4);
INSERT INTO detalle_pedido VALUES (24,'FR-23',2,7,2);
INSERT INTO detalle_pedido VALUES (24,'OR-241',10,20,3);
INSERT INTO detalle_pedido VALUES (25,'FR-77',15,69,1);
INSERT INTO detalle_pedido VALUES (25,'FR-9',4,30,3);
INSERT INTO detalle_pedido VALUES (25,'FR-94',10,30,2);
INSERT INTO detalle_pedido VALUES (26,'FR-15',9,25,3);
INSERT INTO detalle_pedido VALUES (26,'OR-188',4,25,1);
INSERT INTO detalle_pedido VALUES (26,'OR-218',14,25,2);
INSERT INTO detalle_pedido VALUES (27,'OR-101',22,6,2);
INSERT INTO detalle_pedido VALUES (27,'OR-102',22,6,3);
INSERT INTO detalle_pedido VALUES (27,'OR-186',40,6,1);
INSERT INTO detalle_pedido VALUES (28,'FR-11',8,99,3);
INSERT INTO detalle_pedido VALUES (28,'OR-213',3,266,2);
INSERT INTO detalle_pedido VALUES (28,'OR-247',1,462,1);
INSERT INTO detalle_pedido VALUES (29,'FR-82',4,70,4);
INSERT INTO detalle_pedido VALUES (29,'FR-9',4,28,1);
INSERT INTO detalle_pedido VALUES (29,'FR-94',20,31,5);
INSERT INTO detalle_pedido VALUES (29,'OR-129',2,111,2);
INSERT INTO detalle_pedido VALUES (29,'OR-160',10,9,3);
INSERT INTO detalle_pedido VALUES (30,'AR-004',10,1,6);
INSERT INTO detalle_pedido VALUES (30,'FR-108',2,32,2);
INSERT INTO detalle_pedido VALUES (30,'FR-12',2,19,3);
INSERT INTO detalle_pedido VALUES (30,'FR-72',4,31,5);
INSERT INTO detalle_pedido VALUES (30,'FR-89',10,45,1);
INSERT INTO detalle_pedido VALUES (30,'OR-120',5,5,4);
INSERT INTO detalle_pedido VALUES (31,'AR-009',25,2,3);
INSERT INTO detalle_pedido VALUES (31,'FR-102',1,20,1);
INSERT INTO detalle_pedido VALUES (31,'FR-4',6,29,2);
INSERT INTO detalle_pedido VALUES (32,'11679',1,14,4);
INSERT INTO detalle_pedido VALUES (32,'21636',4,15,5);
INSERT INTO detalle_pedido VALUES (32,'22225',1,15,3);
INSERT INTO detalle_pedido VALUES (32,'OR-128',29,100,2);
INSERT INTO detalle_pedido VALUES (32,'OR-193',5,20,1);
INSERT INTO detalle_pedido VALUES (33,'FR-17',423,2,4);
INSERT INTO detalle_pedido VALUES (33,'FR-29',120,8,3);
INSERT INTO detalle_pedido VALUES (33,'OR-214',212,10,2);
INSERT INTO detalle_pedido VALUES (33,'OR-247',150,462,1);
INSERT INTO detalle_pedido VALUES (34,'FR-3',56,7,4);
INSERT INTO detalle_pedido VALUES (34,'FR-7',12,29,3);
INSERT INTO detalle_pedido VALUES (34,'OR-172',20,18,1);
INSERT INTO detalle_pedido VALUES (34,'OR-174',24,18,2);
INSERT INTO detalle_pedido VALUES (35,'21636',12,14,4);
INSERT INTO detalle_pedido VALUES (35,'FR-47',55,8,3);
INSERT INTO detalle_pedido VALUES (35,'OR-165',3,10,2);
INSERT INTO detalle_pedido VALUES (35,'OR-181',36,10,1);
INSERT INTO detalle_pedido VALUES (35,'OR-225',72,10,5);
INSERT INTO detalle_pedido VALUES (36,'30310',4,12,2);
INSERT INTO detalle_pedido VALUES (36,'FR-1',2,7,3);
INSERT INTO detalle_pedido VALUES (36,'OR-147',6,7,4);
INSERT INTO detalle_pedido VALUES (36,'OR-203',1,12,5);
INSERT INTO detalle_pedido VALUES (36,'OR-99',15,13,1);
INSERT INTO detalle_pedido VALUES (37,'FR-105',4,70,1);
INSERT INTO detalle_pedido VALUES (37,'FR-57',203,8,2);
INSERT INTO detalle_pedido VALUES (37,'OR-176',38,10,3);
INSERT INTO detalle_pedido VALUES (38,'11679',5,14,1);
INSERT INTO detalle_pedido VALUES (38,'21636',2,14,2);
INSERT INTO detalle_pedido VALUES (39,'22225',3,12,1);
INSERT INTO detalle_pedido VALUES (39,'30310',6,12,2);
INSERT INTO detalle_pedido VALUES (40,'AR-001',4,1,1);
INSERT INTO detalle_pedido VALUES (40,'AR-002',8,1,2);
INSERT INTO detalle_pedido VALUES (41,'AR-003',5,1,1);
INSERT INTO detalle_pedido VALUES (41,'AR-004',5,1,2);
INSERT INTO detalle_pedido VALUES (42,'AR-005',3,1,1);
INSERT INTO detalle_pedido VALUES (42,'AR-006',1,1,2);
INSERT INTO detalle_pedido VALUES (43,'AR-007',9,1,1);
INSERT INTO detalle_pedido VALUES (44,'AR-008',5,1,1);
INSERT INTO detalle_pedido VALUES (45,'AR-009',6,1,1);
INSERT INTO detalle_pedido VALUES (45,'AR-010',4,1,2);
INSERT INTO detalle_pedido VALUES (46,'FR-1',4,7,1);
INSERT INTO detalle_pedido VALUES (46,'FR-10',8,7,2);
INSERT INTO detalle_pedido VALUES (47,'FR-100',9,11,1);
INSERT INTO detalle_pedido VALUES (47,'FR-101',5,13,2);
INSERT INTO detalle_pedido VALUES (48,'FR-102',1,18,1);
INSERT INTO detalle_pedido VALUES (48,'FR-103',1,25,2);
INSERT INTO detalle_pedido VALUES (48,'OR-234',50,64,1);
INSERT INTO detalle_pedido VALUES (48,'OR-236',45,49,2);
INSERT INTO detalle_pedido VALUES (48,'OR-237',50,19,3);
INSERT INTO detalle_pedido VALUES (49,'OR-204',50,10,1);
INSERT INTO detalle_pedido VALUES (49,'OR-205',10,10,2);
INSERT INTO detalle_pedido VALUES (49,'OR-206',5,5,3);
INSERT INTO detalle_pedido VALUES (50,'OR-225',12,10,1);
INSERT INTO detalle_pedido VALUES (50,'OR-226',15,38,2);
INSERT INTO detalle_pedido VALUES (50,'OR-227',44,64,3);
INSERT INTO detalle_pedido VALUES (51,'OR-209',50,10,1);
INSERT INTO detalle_pedido VALUES (51,'OR-210',80,39,2);
INSERT INTO detalle_pedido VALUES (51,'OR-211',70,59,3);
INSERT INTO detalle_pedido VALUES (53,'FR-2',1,7,1);
INSERT INTO detalle_pedido VALUES (53,'FR-85',1,70,3);
INSERT INTO detalle_pedido VALUES (53,'FR-86',2,11,2);
INSERT INTO detalle_pedido VALUES (53,'OR-116',6,7,4);
INSERT INTO detalle_pedido VALUES (54,'11679',3,14,3);
INSERT INTO detalle_pedido VALUES (54,'FR-100',45,10,2);
INSERT INTO detalle_pedido VALUES (54,'FR-18',5,4,1);
INSERT INTO detalle_pedido VALUES (54,'FR-79',3,22,4);
INSERT INTO detalle_pedido VALUES (54,'OR-116',8,7,6);
INSERT INTO detalle_pedido VALUES (54,'OR-123',3,5,5);
INSERT INTO detalle_pedido VALUES (54,'OR-168',2,10,7);
INSERT INTO detalle_pedido VALUES (55,'OR-115',9,7,1);
INSERT INTO detalle_pedido VALUES (55,'OR-213',2,266,2);
INSERT INTO detalle_pedido VALUES (55,'OR-227',6,64,5);
INSERT INTO detalle_pedido VALUES (55,'OR-243',2,64,4);
INSERT INTO detalle_pedido VALUES (55,'OR-247',1,462,3);
INSERT INTO detalle_pedido VALUES (56,'OR-129',1,115,5);
INSERT INTO detalle_pedido VALUES (56,'OR-130',10,18,6);
INSERT INTO detalle_pedido VALUES (56,'OR-179',1,6,3);
INSERT INTO detalle_pedido VALUES (56,'OR-196',3,10,4);
INSERT INTO detalle_pedido VALUES (56,'OR-207',4,4,2);
INSERT INTO detalle_pedido VALUES (56,'OR-250',3,10,1);
INSERT INTO detalle_pedido VALUES (57,'FR-69',6,91,4);
INSERT INTO detalle_pedido VALUES (57,'FR-81',3,49,3);
INSERT INTO detalle_pedido VALUES (57,'FR-84',2,13,1);
INSERT INTO detalle_pedido VALUES (57,'FR-94',6,9,2);
INSERT INTO detalle_pedido VALUES (58,'OR-102',65,18,3);
INSERT INTO detalle_pedido VALUES (58,'OR-139',80,4,1);
INSERT INTO detalle_pedido VALUES (58,'OR-172',69,15,2);
INSERT INTO detalle_pedido VALUES (58,'OR-177',150,15,4);
INSERT INTO detalle_pedido VALUES (74,'FR-67',15,70,1);
INSERT INTO detalle_pedido VALUES (74,'OR-227',34,64,2);
INSERT INTO detalle_pedido VALUES (74,'OR-247',42,8,3);
INSERT INTO detalle_pedido VALUES (75,'AR-006',60,1,2);
INSERT INTO detalle_pedido VALUES (75,'FR-87',24,22,3);
INSERT INTO detalle_pedido VALUES (75,'OR-157',46,10,1);
INSERT INTO detalle_pedido VALUES (76,'AR-009',250,1,5);
INSERT INTO detalle_pedido VALUES (76,'FR-79',40,22,3);
INSERT INTO detalle_pedido VALUES (76,'FR-87',24,22,4);
INSERT INTO detalle_pedido VALUES (76,'FR-94',35,9,1);
INSERT INTO detalle_pedido VALUES (76,'OR-196',25,10,2);
INSERT INTO detalle_pedido VALUES (77,'22225',34,12,2);
INSERT INTO detalle_pedido VALUES (77,'30310',15,12,1);
INSERT INTO detalle_pedido VALUES (78,'FR-53',25,8,2);
INSERT INTO detalle_pedido VALUES (78,'FR-85',56,70,3);
INSERT INTO detalle_pedido VALUES (78,'OR-157',42,10,4);
INSERT INTO detalle_pedido VALUES (78,'OR-208',30,4,1);
INSERT INTO detalle_pedido VALUES (79,'OR-240',50,6,1);
INSERT INTO detalle_pedido VALUES (80,'FR-11',40,100,3);
INSERT INTO detalle_pedido VALUES (80,'FR-36',47,9,2);
INSERT INTO detalle_pedido VALUES (80,'OR-136',75,18,1);
INSERT INTO detalle_pedido VALUES (81,'OR-208',30,4,1);
INSERT INTO detalle_pedido VALUES (82,'OR-227',34,64,1);
INSERT INTO detalle_pedido VALUES (83,'OR-208',30,4,1);
INSERT INTO detalle_pedido VALUES (89,'FR-108',3,32,2);
INSERT INTO detalle_pedido VALUES (89,'FR-3',15,7,6);
INSERT INTO detalle_pedido VALUES (89,'FR-42',12,8,4);
INSERT INTO detalle_pedido VALUES (89,'FR-66',5,49,1);
INSERT INTO detalle_pedido VALUES (89,'FR-87',4,22,3);
INSERT INTO detalle_pedido VALUES (89,'OR-157',8,10,5);
INSERT INTO detalle_pedido VALUES (90,'AR-001',19,1,1);
INSERT INTO detalle_pedido VALUES (90,'AR-002',10,1,2);
INSERT INTO detalle_pedido VALUES (90,'AR-003',12,1,3);
INSERT INTO detalle_pedido VALUES (91,'FR-100',52,11,1);
INSERT INTO detalle_pedido VALUES (91,'FR-101',14,13,2);
INSERT INTO detalle_pedido VALUES (91,'FR-102',35,18,3);
INSERT INTO detalle_pedido VALUES (92,'FR-108',12,23,1);
INSERT INTO detalle_pedido VALUES (92,'FR-11',20,100,2);
INSERT INTO detalle_pedido VALUES (92,'FR-12',30,21,3);
INSERT INTO detalle_pedido VALUES (93,'FR-54',25,9,1);
INSERT INTO detalle_pedido VALUES (93,'FR-58',51,11,2);
INSERT INTO detalle_pedido VALUES (93,'FR-60',3,32,3);
INSERT INTO detalle_pedido VALUES (94,'11679',12,14,1);
INSERT INTO detalle_pedido VALUES (94,'FR-11',33,100,3);
INSERT INTO detalle_pedido VALUES (94,'FR-4',79,29,2);
INSERT INTO detalle_pedido VALUES (95,'FR-10',9,7,2);
INSERT INTO detalle_pedido VALUES (95,'FR-75',6,32,1);
INSERT INTO detalle_pedido VALUES (95,'FR-82',5,70,3);
INSERT INTO detalle_pedido VALUES (96,'FR-43',6,8,1);
INSERT INTO detalle_pedido VALUES (96,'FR-6',16,7,4);
INSERT INTO detalle_pedido VALUES (96,'FR-71',10,22,3);
INSERT INTO detalle_pedido VALUES (96,'FR-90',4,70,2);
INSERT INTO detalle_pedido VALUES (97,'FR-41',12,8,1);
INSERT INTO detalle_pedido VALUES (97,'FR-54',14,9,2);
INSERT INTO detalle_pedido VALUES (97,'OR-156',10,10,3);
INSERT INTO detalle_pedido VALUES (98,'FR-33',14,8,4);
INSERT INTO detalle_pedido VALUES (98,'FR-56',16,8,3);
INSERT INTO detalle_pedido VALUES (98,'FR-60',8,32,1);
INSERT INTO detalle_pedido VALUES (98,'FR-8',18,6,5);
INSERT INTO detalle_pedido VALUES (98,'FR-85',6,70,2);
INSERT INTO detalle_pedido VALUES (99,'OR-157',15,10,2);
INSERT INTO detalle_pedido VALUES (99,'OR-227',30,64,1);
INSERT INTO detalle_pedido VALUES (100,'FR-87',20,22,1);
INSERT INTO detalle_pedido VALUES (100,'FR-94',40,9,2);
INSERT INTO detalle_pedido VALUES (101,'AR-006',50,1,1);
INSERT INTO detalle_pedido VALUES (101,'AR-009',159,1,2);
INSERT INTO detalle_pedido VALUES (102,'22225',32,12,2);
INSERT INTO detalle_pedido VALUES (102,'30310',23,12,1);
INSERT INTO detalle_pedido VALUES (103,'FR-53',12,8,2);
INSERT INTO detalle_pedido VALUES (103,'OR-208',52,4,1);
INSERT INTO detalle_pedido VALUES (104,'FR-85',9,70,1);
INSERT INTO detalle_pedido VALUES (104,'OR-157',113,10,2);
INSERT INTO detalle_pedido VALUES (105,'OR-227',21,64,2);
INSERT INTO detalle_pedido VALUES (105,'OR-240',27,6,1);
INSERT INTO detalle_pedido VALUES (106,'AR-009',231,1,1);
INSERT INTO detalle_pedido VALUES (106,'OR-136',47,18,2);
INSERT INTO detalle_pedido VALUES (107,'30310',143,12,2);
INSERT INTO detalle_pedido VALUES (107,'FR-11',15,100,1);
INSERT INTO detalle_pedido VALUES (108,'FR-53',53,8,1);
INSERT INTO detalle_pedido VALUES (108,'OR-208',59,4,2);
INSERT INTO detalle_pedido VALUES (109,'FR-22',8,4,5);
INSERT INTO detalle_pedido VALUES (109,'FR-36',12,9,3);
INSERT INTO detalle_pedido VALUES (109,'FR-45',14,8,4);
INSERT INTO detalle_pedido VALUES (109,'OR-104',20,10,1);
INSERT INTO detalle_pedido VALUES (109,'OR-119',10,5,2);
INSERT INTO detalle_pedido VALUES (109,'OR-125',3,5,6);
INSERT INTO detalle_pedido VALUES (109,'OR-130',2,18,7);
INSERT INTO detalle_pedido VALUES (110,'AR-010',6,1,3);
INSERT INTO detalle_pedido VALUES (110,'FR-1',14,7,1);
INSERT INTO detalle_pedido VALUES (110,'FR-16',1,45,2);
INSERT INTO detalle_pedido VALUES (116,'21636',5,14,1);
INSERT INTO detalle_pedido VALUES (116,'AR-001',32,1,2);
INSERT INTO detalle_pedido VALUES (116,'AR-005',18,1,5);
INSERT INTO detalle_pedido VALUES (116,'FR-33',13,8,3);
INSERT INTO detalle_pedido VALUES (116,'OR-200',10,4,4);
INSERT INTO detalle_pedido VALUES (117,'FR-78',2,15,1);
INSERT INTO detalle_pedido VALUES (117,'FR-80',1,32,3);
INSERT INTO detalle_pedido VALUES (117,'OR-146',17,4,2);
INSERT INTO detalle_pedido VALUES (117,'OR-179',4,6,4);
INSERT INTO detalle_pedido VALUES (128,'AR-004',15,1,1);
INSERT INTO detalle_pedido VALUES (128,'OR-150',18,2,2);
INSERT INTO detalle_pedido VALUES (52,'FR-67',10,70,1);
INSERT INTO detalle_pedido VALUES (59,'FR-67',10,70,1);
INSERT INTO detalle_pedido VALUES (60,'FR-67',10,70,1);
INSERT INTO detalle_pedido VALUES (61,'FR-67',10,70,1);
INSERT INTO detalle_pedido VALUES (62,'FR-67',10,70,1);
INSERT INTO detalle_pedido VALUES (63,'FR-67',10,70,1);
INSERT INTO detalle_pedido VALUES (64,'FR-67',10,70,1);
INSERT INTO detalle_pedido VALUES (65,'FR-67',10,70,1);
INSERT INTO detalle_pedido VALUES (66,'FR-67',10,70,1);
INSERT INTO detalle_pedido VALUES (67,'FR-67',10,70,1);
INSERT INTO detalle_pedido VALUES (68,'FR-67',10,70,1);
INSERT INTO detalle_pedido VALUES (111,'FR-67',10,70,1);
INSERT INTO detalle_pedido VALUES (112,'FR-67',10,70,1);
INSERT INTO detalle_pedido VALUES (113,'FR-67',10,70,1);
INSERT INTO detalle_pedido VALUES (114,'FR-67',10,70,1);
INSERT INTO detalle_pedido VALUES (115,'FR-67',10,70,1);
INSERT INTO detalle_pedido VALUES (118,'FR-67',10,70,1);
INSERT INTO detalle_pedido VALUES (119,'FR-67',10,70,1);
INSERT INTO detalle_pedido VALUES (120,'FR-67',10,70,1);
INSERT INTO detalle_pedido VALUES (121,'FR-67',10,70,1);
INSERT INTO detalle_pedido VALUES (122,'FR-67',10,70,1);
INSERT INTO detalle_pedido VALUES (123,'FR-67',10,70,1);
INSERT INTO detalle_pedido VALUES (124,'FR-67',10,70,1);
INSERT INTO detalle_pedido VALUES (125,'FR-67',10,70,1);
INSERT INTO detalle_pedido VALUES (126,'FR-67',10,70,1);
INSERT INTO detalle_pedido VALUES (127,'FR-67',10,70,1);
-- codigo_pedido,codigo_producto,cantidad,precio_unidad,numero_linea
-- pedido_id, producto_id, cantidad, numero_linea