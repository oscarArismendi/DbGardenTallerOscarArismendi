# DbGardenTallerOscarArismendi

## Consultas sobre una tabla

1. Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.

   ```
   SELECT DISTINCT
    o.id AS oficina_id,
    c.nombre AS ciudad
   FROM
    oficina AS o
   INNER JOIN
    direccion_oficina do ON o.id = do.oficina_id
   INNER JOIN
    ciudad AS c ON c.id = do.ciudad_id;
   +------------+----------------------+
   | oficina_id | ciudad               |
   +------------+----------------------+
   |          1 | Barcelona            |
   |          2 | Boston               |
   |          3 | Londres              |
   |          4 | Madrid               |
   |          5 | Paris                |
   |          6 | San Francisco        |
   |          7 | Sydney               |
   |          8 | Talavera de la Reina |
   |          9 | Tokyo                |
   +------------+----------------------+
   ```
2. Devuelve un listado con la ciudad y el teléfono de las oficinas de España.
3. Devuelve un listado con el nombre, apellidos y email de los empleados cuyo jefe tiene un código de jefe igual a 7.
4. Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa.
5. Devuelve un listado con el nombre, apellidos y puesto de aquellos empleados que no sean representantes de ventas.
6. Devuelve un listado con el nombre de los todos los clientes españoles.
7. Devuelve un listado con los distintos estados por los que puede pasar un pedido.
8. Devuelve un listado con el código de cliente de aquellos clientes que realizaron algún pago en 2008. Tenga en cuenta que deberá eliminar aquellos códigos de cliente que aparezcan repetidos. Resuelva la consulta: • Utilizando la función YEAR de MySQL. • Utilizando la función DATE_FORMAT de MySQL. • Sin utilizar ninguna de las funciones anteriores.
9. Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos que no han sido entregados a tiempo.
10. Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al menos dos días antes de la fecha esperada. • Utilizando la función ADDDATE de MySQL. • Utilizando la función DATEDIFF de MySQL. • ¿Sería posible resolver esta consulta utilizando el operador de suma + o resta -?
11. Devuelve un listado de todos los pedidos que fueron rechazados en 2009.
12. Devuelve un listado de todos los pedidos que han sido entregados en el mes de enero de cualquier año.
13. Devuelve un listado con todos los pagos que se realizaron en el año 2008 mediante Paypal. Ordene el resultado de mayor a menor.
14. Devuelve un listado con todas las formas de pago que aparecen en la tabla pago. Tenga en cuenta que no deben aparecer formas de pago repetidas.
15. Devuelve un listado con todos los productos que pertenecen a la gama Ornamentales y que tienen más de 100 unidades en stock. El listado deberá estar ordenado por su precio de venta, mostrando en primer lugar los de mayor precio.
16. Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y cuyo representante de ventas tenga el código de empleado 11 o 30.

    ## Consultas multitabla (Composición interna)

    **Resuelva todas las consultas utilizando la sintaxis de SQL1 y SQL2. Las consultas con** **sintaxis de SQL2 se deben resolver con INNER JOIN y NATURAL JOIN.**
17. Obtén un listado con el nombre de cada cliente y el nombre y apellido de su representante de ventas.

    ```
    SELECT
    	c.nombre AS nombre_cliente,
    	e.nombre AS nombre_empleado,
    	e.apellido1 AS apellido1_empleado,
    	e.apellido2 AS apellido2_empleado
    FROM
    	cliente c
    INNER JOIN
    	empleado e ON c.empleado_id = e.id WHERE e.puesto_id = 5;
    +--------------------------------+-----------------+--------------------+--------------------+
    | nombre_cliente                 | nombre_empleado | apellido1_empleado | apellido2_empleado |
    +--------------------------------+-----------------+--------------------+--------------------+
    | Flores Marivi                  | Felipe          | Rosas              | Marquez            |
    | Flowers, S.A                   | Felipe          | Rosas              | Marquez            |
    | Fuenla City                    | Felipe          | Rosas              | Marquez            |
    | Top Campo                      | Felipe          | Rosas              | Marquez            |
    | Jardineria Sara                | Felipe          | Rosas              | Marquez            |
    | Lasas S.A.                     | Mariano         | López              | Murcia             |
    | Lasas S.A.                     | Mariano         | López              | Murcia             |
    | Camunas Jardines S.L.          | Mariano         | López              | Murcia             |
    | Dardena S.A.                   | Mariano         | López              | Murcia             |
    | Jardines y Mansiones Cactus SL | Lucio           | Campoamor          | Martín             |
    | Jardinerías Matías SL          | Lucio           | Campoamor          | Martín             |
    | Golf S.A.                      | José Manuel     | Martinez           | De la Osa          |
    | Americh Golf Management SL     | José Manuel     | Martinez           | De la Osa          |
    | Aloha                          | José Manuel     | Martinez           | De la Osa          |
    | El Prat                        | José Manuel     | Martinez           | De la Osa          |
    | Sotogrande                     | José Manuel     | Martinez           | De la Osa          |
    | france telecom                 | Lionel          | Narvaez            |                    |
    | Musée du Louvre                | Lionel          | Narvaez            |                    |
    | GoldFish Garden                | Walter Santiago | Sanchez            | Lopez              |
    | Gardening Competitor           | Walter Santiago | Sanchez            | Lopez              |
    | Gardening Associates           | Walter Santiago | Sanchez            | Lopez              |
    | Gerudo Valley                  | Lorena          | Paxton             |                    |
    | Tendo Garden                   | Lorena          | Paxton             |                    |
    | Jardin de Flores               | Julian          | Bellinelli         |                    |
    | Naturajardin                   | Julian          | Bellinelli         |                    |
    | Vivero Humanes                 | Julian          | Bellinelli         |                    |
    | Agrojardin                     | Julian          | Bellinelli         |                    |
    | Campohermoso                   | Julian          | Bellinelli         |                    |
    | Tutifruti S.A                  | Mariko          | Kishi              |                    |
    | El Jardin Viviente S.L         | Mariko          | Kishi              |                    |
    +--------------------------------+-----------------+--------------------+--------------------+
    ```
18. Muestra el nombre de los clientes que hayan realizado pagos junto con el nombre de sus representantes de ventas.

    ```mysql
    SELECT cliente.nombre, empleado.nombre AS nombreEmpleado, empleado.apellido1 AS primerApellidoEmpleado, empleado.apellido2 AS segundoApellidoEmpleado 
    FROM cliente 
    INNER JOIN empleado ON cliente.empleado_id = empleado.id
    INNER JOIN pago ON cliente.id = pago.cliente_id;
    +--------------------------------+-----------------+------------------------+-------------------------+
    | nombre                         | nombreEmpleado  | primerApellidoEmpleado | segundoApellidoEmpleado |
    +--------------------------------+-----------------+------------------------+-------------------------+
    | GoldFish Garden                | Walter Santiago | Sanchez                | Lopez                   |
    | GoldFish Garden                | Walter Santiago | Sanchez                | Lopez                   |
    | Gardening Associates           | Walter Santiago | Sanchez                | Lopez                   |
    | Gardening Associates           | Walter Santiago | Sanchez                | Lopez                   |
    | Gardening Associates           | Walter Santiago | Sanchez                | Lopez                   |
    | Gerudo Valley                  | Lorena          | Paxton                 |                         |
    | Gerudo Valley                  | Lorena          | Paxton                 |                         |
    | Gerudo Valley                  | Lorena          | Paxton                 |                         |
    | Gerudo Valley                  | Lorena          | Paxton                 |                         |
    | Gerudo Valley                  | Lorena          | Paxton                 |                         |
    | Tendo Garden                   | Lorena          | Paxton                 |                         |
    | Beragua                        | Emmanuel        | Magaña                 | Perez                   |
    | Naturagua                      | Emmanuel        | Magaña                 | Perez                   |
    | Camunas Jardines S.L.          | Mariano         | López                  | Murcia                  |
    | Dardena S.A.                   | Mariano         | López                  | Murcia                  |
    | Jardin de Flores               | Julian          | Bellinelli             |                         |
    | Jardin de Flores               | Julian          | Bellinelli             |                         |
    | Flores Marivi                  | Felipe          | Rosas                  | Marquez                 |
    | Golf S.A.                      | José Manuel     | Martinez               | De la Osa               |
    | Sotogrande                     | José Manuel     | Martinez               | De la Osa               |
    | Jardines y Mansiones Cactus SL | Lucio           | Campoamor              | Martín                  |
    | Jardinerías Matías SL          | Lucio           | Campoamor              | Martín                  |
    | Agrojardin                     | Julian          | Bellinelli             |                         |
    | Jardineria Sara                | Felipe          | Rosas                  | Marquez                 |
    | Tutifruti S.A                  | Mariko          | Kishi                  |                         |
    | El Jardin Viviente S.L         | Mariko          | Kishi                  |                         |
    +--------------------------------+-----------------+------------------------+-------------------------+
    ```
19. Muestra el nombre de los clientes que no hayan realizado pagos junto con el nombre de sus representantes de ventas.

    ```mysql

    ```
20. Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.

    ```mysql
    SELECT cl.nombre as nombre_cliente  , em.nombre as nombre_empleado, em.apellido1 as apellido1_empleado ,
    em.apellido2 as apellido2_empleado, ci.nombre as ciudad_oficina, p.id as pago_id
      FROM pago p
    INNER JOIN 
            cliente cl ON p.cliente_id = cl.id
    INNER JOIN 
            empleado em ON cl.empleado_id  = em.id
    INNER JOIN 
            oficina  o ON em.oficina_id = o.id
    INNER JOIN
           direccion_oficina do ON do.oficina_id = o.id
    INNER JOIN
           ciudad ci ON ci.id = do.ciudad_id ;
    +--------------------------------+-----------------+--------------------+--------------------+----------------------+---------+
    | nombre_cliente                 | nombre_empleado | apellido1_empleado | apellido2_empleado | ciudad_oficina       | pago_id |
    +--------------------------------+-----------------+--------------------+--------------------+----------------------+---------+
    | Beragua                        | Emmanuel        | Magaña             | Perez              | Barcelona            |      12 |
    | Naturagua                      | Emmanuel        | Magaña             | Perez              | Barcelona            |      13 |
    | Golf S.A.                      | José Manuel     | Martinez           | De la Osa          | Barcelona            |      19 |
    | Sotogrande                     | José Manuel     | Martinez           | De la Osa          | Barcelona            |      20 |
    | Gerudo Valley                  | Lorena          | Paxton             |                    | Boston               |       6 |
    | Gerudo Valley                  | Lorena          | Paxton             |                    | Boston               |       7 |
    | Gerudo Valley                  | Lorena          | Paxton             |                    | Boston               |       8 |
    | Gerudo Valley                  | Lorena          | Paxton             |                    | Boston               |       9 |
    | Gerudo Valley                  | Lorena          | Paxton             |                    | Boston               |      10 |
    | Tendo Garden                   | Lorena          | Paxton             |                    | Boston               |      11 |
    | Camunas Jardines S.L.          | Mariano         | López              | Murcia             | Madrid               |      14 |
    | Dardena S.A.                   | Mariano         | López              | Murcia             | Madrid               |      15 |
    | Jardines y Mansiones Cactus SL | Lucio           | Campoamor          | Martín             | Madrid               |      21 |
    | Jardinerías Matías SL          | Lucio           | Campoamor          | Martín             | Madrid               |      22 |
    | GoldFish Garden                | Walter Santiago | Sanchez            | Lopez              | San Francisco        |       1 |
    | GoldFish Garden                | Walter Santiago | Sanchez            | Lopez              | San Francisco        |       2 |
    | Gardening Associates           | Walter Santiago | Sanchez            | Lopez              | San Francisco        |       3 |
    | Gardening Associates           | Walter Santiago | Sanchez            | Lopez              | San Francisco        |       4 |
    | Gardening Associates           | Walter Santiago | Sanchez            | Lopez              | San Francisco        |       5 |
    | Jardin de Flores               | Julian          | Bellinelli         |                    | Sydney               |      16 |
    | Jardin de Flores               | Julian          | Bellinelli         |                    | Sydney               |      17 |
    | Agrojardin                     | Julian          | Bellinelli         |                    | Sydney               |      23 |
    | Tutifruti S.A                  | Mariko          | Kishi              |                    | Sydney               |      25 |
    | El Jardin Viviente S.L         | Mariko          | Kishi              |                    | Sydney               |      26 |
    | Flores Marivi                  | Felipe          | Rosas              | Marquez            | Talavera de la Reina |      18 |
    | Jardineria Sara                | Felipe          | Rosas              | Marquez            | Talavera de la Reina |      24 |
    +--------------------------------+-----------------+--------------------+--------------------+----------------------+---------+
    26 rows in set (0,00 sec)

    ```
21. Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.

    ```mysql
    SELECT cl.nombre as nombre_cliente  , em.nombre as nombre_empleado, em.apellido1 as apellido1_empleado ,
    em.apellido2 as apellido2_empleado, ci.nombre as ciudad_oficina, p.id as pago_id
      FROM pago p
    RIGHT JOIN 
            cliente cl ON p.cliente_id = cl.id 
    INNER JOIN 
            empleado em ON cl.empleado_id  = em.id
    INNER JOIN 
            oficina o ON em.oficina_id = o.id
    INNER JOIN
           direccion_oficina dof ON dof.oficina_id = o.id
    INNER JOIN
           ciudad ci ON ci.id = dof.ciudad_id 
    WHERE p.id IS NULL;
    +-----------------------------+-----------------+--------------------+--------------------+----------------------+---------+
    | nombre_cliente              | nombre_empleado | apellido1_empleado | apellido2_empleado | ciudad_oficina       | pago_id |
    +-----------------------------+-----------------+--------------------+--------------------+----------------------+---------+
    | Club Golf Puerta del hierro | Emmanuel        | Magaña             | Perez              | Barcelona            |    NULL |
    | DaraDistribuciones          | Emmanuel        | Magaña             | Perez              | Barcelona            |    NULL |
    | Madrileña de riegos         | Emmanuel        | Magaña             | Perez              | Barcelona            |    NULL |
    | Americh Golf Management SL  | José Manuel     | Martinez           | De la Osa          | Barcelona            |    NULL |
    | Aloha                       | José Manuel     | Martinez           | De la Osa          | Barcelona            |    NULL |
    | El Prat                     | José Manuel     | Martinez           | De la Osa          | Barcelona            |    NULL |
    | Lasas S.A.                  | Mariano         | López              | Murcia             | Madrid               |    NULL |
    | Lasas S.A.                  | Mariano         | López              | Murcia             | Madrid               |    NULL |
    | france telecom              | Lionel          | Narvaez            |                    | Paris                |    NULL |
    | Musée du Louvre             | Lionel          | Narvaez            |                    | Paris                |    NULL |
    | Flores S.L.                 | Michael         | Bolton             |                    | San Francisco        |    NULL |
    | The Magic Garden            | Michael         | Bolton             |                    | San Francisco        |    NULL |
    | Gardening Competitor        | Walter Santiago | Sanchez            | Lopez              | San Francisco        |    NULL |
    | Naturajardin                | Julian          | Bellinelli         |                    | Sydney               |    NULL |
    | Vivero Humanes              | Julian          | Bellinelli         |                    | Sydney               |    NULL |
    | Campohermoso                | Julian          | Bellinelli         |                    | Sydney               |    NULL |
    | Flowers, S.A                | Felipe          | Rosas              | Marquez            | Talavera de la Reina |    NULL |
    | Fuenla City                 | Felipe          | Rosas              | Marquez            | Talavera de la Reina |    NULL |
    | Top Campo                   | Felipe          | Rosas              | Marquez            | Talavera de la Reina |    NULL |
    +-----------------------------+-----------------+--------------------+--------------------+----------------------+---------+
    19 rows in set (0,00 sec)


    ```
22. Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.

```mysql
SELECT cl.nombre as nombre_cliente  , em.nombre as nombre_empleado, em.apellido1 as apellido1_empleado ,
em.apellido2 as apellido2_empleado, ci.nombre as ciudad_oficina, p.id as pago_id
  FROM pago p
INNER JOIN 
        cliente cl ON p.cliente_id = cl.id 
INNER JOIN 
        empleado em ON cl.empleado_id  = em.id
INNER JOIN 
        oficina o ON em.oficina_id = o.id
INNER JOIN
       direccion_oficina dof ON dof.oficina_id = o.id
INNER JOIN
       ciudad ci ON ci.id = dof.ciudad_id 
WHERE ci.nombre = "Fuenlabrada" AND p.id IS NULL;
Empty set (0,00 sec)

-- No retorna ningun dato porque la ciudad Fuenlabrada no esta en la base de datos
```

1. Devuelve el nombre de los clientes y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.

   ```
   SELECT
   	cl.nombre AS nombre_cliente,
   	em.nombre AS nombre_empleado,
   	ci.nombre AS ciudad_oficina
   FROM
   	cliente cl
   INNER JOIN
   	empleado em ON cl.empleado_id = em.id
   INNER JOIN
   	oficina o ON em.oficina_id = o.id
   INNER JOIN
   	direccion_oficina dof ON dof.oficina_id = o.id
   INNER JOIN
   	ciudad ci ON dof.ciudad_id = ci.id;

   +--------------------------------+-----------------+----------------------+
   | nombre_cliente                 | nombre_empleado | ciudad_oficina       |
   +--------------------------------+-----------------+----------------------+
   | Beragua                        | Emmanuel        | Barcelona            |
   | Club Golf Puerta del hierro    | Emmanuel        | Barcelona            |
   | Naturagua                      | Emmanuel        | Barcelona            |
   | DaraDistribuciones             | Emmanuel        | Barcelona            |
   | Madrileña de riegos            | Emmanuel        | Barcelona            |
   | Golf S.A.                      | José Manuel     | Barcelona            |
   | Americh Golf Management SL     | José Manuel     | Barcelona            |
   | Aloha                          | José Manuel     | Barcelona            |
   | El Prat                        | José Manuel     | Barcelona            |
   | Sotogrande                     | José Manuel     | Barcelona            |
   | Gerudo Valley                  | Lorena          | Boston               |
   | Tendo Garden                   | Lorena          | Boston               |
   | Lasas S.A.                     | Mariano         | Madrid               |
   | Lasas S.A.                     | Mariano         | Madrid               |
   | Camunas Jardines S.L.          | Mariano         | Madrid               |
   | Dardena S.A.                   | Mariano         | Madrid               |
   | Jardines y Mansiones Cactus SL | Lucio           | Madrid               |
   | Jardinerías Matías SL          | Lucio           | Madrid               |
   | france telecom                 | Lionel          | Paris                |
   | Musée du Louvre                | Lionel          | Paris                |
   | Flores S.L.                    | Michael         | San Francisco        |
   | The Magic Garden               | Michael         | San Francisco        |
   | GoldFish Garden                | Walter Santiago | San Francisco        |
   | Gardening Competitor           | Walter Santiago | San Francisco        |
   | Gardening Associates           | Walter Santiago | San Francisco        |
   | Jardin de Flores               | Julian          | Sydney               |
   | Naturajardin                   | Julian          | Sydney               |
   | Vivero Humanes                 | Julian          | Sydney               |
   | Agrojardin                     | Julian          | Sydney               |
   | Campohermoso                   | Julian          | Sydney               |
   | Tutifruti S.A                  | Mariko          | Sydney               |
   | El Jardin Viviente S.L         | Mariko          | Sydney               |
   | Flores Marivi                  | Felipe          | Talavera de la Reina |
   | Flowers, S.A                   | Felipe          | Talavera de la Reina |
   | Fuenla City                    | Felipe          | Talavera de la Reina |
   | Top Campo                      | Felipe          | Talavera de la Reina |
   | Jardineria Sara                | Felipe          | Talavera de la Reina |
   +--------------------------------+-----------------+----------------------+
   37 rows in set (0,00 sec)

   ```
2. Devuelve un listado con el nombre de los empleados junto con el nombre de sus jefes.

   ```mysql
   SELECT
   	em.nombre AS nombre_empleado,
   	jf.nombre AS nombre_jefe
   FROM
   	empleado em
   INNER JOIN
   	empleado jf ON em.jefe_id = jf.id;
   +-----------------+-------------+
   | nombre_empleado | nombre_jefe |
   +-----------------+-------------+
   | Ruben           | Marcos      |
   | Alberto         | Ruben       |
   | Maria           | Ruben       |
   | Felipe          | Alberto     |
   | Juan Carlos     | Alberto     |
   | Carlos          | Alberto     |
   | Mariano         | Carlos      |
   | Lucio           | Carlos      |
   | Hilario         | Carlos      |
   | Emmanuel        | Alberto     |
   | José Manuel     | Emmanuel    |
   | David           | Emmanuel    |
   | Oscar           | Emmanuel    |
   | Francois        | Alberto     |
   | Lionel          | Francois    |
   | Laurent         | Francois    |
   | Michael         | Alberto     |
   | Walter Santiago | Michael     |
   | Hilary          | Alberto     |
   | Marcus          | Hilary      |
   | Lorena          | Hilary      |
   | Nei             | Alberto     |
   | Narumi          | Nei         |
   | Takuma          | Nei         |
   | Amy             | Alberto     |
   | Larry           | Amy         |
   | John            | Amy         |
   | Kevin           | Alberto     |
   | Julian          | Kevin       |
   | Mariko          | Kevin       |
   +-----------------+-------------+
   30 rows in set (0.00 sec)
   ```
3. Devuelve un listado que muestre el nombre de cada empleados, el nombre de su jefe y el nombre del jefe de sus jefe.

   ```mysql
   SELECT
   	em.nombre AS nombre_empleado,
   	jf.nombre AS nombre_jefe,
   	jfdeljf.nombre AS nombre_del_jefe_de_su_jefe
   FROM
   	empleado em
   LEFT JOIN
   	empleado jf ON em.jefe_id = jf.id
   LEFT JOIN
   	empleado jfdeljf ON  jf.jefe_id = jfdeljf.id;
   +-----------------+-------------+----------------------------+
   | nombre_empleado | nombre_jefe | nombre_del_jefe_de_su_jefe |
   +-----------------+-------------+----------------------------+
   | Marcos          | NULL        | NULL                       |
   | Ruben           | Marcos      | NULL                       |
   | Alberto         | Ruben       | Marcos                     |
   | Maria           | Ruben       | Marcos                     |
   | Felipe          | Alberto     | Ruben                      |
   | Juan Carlos     | Alberto     | Ruben                      |
   | Carlos          | Alberto     | Ruben                      |
   | Mariano         | Carlos      | Alberto                    |
   | Lucio           | Carlos      | Alberto                    |
   | Hilario         | Carlos      | Alberto                    |
   | Emmanuel        | Alberto     | Ruben                      |
   | José Manuel     | Emmanuel    | Alberto                    |
   | David           | Emmanuel    | Alberto                    |
   | Oscar           | Emmanuel    | Alberto                    |
   | Francois        | Alberto     | Ruben                      |
   | Lionel          | Francois    | Alberto                    |
   | Laurent         | Francois    | Alberto                    |
   | Michael         | Alberto     | Ruben                      |
   | Walter Santiago | Michael     | Alberto                    |
   | Hilary          | Alberto     | Ruben                      |
   | Marcus          | Hilary      | Alberto                    |
   | Lorena          | Hilary      | Alberto                    |
   | Nei             | Alberto     | Ruben                      |
   | Narumi          | Nei         | Alberto                    |
   | Takuma          | Nei         | Alberto                    |
   | Amy             | Alberto     | Ruben                      |
   | Larry           | Amy         | Alberto                    |
   | John            | Amy         | Alberto                    |
   | Kevin           | Alberto     | Ruben                      |
   | Julian          | Kevin       | Alberto                    |
   | Mariko          | Kevin       | Alberto                    |
   +-----------------+-------------+----------------------------+
   31 rows in set (0.00 sec)


   ```
4. Devuelve el nombre de los clientes a los que no se les ha entregado a tiempo un pedido.

   ```mysql
   SELECT
   	*
   FROM
   	pedido p
   WHERE
   	p.fecha_esperada < p.fecha_entrega;
   +-----+--------------+----------------+---------------+------------------+------------+-------------------------------------------------------------------------------------------+
   | id  | fecha_pedido | fecha_esperada | fecha_entrega | estado_pedido_id | cliente_id | comentarios                                                                               |
   +-----+--------------+----------------+---------------+------------------+------------+-------------------------------------------------------------------------------------------+
   |   9 | 2008-12-22   | 2008-12-27     | 2008-12-28    |                1 |          1 | El cliente comprueba la integridad del paquete, todo correcto                             |
   |  13 | 2009-01-12   | 2009-01-14     | 2009-01-15    |                1 |          7 | NULL                                                                                      |
   |  16 | 2009-01-06   | 2009-01-07     | 2009-01-15    |                1 |          7 | NULL                                                                                      |
   |  17 | 2009-01-08   | 2009-01-09     | 2009-01-11    |                1 |          7 | mal estado                                                                                |
   |  18 | 2009-01-05   | 2009-01-06     | 2009-01-07    |                1 |          9 | NULL                                                                                      |
   |  22 | 2009-01-11   | 2009-01-11     | 2009-01-13    |                1 |          1 | NULL                                                                                      |
   |  28 | 2009-02-10   | 2009-02-17     | 2009-02-20    |                1 |          4 | El cliente se queja bastante de la espera asociada al producto                            |
   |  31 | 2008-09-04   | 2008-09-30     | 2008-10-04    |                2 |          5 | El cliente ha rechazado por llegar 5 días tarde                                           |
   |  32 | 2007-01-07   | 2007-01-19     | 2007-01-27    |                1 |          3 | Entrega tardía, el cliente puso reclamación                                               |
   |  38 | 2009-03-05   | 2009-03-06     | 2009-03-07    |                1 |          5 | NULL                                                                                      |
   |  39 | 2009-03-06   | 2009-03-07     | 2009-03-09    |                3 |          5 | NULL                                                                                      |
   |  40 | 2009-03-09   | 2009-03-10     | 2009-03-13    |                2 |          5 | NULL                                                                                      |
   |  42 | 2009-03-22   | 2009-03-23     | 2009-03-27    |                1 |         19 | NULL                                                                                      |
   |  43 | 2009-03-25   | 2009-03-26     | 2009-03-28    |                3 |         23 | NULL                                                                                      |
   |  44 | 2009-03-26   | 2009-03-27     | 2009-03-30    |                3 |         23 | NULL                                                                                      |
   |  45 | 2009-04-01   | 2009-03-04     | 2009-03-07    |                1 |         23 | NULL                                                                                      |
   |  46 | 2009-04-03   | 2009-03-04     | 2009-03-05    |                2 |         23 | NULL                                                                                      |
   |  49 | 2008-07-12   | 2008-07-22     | 2008-07-30    |                1 |         26 | El pedido llegó 1 día tarde, pero no hubo queja por parte de la empresa compradora        |
   |  55 | 2008-12-10   | 2009-01-10     | 2009-01-11    |                1 |         14 | Retrasado 1 dia por problemas de transporte                                               |
   |  60 | 2008-12-22   | 2008-12-27     | 2008-12-28    |                1 |          1 | El cliente comprueba la integridad del paquete, todo correcto                             |
   |  68 | 2009-02-10   | 2009-02-17     | 2009-02-20    |                1 |          3 | El cliente se queja bastante de la espera asociada al producto                            |
   |  92 | 2009-04-19   | 2009-04-30     | 2009-05-03    |                1 |         27 | El pedido se entregó tarde debido a la festividad celebrada en España durante esas fechas |
   |  96 | 2008-03-20   | 2008-04-12     | 2008-04-13    |                1 |         35 | La entrega se retraso un dia                                                              |
   | 103 | 2009-01-15   | 2009-01-20     | 2009-01-24    |                3 |         30 | NULL                                                                                      |
   | 106 | 2009-05-13   | 2009-05-15     | 2009-05-20    |                3 |         30 | NULL                                                                                      |
   | 112 | 2009-03-05   | 2009-04-06     | 2009-05-07    |                3 |         36 | NULL                                                                                      |
   | 113 | 2008-10-28   | 2008-11-09     | 2009-01-09    |                2 |         36 | El producto ha sido rechazado por la tardanza de el envio                                 |
   | 114 | 2009-01-15   | 2009-01-29     | 2009-01-31    |                1 |         36 | El envio llego dos dias más tarde debido al mal tiempo                                    |
   | 115 | 2008-11-29   | 2009-01-26     | 2009-02-27    |                3 |         36 | NULL                                                                                      |
   | 123 | 2009-01-15   | 2009-01-20     | 2009-01-24    |                3 |         30 | NULL                                                                                      |
   | 126 | 2009-05-13   | 2009-05-15     | 2009-05-20    |                3 |         30 | NULL                                                                                      |
   | 128 | 2008-11-10   | 2008-12-10     | 2008-12-29    |                2 |         38 | El pedido ha sido rechazado por el cliente por el retraso en la entrega                   |
   +-----+--------------+----------------+---------------+------------------+------------+-------------------------------------------------------------------------------------------+
   32 rows in set (0.01 sec)
   ```
5. Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente.

   ```mysql
   SELECT 
   	c.id AS id_cliente,
       c.nombre AS nombre_cliente,
       gp.id
   FROM 
       cliente AS c
   INNER JOIN 
       pedido AS p ON c.id = p.cliente_id
   INNER JOIN 
       detalle_pedido AS dp ON p.id = dp.pedido_id
   INNER JOIN 
       producto AS pr ON dp.producto_id = pr.id
   INNER JOIN 
       gama_producto AS gp ON pr.gama_id = gp.id
   GROUP BY 
        c.id,c.nombre, gp.id;
   +------------+--------------------------------+----+
   | id_cliente | nombre_cliente                 | id |
   +------------+--------------------------------+----+
   |          1 | GoldFish Garden                |  1 |
   |          7 | Beragua                        |  1 |
   |          4 | Gerudo Valley                  |  1 |
   |          5 | Tendo Garden                   |  1 |
   |         19 | Golf S.A.                      |  1 |
   |         23 | Sotogrande                     |  1 |
   |         26 | Jardines y Mansiones Cactus SL |  1 |
   |          3 | Gardening Associates           |  1 |
   |         15 | Jardin de Flores               |  1 |
   |         28 | Agrojardin                     |  1 |
   |         35 | Tutifruti S.A                  |  1 |
   |         27 | Jardinerías Matías SL          |  1 |
   |         38 | El Jardin Viviente S.L         |  1 |
   |         36 | Flores S.L.                    |  1 |
   |         16 | Flores Marivi                  |  1 |
   |         30 | Jardineria Sara                |  1 |
   |          1 | GoldFish Garden                |  2 |
   |          7 | Beragua                        |  2 |
   |          4 | Gerudo Valley                  |  2 |
   |          3 | Gardening Associates           |  2 |
   |         19 | Golf S.A.                      |  2 |
   |         26 | Jardines y Mansiones Cactus SL |  2 |
   |         14 | Dardena S.A.                   |  2 |
   |         28 | Agrojardin                     |  2 |
   |         35 | Tutifruti S.A                  |  2 |
   |         30 | Jardineria Sara                |  2 |
   |         16 | Flores Marivi                  |  2 |
   |         38 | El Jardin Viviente S.L         |  2 |
   |         36 | Flores S.L.                    |  2 |
   |          5 | Tendo Garden                   |  2 |
   |          1 | GoldFish Garden                |  3 |
   |          7 | Beragua                        |  3 |
   |          4 | Gerudo Valley                  |  3 |
   |          5 | Tendo Garden                   |  3 |
   |          3 | Gardening Associates           |  3 |
   |         19 | Golf S.A.                      |  3 |
   |         26 | Jardines y Mansiones Cactus SL |  3 |
   |         14 | Dardena S.A.                   |  3 |
   |         15 | Jardin de Flores               |  3 |
   |         28 | Agrojardin                     |  3 |
   |         35 | Tutifruti S.A                  |  3 |
   |         27 | Jardinerías Matías SL          |  3 |
   |         16 | Flores Marivi                  |  3 |
   |         36 | Flores S.L.                    |  3 |
   |         30 | Jardineria Sara                |  3 |
   |          1 | GoldFish Garden                |  4 |
   |          7 | Beragua                        |  4 |
   |          9 | Naturagua                      |  4 |
   |          4 | Gerudo Valley                  |  4 |
   |          3 | Gardening Associates           |  4 |
   |         19 | Golf S.A.                      |  4 |
   |         23 | Sotogrande                     |  4 |
   |         26 | Jardines y Mansiones Cactus SL |  4 |
   |         13 | Camunas Jardines S.L.          |  4 |
   |         15 | Jardin de Flores               |  4 |
   |         27 | Jardinerías Matías SL          |  4 |
   |         35 | Tutifruti S.A                  |  4 |
   |         16 | Flores Marivi                  |  4 |
   |         30 | Jardineria Sara                |  4 |
   |         36 | Flores S.L.                    |  4 |
   |         38 | El Jardin Viviente S.L         |  4 |
   |          1 | GoldFish Garden                |  5 |
   |          9 | Naturagua                      |  5 |
   |          4 | Gerudo Valley                  |  5 |
   |          5 | Tendo Garden                   |  5 |
   |          3 | Gardening Associates           |  5 |
   |         19 | Golf S.A.                      |  5 |
   |         23 | Sotogrande                     |  5 |
   |         26 | Jardines y Mansiones Cactus SL |  5 |
   |         13 | Camunas Jardines S.L.          |  5 |
   |         14 | Dardena S.A.                   |  5 |
   |         15 | Jardin de Flores               |  5 |
   |         28 | Agrojardin                     |  5 |
   |         27 | Jardinerías Matías SL          |  5 |
   |         35 | Tutifruti S.A                  |  5 |
   |         16 | Flores Marivi                  |  5 |
   |         30 | Jardineria Sara                |  5 |
   |         38 | El Jardin Viviente S.L         |  5 |
   +------------+--------------------------------+----+
   78 rows in set (0.01 sec)
   ```

   ## Consultas multitabla (Composición externa)

   **Resuelva todas las consultas utilizando las cláusulas LEFT JOIN, RIGHT JOIN, NATURAL** **LEFT JOIN y NATURAL RIGHT JOIN.**
6. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.

   ```mysql
   SELECT
   	c.id AS cliente_id,
   	c.nombre,
   	p.id AS pago_id
   FROM
   	cliente c
   LEFT JOIN
   	pago p ON p.cliente_id = c.id
   WHERE
   	p.id IS NULL; 
   +------------+-----------------------------+---------+
   | cliente_id | nombre                      | pago_id |
   +------------+-----------------------------+---------+
   |          2 | Gardening Competitor        |    NULL |
   |          6 | Lasas S.A.                  |    NULL |
   |          8 | Club Golf Puerta del hierro |    NULL |
   |         10 | DaraDistribuciones          |    NULL |
   |         11 | Madrileña de riegos         |    NULL |
   |         12 | Lasas S.A.                  |    NULL |
   |         17 | Flowers, S.A                |    NULL |
   |         18 | Naturajardin                |    NULL |
   |         20 | Americh Golf Management SL  |    NULL |
   |         21 | Aloha                       |    NULL |
   |         22 | El Prat                     |    NULL |
   |         24 | Vivero Humanes              |    NULL |
   |         25 | Fuenla City                 |    NULL |
   |         29 | Top Campo                   |    NULL |
   |         31 | Campohermoso                |    NULL |
   |         32 | france telecom              |    NULL |
   |         33 | Musée du Louvre             |    NULL |
   |         36 | Flores S.L.                 |    NULL |
   |         37 | The Magic Garden            |    NULL |
   +------------+-----------------------------+---------+
   19 rows in set (0.01 sec)
   ```
7. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pedido.

   ```mysql
   SELECT
   	c.id AS  cliente_id,
   	c.nombre AS nombre_cliente,
   	p.id AS pedido_id
   FROM
   	cliente c
   LEFT JOIN
   	pedido p ON p.cliente_id = c.id
   WHERE
   	p.id IS NULL;
   +------------+-----------------------------+-----------+
   | cliente_id | nombre_cliente              | pedido_id |
   +------------+-----------------------------+-----------+
   |          8 | Club Golf Puerta del hierro |      NULL |
   |         10 | DaraDistribuciones          |      NULL |
   |         11 | Madrileña de riegos         |      NULL |
   |         12 | Lasas S.A.                  |      NULL |
   |         17 | Flowers, S.A                |      NULL |
   |         18 | Naturajardin                |      NULL |
   |         20 | Americh Golf Management SL  |      NULL |
   |         21 | Aloha                       |      NULL |
   |         22 | El Prat                     |      NULL |
   |         24 | Vivero Humanes              |      NULL |
   |         25 | Fuenla City                 |      NULL |
   |         29 | Top Campo                   |      NULL |
   |         31 | Campohermoso                |      NULL |
   |         32 | france telecom              |      NULL |
   |         33 | Musée du Louvre             |      NULL |
   |         37 | The Magic Garden            |      NULL |
   +------------+-----------------------------+-----------+
   16 rows in set (0.00 sec)
   ```
8. Devuelve un listado que muestre los clientes que no han realizado ningún pago y los que no han realizado ningún pedido.

   ```mysql
   SELECT
       c.id AS cliente_id,
       c.nombre AS nombre_cliente,
       p.id AS referencia_id,
       'sin_pedido' AS tipo_referencia
   FROM
       cliente c
   LEFT JOIN
       pedido p ON p.cliente_id = c.id
   WHERE
       p.id IS NULL
   UNION
   SELECT
       c.id AS cliente_id,
       c.nombre AS nombre_cliente,
       p.id AS referencia_id,
       'sin_pago' AS tipo_referencia
   FROM
       cliente c
   LEFT JOIN
       pago p ON p.cliente_id = c.id
   WHERE
       p.id IS NULL;
   +------------+-----------------------------+---------------+-----------------+
   | cliente_id | nombre_cliente              | referencia_id | tipo_referencia |
   +------------+-----------------------------+---------------+-----------------+
   |          8 | Club Golf Puerta del hierro |          NULL | sin_pedido      |
   |         10 | DaraDistribuciones          |          NULL | sin_pedido      |
   |         11 | Madrileña de riegos         |          NULL | sin_pedido      |
   |         12 | Lasas S.A.                  |          NULL | sin_pedido      |
   |         17 | Flowers, S.A                |          NULL | sin_pedido      |
   |         18 | Naturajardin                |          NULL | sin_pedido      |
   |         20 | Americh Golf Management SL  |          NULL | sin_pedido      |
   |         21 | Aloha                       |          NULL | sin_pedido      |
   |         22 | El Prat                     |          NULL | sin_pedido      |
   |         24 | Vivero Humanes              |          NULL | sin_pedido      |
   |         25 | Fuenla City                 |          NULL | sin_pedido      |
   |         29 | Top Campo                   |          NULL | sin_pedido      |
   |         31 | Campohermoso                |          NULL | sin_pedido      |
   |         32 | france telecom              |          NULL | sin_pedido      |
   |         33 | Musée du Louvre             |          NULL | sin_pedido      |
   |         37 | The Magic Garden            |          NULL | sin_pedido      |
   |          2 | Gardening Competitor        |          NULL | sin_pago        |
   |          6 | Lasas S.A.                  |          NULL | sin_pago        |
   |          8 | Club Golf Puerta del hierro |          NULL | sin_pago        |
   |         10 | DaraDistribuciones          |          NULL | sin_pago        |
   |         11 | Madrileña de riegos         |          NULL | sin_pago        |
   |         12 | Lasas S.A.                  |          NULL | sin_pago        |
   |         17 | Flowers, S.A                |          NULL | sin_pago        |
   |         18 | Naturajardin                |          NULL | sin_pago        |
   |         20 | Americh Golf Management SL  |          NULL | sin_pago        |
   |         21 | Aloha                       |          NULL | sin_pago        |
   |         22 | El Prat                     |          NULL | sin_pago        |
   |         24 | Vivero Humanes              |          NULL | sin_pago        |
   |         25 | Fuenla City                 |          NULL | sin_pago        |
   |         29 | Top Campo                   |          NULL | sin_pago        |
   |         31 | Campohermoso                |          NULL | sin_pago        |
   |         32 | france telecom              |          NULL | sin_pago        |
   |         33 | Musée du Louvre             |          NULL | sin_pago        |
   |         36 | Flores S.L.                 |          NULL | sin_pago        |
   |         37 | The Magic Garden            |          NULL | sin_pago        |
   +------------+-----------------------------+---------------+-----------------+
   35 rows in set (0.00 sec)
   ```
9. Devuelve un listado que muestre solamente los empleados que no tienen una oficina asociada.

   ```mysql
   SELECT
   	em.nombre
   FROM
   	empleado em
   WHERE
   	em.oficina_id IS NULL;
   Empty set (0.01 sec)
   -- No muestra nada porque en esta base de datos todo empleado debe tener oficina
   ```
10. Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado.

    ```mysql
    SELECT
    	em.id AS empleado_id,
    	em.nombre AS nombre_empleado,
    	cl.id AS cliente_id
    FROM
    	empleado em
    LEFT JOIN
    	cliente cl ON cl.empleado_id = em.id
    WHERE
    	cl.id IS NULL;
    +-------------+-----------------+------------+
    | empleado_id | nombre_empleado | cliente_id |
    +-------------+-----------------+------------+
    |           1 | Marcos          |       NULL |
    |           2 | Ruben           |       NULL |
    |           3 | Alberto         |       NULL |
    |           4 | Maria           |       NULL |
    |           6 | Juan Carlos     |       NULL |
    |           7 | Carlos          |       NULL |
    |          10 | Hilario         |       NULL |
    |          13 | David           |       NULL |
    |          14 | Oscar           |       NULL |
    |          15 | Francois        |       NULL |
    |          17 | Laurent         |       NULL |
    |          20 | Hilary          |       NULL |
    |          21 | Marcus          |       NULL |
    |          23 | Nei             |       NULL |
    |          24 | Narumi          |       NULL |
    |          25 | Takuma          |       NULL |
    |          26 | Amy             |       NULL |
    |          27 | Larry           |       NULL |
    |          28 | John            |       NULL |
    |          29 | Kevin           |       NULL |
    +-------------+-----------------+------------+
    20 rows in set (0.00 sec)
    ```
11. Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado junto con los datos de la oficina donde trabajan.

    ```mysql
    SELECT
    	em.id AS empleado_id,
    	em.nombre AS nombre_empleado,
    	ofc.id AS oficina_id,
    	ofc.nombre AS oficina_nombre,
    	pa.nombre AS pais_oficina,
    	re.nombre AS region_oficina,
    	c.nombre AS ciudad_oficina,
    	df.detalle AS direccion_oficina,
    	cl.id AS cliente_id
    FROM
    	empleado em
    LEFT JOIN
    	cliente cl ON cl.empleado_id = em.id
    LEFT JOIN
    	oficina ofc ON ofc.id = em.oficina_id
    LEFT JOIN
    	direccion_oficina df ON df.oficina_id = ofc.id
    LEFT JOIN
    	pais pa ON df.pais_id = pa.id
    LEFT JOIN
    	region re ON df.region_id = re.id
    LEFT JOIN
    	ciudad c ON  df.ciudad_id = c.id
    WHERE
    	cl.id IS NULL;
    +-------------+-----------------+------------+----------------+--------------+----------------+----------------------+--------------------------------------------+------------+
    | empleado_id | nombre_empleado | oficina_id | oficina_nombre | pais_oficina | region_oficina | ciudad_oficina       | direccion_oficina                          | cliente_id |
    +-------------+-----------------+------------+----------------+--------------+----------------+----------------------+--------------------------------------------+------------+
    |           1 | Marcos          |          8 | TAL-ES         | España       | Madrid         | Talavera de la Reina | Francisco Aguirre, 32 - 5º piso (exterior) |       NULL |
    |           2 | Ruben           |          8 | TAL-ES         | España       | Madrid         | Talavera de la Reina | Francisco Aguirre, 32 - 5º piso (exterior) |       NULL |
    |           3 | Alberto         |          8 | TAL-ES         | España       | Madrid         | Talavera de la Reina | Francisco Aguirre, 32 - 5º piso (exterior) |       NULL |
    |           4 | Maria           |          8 | TAL-ES         | España       | Madrid         | Talavera de la Reina | Francisco Aguirre, 32 - 5º piso (exterior) |       NULL |
    |           6 | Juan Carlos     |          8 | TAL-ES         | España       | Madrid         | Talavera de la Reina | Francisco Aguirre, 32 - 5º piso (exterior) |       NULL |
    |           7 | Carlos          |          4 | MAD-ES         | España       | Madrid         | Madrid               | Bulevar Indalecio Prieto, 32               |       NULL |
    |          10 | Hilario         |          4 | MAD-ES         | España       | Madrid         | Madrid               | Bulevar Indalecio Prieto, 32               |       NULL |
    |          13 | David           |          1 | BCN-ES         | España       | Barcelona      | Barcelona            | Avenida Diagonal, 38 - 3A escalera Derecha |       NULL |
    |          14 | Oscar           |          1 | BCN-ES         | España       | Barcelona      | Barcelona            | Avenida Diagonal, 38 - 3A escalera Derecha |       NULL |
    |          15 | Francois        |          5 | PAR-FR         | Francia      | EMEA           | Paris                | 29 Rue Jouffroy d'abbans                   |       NULL |
    |          17 | Laurent         |          5 | PAR-FR         | Francia      | EMEA           | Paris                | 29 Rue Jouffroy d'abbans                   |       NULL |
    |          20 | Hilary          |          2 | BOS-USA        | EEUU         | MA             | Boston               | 1550 Court Place - Suite 102               |       NULL |
    |          21 | Marcus          |          2 | BOS-USA        | EEUU         | MA             | Boston               | 1550 Court Place - Suite 102               |       NULL |
    |          23 | Nei             |          9 | TOK-JP         | Japón        | Chiyoda-Ku     | Tokyo                | 4-1 Kioicho                                |       NULL |
    |          24 | Narumi          |          9 | TOK-JP         | Japón        | Chiyoda-Ku     | Tokyo                | 4-1 Kioicho                                |       NULL |
    |          25 | Takuma          |          9 | TOK-JP         | Japón        | Chiyoda-Ku     | Tokyo                | 4-1 Kioicho                                |       NULL |
    |          26 | Amy             |          3 | LON-UK         | Inglaterra   | EMEA           | Londres              | 52 Old Broad Street - Ground Floor         |       NULL |
    |          27 | Larry           |          3 | LON-UK         | Inglaterra   | EMEA           | Londres              | 52 Old Broad Street - Ground Floor         |       NULL |
    |          28 | John            |          3 | LON-UK         | Inglaterra   | EMEA           | Londres              | 52 Old Broad Street - Ground Floor         |       NULL |
    |          29 | Kevin           |          7 | SYD-AU         | Australia    | Chiyoda-Ku     | Sydney               | 5-11 Wentworth Avenue - Floor #2           |       NULL |
    +-------------+-----------------+------------+----------------+--------------+----------------+----------------------+--------------------------------------------+------------+
    20 rows in set (0.01 sec)
    ```
12. Devuelve un listado que muestre los empleados que no tienen una oficina asociada y los que no tienen un cliente asociado.

    ```mysql
    SELECT
    	em.id AS empleado_id,
    	em.nombre AS nombre_empleado,
    	cl.id AS cliente_id,
    	ofC.id AS oficina_id
    FROM
    	empleado em
    LEFT JOIN
    	cliente cl ON cl.empleado_id = em.id
    LEFT JOIN
    	oficina ofc ON ofc.id = em.oficina_id
    WHERE
    	cl.id IS NULL
    	AND
    	ofC.id IS NULL;
    Empty set (0.00 sec)
    -- No retorna ningun dato porque en el modelo de esta base de datos se determino que todos los empleados deben tener oficina
    ```
13. Devuelve un listado de los productos que nunca han aparecido en un pedido.

    ```mysql
    SELECT
    	pr.id AS producto_id,
    	pr.nombre AS nombre_producto,
    	dpd.pedido_id AS pedido_id
    FROM
    	producto pr
    LEFT JOIN
    	detalle_pedido dpd ON dpd.producto_id = pr.id
    WHERE
    	dpd.pedido_id IS NULL;
    +-------------+-----------------+-----------+
    | producto_id | nombre_producto | pedido_id |
    +-------------+-----------------+-----------+
    |         241 | Producto 241    |      NULL |
    |         242 | Producto 242    |      NULL |
    |         243 | Producto 243    |      NULL |
    |         244 | Producto 244    |      NULL |
    |         245 | Producto 245    |      NULL |
    |         246 | Producto 246    |      NULL |
    |         247 | Producto 247    |      NULL |
    |         248 | Producto 248    |      NULL |
    |         249 | Producto 249    |      NULL |
    |         250 | Producto 250    |      NULL |
    |         251 | Producto 251    |      NULL |
    |         252 | Producto 252    |      NULL |
    |         253 | Producto 253    |      NULL |
    |         254 | Producto 254    |      NULL |
    |         255 | Producto 255    |      NULL |
    |         256 | Producto 256    |      NULL |
    |         257 | Producto 257    |      NULL |
    |         258 | Producto 258    |      NULL |
    |         259 | Producto 259    |      NULL |
    |         260 | Producto 260    |      NULL |
    |         261 | Producto 261    |      NULL |
    |         262 | Producto 262    |      NULL |
    |         263 | Producto 263    |      NULL |
    |         264 | Producto 264    |      NULL |
    |         265 | Producto 265    |      NULL |
    |         266 | Producto 266    |      NULL |
    |         267 | Producto 267    |      NULL |
    |         268 | Producto 268    |      NULL |
    |         269 | Producto 269    |      NULL |
    |         270 | Producto 270    |      NULL |
    |         271 | Producto 271    |      NULL |
    |         272 | Producto 272    |      NULL |
    |         273 | Producto 273    |      NULL |
    |         274 | Producto 274    |      NULL |
    |         275 | Producto 275    |      NULL |
    +-------------+-----------------+-----------+
    35 rows in set (0.01 sec)
    ```
14. Devuelve un listado de los productos que nunca han aparecido en un pedido. El resultado debe mostrar el nombre, la descripción y la imagen del producto.

    ```mysql
    SELECT
    	pr.id AS producto_id,
    	pr.nombre AS nombre_producto,
    	dpd.pedido_id AS pedido_id,
    	gp.descripcion_texto,
    	gp.descripcion_html
    FROM
    	producto pr
    LEFT JOIN
    	detalle_pedido dpd ON dpd.producto_id = pr.id
    LEFT JOIN
    	gama_producto gp ON gp.id =  pr.gama_id
    WHERE
    	dpd.pedido_id IS NULL;
    +-------------+-----------------+-----------+------------------------------------------------+------------------+
    | producto_id | nombre_producto | pedido_id | descripcion_texto                              | descripcion_html |
    +-------------+-----------------+-----------+------------------------------------------------+------------------+
    |         241 | Producto 241    |      NULL | Plantas vistosas para la decoración del jardín | NULL             |
    |         242 | Producto 242    |      NULL | Herramientas para todo tipo de acción          | NULL             |
    |         243 | Producto 243    |      NULL | Plantas vistosas para la decoración del jardín | NULL             |
    |         244 | Producto 244    |      NULL | Herramientas para todo tipo de acción          | NULL             |
    |         245 | Producto 245    |      NULL | Plantas para jardin decorativas                | NULL             |
    |         246 | Producto 246    |      NULL | Plantas vistosas para la decoración del jardín | NULL             |
    |         247 | Producto 247    |      NULL | Plantas aromáticas                             | NULL             |
    |         248 | Producto 248    |      NULL | Plantas aromáticas                             | NULL             |
    |         249 | Producto 249    |      NULL | Árboles pequeños de producción frutal          | NULL             |
    |         250 | Producto 250    |      NULL | Árboles pequeños de producción frutal          | NULL             |
    |         251 | Producto 251    |      NULL | Árboles pequeños de producción frutal          | NULL             |
    |         252 | Producto 252    |      NULL | Árboles pequeños de producción frutal          | NULL             |
    |         253 | Producto 253    |      NULL | Plantas aromáticas                             | NULL             |
    |         254 | Producto 254    |      NULL | Plantas para jardin decorativas                | NULL             |
    |         255 | Producto 255    |      NULL | Plantas para jardin decorativas                | NULL             |
    |         256 | Producto 256    |      NULL | Plantas vistosas para la decoración del jardín | NULL             |
    |         257 | Producto 257    |      NULL | Plantas para jardin decorativas                | NULL             |
    |         258 | Producto 258    |      NULL | Plantas aromáticas                             | NULL             |
    |         259 | Producto 259    |      NULL | Plantas para jardin decorativas                | NULL             |
    |         260 | Producto 260    |      NULL | Plantas aromáticas                             | NULL             |
    |         261 | Producto 261    |      NULL | Árboles pequeños de producción frutal          | NULL             |
    |         262 | Producto 262    |      NULL | Plantas vistosas para la decoración del jardín | NULL             |
    |         263 | Producto 263    |      NULL | Árboles pequeños de producción frutal          | NULL             |
    |         264 | Producto 264    |      NULL | Plantas vistosas para la decoración del jardín | NULL             |
    |         265 | Producto 265    |      NULL | Plantas aromáticas                             | NULL             |
    |         266 | Producto 266    |      NULL | Plantas vistosas para la decoración del jardín | NULL             |
    |         267 | Producto 267    |      NULL | Plantas para jardin decorativas                | NULL             |
    |         268 | Producto 268    |      NULL | Plantas para jardin decorativas                | NULL             |
    |         269 | Producto 269    |      NULL | Plantas aromáticas                             | NULL             |
    |         270 | Producto 270    |      NULL | Herramientas para todo tipo de acción          | NULL             |
    |         271 | Producto 271    |      NULL | Herramientas para todo tipo de acción          | NULL             |
    |         272 | Producto 272    |      NULL | Herramientas para todo tipo de acción          | NULL             |
    |         273 | Producto 273    |      NULL | Árboles pequeños de producción frutal          | NULL             |
    |         274 | Producto 274    |      NULL | Plantas aromáticas                             | NULL             |
    |         275 | Producto 275    |      NULL | Herramientas para todo tipo de acción          | NULL             |
    +-------------+-----------------+-----------+------------------------------------------------+------------------+
    35 rows in set (0.00 sec)
    ```
15. Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los representantes de ventas de algún cliente que haya realizado la compra de algún producto de la gama Frutales.

    ```mysql
    SELECT o.id, o.nombre 
    FROM oficina o
    WHERE o.id NOT IN (
        SELECT DISTINCT oficina_id 
        FROM empleado 
        WHERE id IN (
            SELECT DISTINCT empleado_id 
            FROM cliente 
            WHERE id IN (
                SELECT DISTINCT cliente_id 
                FROM pedido 
                WHERE id IN (
                    SELECT DISTINCT pedido_id 
                    FROM detalle_pedido 
                    WHERE producto_id IN (
                        SELECT id 
                        FROM producto 
                        WHERE gama_id = (SELECT id FROM gama_producto WHERE nombre = 'Frutales')
                    )
                )
            )
        )
    );

    +----+--------+
    | id | nombre |
    +----+--------+
    |  3 | LON-UK |
    |  5 | PAR-FR |
    |  9 | TOK-JP |
    +----+--------+
    3 rows in set (0.02 sec)
    ```
16. Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado ningún pago.

    ```mysql
    SELECT
    	cl.id AS cliente_id,
    	cl.nombre AS nombre_cliente,
    	pd.id AS pedido_id,
    	pa.id AS pago_id
    FROM
    	cliente cl
    INNER JOIN
    	pedido pd ON pd.cliente_id = cl.id
    LEFT JOIN
    	pago pa ON pa.cliente_id = cl.id
    WHERE
    	pa.id IS NULL;
    +------------+----------------------+-----------+---------+
    | cliente_id | nombre_cliente       | pedido_id | pago_id |
    +------------+----------------------+-----------+---------+
    |          2 | Gardening Competitor |        23 |    NULL |
    |          2 | Gardening Competitor |        37 |    NULL |
    |          6 | Lasas S.A.           |        29 |    NULL |
    |         36 | Flores S.L.          |       111 |    NULL |
    |         36 | Flores S.L.          |       112 |    NULL |
    |         36 | Flores S.L.          |       113 |    NULL |
    |         36 | Flores S.L.          |       114 |    NULL |
    |         36 | Flores S.L.          |       115 |    NULL |
    +------------+----------------------+-----------+---------+
    8 rows in set (0.00 sec)
    ```
17. Devuelve un listado con los datos de los empleados que no tienen clientes asociados y el nombre de su jefe asociado.

    ```mysql
    SELECT
    	em.id AS empleado_id,
    	em.nombre AS nombre_empleado,
    	cl.id AS cliente_id,
    	jf.nombre AS nombre_jefe
    FROM
    	empleado em
    INNER JOIN
    	empleado  jf ON em.jefe_id = jf.id
    LEFT JOIN
    	cliente cl ON cl.empleado_id = em.id
    WHERE
    	cl.id IS NULL;
    +-------------+-----------------+------------+-------------+
    | empleado_id | nombre_empleado | cliente_id | nombre_jefe |
    +-------------+-----------------+------------+-------------+
    |           2 | Ruben           |       NULL | Marcos      |
    |           3 | Alberto         |       NULL | Ruben       |
    |           4 | Maria           |       NULL | Ruben       |
    |           6 | Juan Carlos     |       NULL | Alberto     |
    |           7 | Carlos          |       NULL | Alberto     |
    |          10 | Hilario         |       NULL | Carlos      |
    |          13 | David           |       NULL | Emmanuel    |
    |          14 | Oscar           |       NULL | Emmanuel    |
    |          15 | Francois        |       NULL | Alberto     |
    |          17 | Laurent         |       NULL | Francois    |
    |          20 | Hilary          |       NULL | Alberto     |
    |          21 | Marcus          |       NULL | Hilary      |
    |          23 | Nei             |       NULL | Alberto     |
    |          24 | Narumi          |       NULL | Nei         |
    |          25 | Takuma          |       NULL | Nei         |
    |          26 | Amy             |       NULL | Alberto     |
    |          27 | Larry           |       NULL | Amy         |
    |          28 | John            |       NULL | Amy         |
    |          29 | Kevin           |       NULL | Alberto     |
    +-------------+-----------------+------------+-------------+
    19 rows in set (0.00 sec)
    ```

    ## Consultas resumen
18. ¿Cuántos empleados hay en la compañía?
19. ¿Cuántos clientes tiene cada país?
20. ¿Cuál fue el pago medio en 2009?
21. ¿Cuántos pedidos hay en cada estado? Ordena el resultado de forma descendente por el número de pedidos.
22. Calcula el precio de venta del producto más caro y más barato en una misma consulta.
23. Calcula el número de clientes que tiene la empresa.
24. ¿Cuántos clientes existen con domicilio en la ciudad de Madrid?
25. ¿Calcula cuántos clientes tiene cada una de las ciudades que empiezan por M?
26. Devuelve el nombre de los representantes de ventas y el número de clientes al que atiende cada uno.
27. Calcula el número de clientes que no tiene asignado representante de ventas.
28. Calcula la fecha del primer y último pago realizado por cada uno de los clientes. El listado deberá mostrar el nombre y los apellidos de cada cliente.
29. Calcula el número de productos diferentes que hay en cada uno de los pedidos.
30. Calcula la suma de la cantidad total de todos los productos que aparecen en cada uno de los pedidos.
31. Devuelve un listado de los 20 productos más vendidos y el número total de unidades que se han vendido de cada uno. El listado deberá estar ordenado por el número total de unidades vendidas.
32. La facturación que ha tenido la empresa en toda la historia, indicando la base imponible, el IVA y el total facturado. La base imponible se calcula sumando el coste del producto por el número de unidades vendidas de la tabla detalle_pedido. El IVA es el 21 % de la base imponible, y el total la suma de los dos campos anteriores.
33. La misma información que en la pregunta anterior, pero agrupada por código de producto.
34. La misma información que en la pregunta anterior, pero agrupada por código de producto filtrada por los códigos que empiecen por OR.
35. Lista las ventas totales de los productos que hayan facturado más de 3000 euros. Se mostrará el nombre, unidades vendidas, total facturado y total facturado con impuestos (21% IVA).
36. Muestre la suma total de todos los pagos que se realizaron para cada uno de los años que aparecen en la tabla pagos.

    ## Subconsultas

    ## Con operadores básicos de comparación
37. Devuelve el nombre del cliente con mayor límite de crédito.
38. Devuelve el nombre del producto que tenga el precio de venta más caro.
39. Devuelve el nombre del producto del que se han vendido más unidades. (Tenga en cuenta que tendrá que calcular cuál es el número total de unidades que se han vendido de cada producto a partir de los datos de la tabla detalle_pedido)
40. Los clientes cuyo límite de crédito sea mayor que los pagos que haya realizado. (Sin utilizar INNER JOIN).
41. Devuelve el producto que más unidades tiene en stock.
42. Devuelve el producto que menos unidades tiene en stock.
43. Devuelve el nombre, los apellidos y el email de los empleados que están a cargo de Alberto Soria.

    ## Subconsultas con ALL y ANY
44. Devuelve el nombre del cliente con mayor límite de crédito.
45. Devuelve el nombre del producto que tenga el precio de venta más caro.
46. Devuelve el producto que menos unidades tiene en stock.

    ## Subconsultas con IN y NOT IN
47. Devuelve el nombre, apellido1 y cargo de los empleados que no representen a ningún cliente.

    ```mysql
    SELECT
    	em.nombre AS empleado_nombre,
    	em.apellido1 AS empleado_apellido1,
    	pu.puesto AS empleado_puesto
    FROM
    	empleado em
    INNER JOIN
    	puesto pu ON em.puesto_id = pu.id
    WHERE
    	em.id NOT IN(SELECT cl.empleado_id FROM cliente cl);
    +-----------------+--------------------+-----------------------+
    | empleado_nombre | empleado_apellido1 | empleado_puesto       |
    +-----------------+--------------------+-----------------------+
    | Marcos          | Magaña             | Director General      |
    | Carlos          | Soria              | Director General      |
    | Francois        | Fignon             | Director General      |
    | Hilary          | Washington         | Director General      |
    | Nei             | Nishikori          | Director General      |
    | Amy             | Johnson            | Director General      |
    | Kevin           | Fallmer            | Director General      |
    | Ruben           | López              | Subdirector Marketing |
    | Alberto         | Soria              | Subdirector Ventas    |
    | Maria           | Solís              | Secretaria            |
    | Juan Carlos     | Ortiz              | Representante Ventas  |
    | Hilario         | Rodriguez          | Representante Ventas  |
    | David           | Palma              | Representante Ventas  |
    | Oscar           | Palma              | Representante Ventas  |
    | Laurent         | Serra              | Representante Ventas  |
    | Marcus          | Paxton             | Representante Ventas  |
    | Narumi          | Riko               | Representante Ventas  |
    | Takuma          | Nomura             | Representante Ventas  |
    | Larry           | Westfalls          | Representante Ventas  |
    | John            | Walton             | Representante Ventas  |
    +-----------------+--------------------+-----------------------+
    20 rows in set (0.01 sec)
    ```
48. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.

    ```mysql
    SELECT
        cl.id AS cliente_id,
        cl.nombre AS nombre_cliente
    FROM
        cliente cl
    WHERE 
    	cl.id NOT IN (
        SELECT
            pa.cliente_id
        FROM
            pago pa
    );
    +------------+-----------------------------+
    | cliente_id | nombre_cliente              |
    +------------+-----------------------------+
    |          2 | Gardening Competitor        |
    |          6 | Lasas S.A.                  |
    |          8 | Club Golf Puerta del hierro |
    |         10 | DaraDistribuciones          |
    |         11 | Madrileña de riegos         |
    |         12 | Lasas S.A.                  |
    |         17 | Flowers, S.A                |
    |         18 | Naturajardin                |
    |         20 | Americh Golf Management SL  |
    |         21 | Aloha                       |
    |         22 | El Prat                     |
    |         24 | Vivero Humanes              |
    |         25 | Fuenla City                 |
    |         29 | Top Campo                   |
    |         31 | Campohermoso                |
    |         32 | france telecom              |
    |         33 | Musée du Louvre             |
    |         36 | Flores S.L.                 |
    |         37 | The Magic Garden            |
    +------------+-----------------------------+
    19 rows in set (0.00 sec)
    ```
49. Devuelve un listado que muestre solamente los clientes que sí han realizado algún pago.

    ```mysql
    SELECT
        cl.id AS cliente_id,
        cl.nombre AS nombre_cliente
    FROM
        cliente cl
    WHERE 
    	cl.id IN (
        SELECT
            pa.cliente_id
        FROM
            pago pa
    );
    +------------+--------------------------------+
    | cliente_id | nombre_cliente                 |
    +------------+--------------------------------+
    |          1 | GoldFish Garden                |
    |          3 | Gardening Associates           |
    |          4 | Gerudo Valley                  |
    |          5 | Tendo Garden                   |
    |          7 | Beragua                        |
    |          9 | Naturagua                      |
    |         13 | Camunas Jardines S.L.          |
    |         14 | Dardena S.A.                   |
    |         15 | Jardin de Flores               |
    |         16 | Flores Marivi                  |
    |         19 | Golf S.A.                      |
    |         23 | Sotogrande                     |
    |         26 | Jardines y Mansiones Cactus SL |
    |         27 | Jardinerías Matías SL          |
    |         28 | Agrojardin                     |
    |         30 | Jardineria Sara                |
    |         35 | Tutifruti S.A                  |
    |         38 | El Jardin Viviente S.L         |
    +------------+--------------------------------+
    18 rows in set (0.00 sec)

    ```
50. Devuelve un listado de los productos que nunca han aparecido en un pedido.

    ```mysql
    SELECT
        pr.id AS producto_id,
        pr.nombre AS nombre_producto
    FROM
        producto pr
    WHERE pr.id NOT IN (
        SELECT
            dpd.producto_id
        FROM
            detalle_pedido dpd
    );
    +-------------+-----------------+
    | producto_id | nombre_producto |
    +-------------+-----------------+
    |         241 | Producto 241    |
    |         242 | Producto 242    |
    |         243 | Producto 243    |
    |         244 | Producto 244    |
    |         245 | Producto 245    |
    |         246 | Producto 246    |
    |         247 | Producto 247    |
    |         248 | Producto 248    |
    |         249 | Producto 249    |
    |         250 | Producto 250    |
    |         251 | Producto 251    |
    |         252 | Producto 252    |
    |         253 | Producto 253    |
    |         254 | Producto 254    |
    |         255 | Producto 255    |
    |         256 | Producto 256    |
    |         257 | Producto 257    |
    |         258 | Producto 258    |
    |         259 | Producto 259    |
    |         260 | Producto 260    |
    |         261 | Producto 261    |
    |         262 | Producto 262    |
    |         263 | Producto 263    |
    |         264 | Producto 264    |
    |         265 | Producto 265    |
    |         266 | Producto 266    |
    |         267 | Producto 267    |
    |         268 | Producto 268    |
    |         269 | Producto 269    |
    |         270 | Producto 270    |
    |         271 | Producto 271    |
    |         272 | Producto 272    |
    |         273 | Producto 273    |
    |         274 | Producto 274    |
    |         275 | Producto 275    |
    +-------------+-----------------+
    35 rows in set (0.00 sec)
    ```
51. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados que no sean representante de ventas de ningún cliente.
52. Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los representantes de ventas de algún cliente que haya realizado la compra de algún producto de la gama Frutales.
53. Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado ningún pago. 18.

## Subconsultas con EXISTS y NOT EXISTS

1. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.

   ```mysql
   SELECT
       cl.id AS cliente_id,
       cl.nombre AS nombre_cliente
   FROM
       cliente cl
   WHERE NOT EXISTS (
       SELECT
           1
       FROM
           pago pa
       WHERE
           pa.cliente_id = cl.id
   );
   +------------+-----------------------------+
   | cliente_id | nombre_cliente              |
   +------------+-----------------------------+
   |          2 | Gardening Competitor        |
   |          6 | Lasas S.A.                  |
   |          8 | Club Golf Puerta del hierro |
   |         10 | DaraDistribuciones          |
   |         11 | Madrileña de riegos         |
   |         12 | Lasas S.A.                  |
   |         17 | Flowers, S.A                |
   |         18 | Naturajardin                |
   |         20 | Americh Golf Management SL  |
   |         21 | Aloha                       |
   |         22 | El Prat                     |
   |         24 | Vivero Humanes              |
   |         25 | Fuenla City                 |
   |         29 | Top Campo                   |
   |         31 | Campohermoso                |
   |         32 | france telecom              |
   |         33 | Musée du Louvre             |
   |         36 | Flores S.L.                 |
   |         37 | The Magic Garden            |
   +------------+-----------------------------+
   19 rows in set (0.00 sec)
   ```
2. Devuelve un listado que muestre solamente los clientes que sí han realizado algún pago.

   ```mysql
   SELECT
       cl.id AS cliente_id,
       cl.nombre AS nombre_cliente
   FROM
       cliente cl
   WHERE EXISTS (
       SELECT
           1
       FROM
           pago pa
       WHERE
           pa.cliente_id = cl.id
   );
   +------------+--------------------------------+
   | cliente_id | nombre_cliente                 |
   +------------+--------------------------------+
   |          1 | GoldFish Garden                |
   |          3 | Gardening Associates           |
   |          4 | Gerudo Valley                  |
   |          5 | Tendo Garden                   |
   |          7 | Beragua                        |
   |          9 | Naturagua                      |
   |         13 | Camunas Jardines S.L.          |
   |         14 | Dardena S.A.                   |
   |         15 | Jardin de Flores               |
   |         16 | Flores Marivi                  |
   |         19 | Golf S.A.                      |
   |         23 | Sotogrande                     |
   |         26 | Jardines y Mansiones Cactus SL |
   |         27 | Jardinerías Matías SL          |
   |         28 | Agrojardin                     |
   |         30 | Jardineria Sara                |
   |         35 | Tutifruti S.A                  |
   |         38 | El Jardin Viviente S.L         |
   +------------+--------------------------------+
   18 rows in set (0.00 sec)
   ```
3. Devuelve un listado de los productos que nunca han aparecido en un pedido.

   ```mysql
   SELECT
       pr.id AS producto_id,
       pr.nombre AS nombre_producto
   FROM
       producto pr
   WHERE NOT EXISTS (
       SELECT
           1
       FROM
           detalle_pedido dpd
       WHERE
           dpd.producto_id = pr.id
   );
   +-------------+-----------------+
   | producto_id | nombre_producto |
   +-------------+-----------------+
   |         241 | Producto 241    |
   |         242 | Producto 242    |
   |         243 | Producto 243    |
   |         244 | Producto 244    |
   |         245 | Producto 245    |
   |         246 | Producto 246    |
   |         247 | Producto 247    |
   |         248 | Producto 248    |
   |         249 | Producto 249    |
   |         250 | Producto 250    |
   |         251 | Producto 251    |
   |         252 | Producto 252    |
   |         253 | Producto 253    |
   |         254 | Producto 254    |
   |         255 | Producto 255    |
   |         256 | Producto 256    |
   |         257 | Producto 257    |
   |         258 | Producto 258    |
   |         259 | Producto 259    |
   |         260 | Producto 260    |
   |         261 | Producto 261    |
   |         262 | Producto 262    |
   |         263 | Producto 263    |
   |         264 | Producto 264    |
   |         265 | Producto 265    |
   |         266 | Producto 266    |
   |         267 | Producto 267    |
   |         268 | Producto 268    |
   |         269 | Producto 269    |
   |         270 | Producto 270    |
   |         271 | Producto 271    |
   |         272 | Producto 272    |
   |         273 | Producto 273    |
   |         274 | Producto 274    |
   |         275 | Producto 275    |
   +-------------+-----------------+
   35 rows in set (0.00 sec)
   ```
4. Devuelve un listado de los productos que han aparecido en un pedido alguna vez.

   ```mysql
   SELECT
       pr.id AS producto_id,
       pr.nombre AS nombre_producto
   FROM
       producto pr
   WHERE EXISTS (
       SELECT
           1
       FROM
           detalle_pedido dpd
       WHERE
           dpd.producto_id = pr.id
   );
   +-------------+-----------------+
   | producto_id | nombre_producto |
   +-------------+-----------------+
   |           1 | Producto 1      |
   |           2 | Producto 2      |
   |           3 | Producto 3      |
   |           4 | Producto 4      |
   |           5 | Producto 5      |
   |           6 | Producto 6      |
   |           7 | Producto 7      |
   |           8 | Producto 8      |
   |           9 | Producto 9      |
   |          10 | Producto 10     |
   |          11 | Producto 11     |
   |          12 | Producto 12     |
   |          13 | Producto 13     |
   |          14 | Producto 14     |
   |          15 | Producto 15     |
   |          16 | Producto 16     |
   |          17 | Producto 17     |
   |          18 | Producto 18     |
   |          19 | Producto 19     |
   |          20 | Producto 20     |
   |          21 | Producto 21     |
   |          22 | Producto 22     |
   |          23 | Producto 23     |
   |          24 | Producto 24     |
   |          25 | Producto 25     |
   |          26 | Producto 26     |
   |          27 | Producto 27     |
   |          28 | Producto 28     |
   |          29 | Producto 29     |
   |          30 | Producto 30     |
   |          31 | Producto 31     |
   |          32 | Producto 32     |
   |          33 | Producto 33     |
   |          34 | Producto 34     |
   |          35 | Producto 35     |
   |          36 | Producto 36     |
   |          37 | Producto 37     |
   |          38 | Producto 38     |
   |          39 | Producto 39     |
   |          40 | Producto 40     |
   |          41 | Producto 41     |
   |          42 | Producto 42     |
   |          43 | Producto 43     |
   |          44 | Producto 44     |
   |          45 | Producto 45     |
   |          46 | Producto 46     |
   |          47 | Producto 47     |
   |          48 | Producto 48     |
   |          49 | Producto 49     |
   |          50 | Producto 50     |
   |          51 | Producto 51     |
   |          52 | Producto 52     |
   |          53 | Producto 53     |
   |          54 | Producto 54     |
   |          55 | Producto 55     |
   |          56 | Producto 56     |
   |          57 | Producto 57     |
   |          58 | Producto 58     |
   |          59 | Producto 59     |
   |          60 | Producto 60     |
   |          61 | Producto 61     |
   |          62 | Producto 62     |
   |          63 | Producto 63     |
   |          64 | Producto 64     |
   |          65 | Producto 65     |
   |          66 | Producto 66     |
   |          67 | Producto 67     |
   |          68 | Producto 68     |
   |          69 | Producto 69     |
   |          70 | Producto 70     |
   |          71 | Producto 71     |
   |          72 | Producto 72     |
   |          73 | Producto 73     |
   |          74 | Producto 74     |
   |          75 | Producto 75     |
   |          76 | Producto 76     |
   |          77 | Producto 77     |
   |          78 | Producto 78     |
   |          79 | Producto 79     |
   |          80 | Producto 80     |
   |          81 | Producto 81     |
   |          82 | Producto 82     |
   |          83 | Producto 83     |
   |          84 | Producto 84     |
   |          85 | Producto 85     |
   |          86 | Producto 86     |
   |          87 | Producto 87     |
   |          88 | Producto 88     |
   |          89 | Producto 89     |
   |          90 | Producto 90     |
   |          91 | Producto 91     |
   |          92 | Producto 92     |
   |          93 | Producto 93     |
   |          94 | Producto 94     |
   |          95 | Producto 95     |
   |          96 | Producto 96     |
   |          97 | Producto 97     |
   |          98 | Producto 98     |
   |          99 | Producto 99     |
   |         100 | Producto 100    |
   |         101 | Producto 101    |
   |         102 | Producto 102    |
   |         103 | Producto 103    |
   |         104 | Producto 104    |
   |         105 | Producto 105    |
   |         106 | Producto 106    |
   |         107 | Producto 107    |
   |         108 | Producto 108    |
   |         109 | Producto 109    |
   |         110 | Producto 110    |
   |         111 | Producto 111    |
   |         112 | Producto 112    |
   |         113 | Producto 113    |
   |         114 | Producto 114    |
   |         115 | Producto 115    |
   |         116 | Producto 116    |
   |         117 | Producto 117    |
   |         118 | Producto 118    |
   |         119 | Producto 119    |
   |         120 | Producto 120    |
   |         121 | Producto 121    |
   |         122 | Producto 122    |
   |         123 | Producto 123    |
   |         124 | Producto 124    |
   |         125 | Producto 125    |
   |         126 | Producto 126    |
   |         127 | Producto 127    |
   |         128 | Producto 128    |
   |         129 | Producto 129    |
   |         130 | Producto 130    |
   |         131 | Producto 131    |
   |         132 | Producto 132    |
   |         133 | Producto 133    |
   |         134 | Producto 134    |
   |         135 | Producto 135    |
   |         136 | Producto 136    |
   |         137 | Producto 137    |
   |         138 | Producto 138    |
   |         139 | Producto 139    |
   |         140 | Producto 140    |
   |         141 | Producto 141    |
   |         142 | Producto 142    |
   |         143 | Producto 143    |
   |         144 | Producto 144    |
   |         145 | Producto 145    |
   |         146 | Producto 146    |
   |         147 | Producto 147    |
   |         148 | Producto 148    |
   |         149 | Producto 149    |
   |         150 | Producto 150    |
   |         151 | Producto 151    |
   |         152 | Producto 152    |
   |         153 | Producto 153    |
   |         154 | Producto 154    |
   |         155 | Producto 155    |
   |         156 | Producto 156    |
   |         157 | Producto 157    |
   |         158 | Producto 158    |
   |         159 | Producto 159    |
   |         160 | Producto 160    |
   |         161 | Producto 161    |
   |         162 | Producto 162    |
   |         163 | Producto 163    |
   |         164 | Producto 164    |
   |         165 | Producto 165    |
   |         166 | Producto 166    |
   |         167 | Producto 167    |
   |         168 | Producto 168    |
   |         169 | Producto 169    |
   |         170 | Producto 170    |
   |         171 | Producto 171    |
   |         172 | Producto 172    |
   |         173 | Producto 173    |
   |         174 | Producto 174    |
   |         175 | Producto 175    |
   |         176 | Producto 176    |
   |         177 | Producto 177    |
   |         178 | Producto 178    |
   |         179 | Producto 179    |
   |         180 | Producto 180    |
   |         181 | Producto 181    |
   |         182 | Producto 182    |
   |         183 | Producto 183    |
   |         184 | Producto 184    |
   |         185 | Producto 185    |
   |         186 | Producto 186    |
   |         187 | Producto 187    |
   |         188 | Producto 188    |
   |         189 | Producto 189    |
   |         190 | Producto 190    |
   |         191 | Producto 191    |
   |         192 | Producto 192    |
   |         193 | Producto 193    |
   |         194 | Producto 194    |
   |         195 | Producto 195    |
   |         196 | Producto 196    |
   |         197 | Producto 197    |
   |         198 | Producto 198    |
   |         199 | Producto 199    |
   |         200 | Producto 200    |
   |         201 | Producto 201    |
   |         202 | Producto 202    |
   |         203 | Producto 203    |
   |         204 | Producto 204    |
   |         205 | Producto 205    |
   |         206 | Producto 206    |
   |         207 | Producto 207    |
   |         208 | Producto 208    |
   |         209 | Producto 209    |
   |         210 | Producto 210    |
   |         211 | Producto 211    |
   |         212 | Producto 212    |
   |         213 | Producto 213    |
   |         214 | Producto 214    |
   |         215 | Producto 215    |
   |         216 | Producto 216    |
   |         217 | Producto 217    |
   |         218 | Producto 218    |
   |         219 | Producto 219    |
   |         220 | Producto 220    |
   |         221 | Producto 221    |
   |         222 | Producto 222    |
   |         223 | Producto 223    |
   |         224 | Producto 224    |
   |         225 | Producto 225    |
   |         226 | Producto 226    |
   |         227 | Producto 227    |
   |         228 | Producto 228    |
   |         229 | Producto 229    |
   |         230 | Producto 230    |
   |         231 | Producto 231    |
   |         232 | Producto 232    |
   |         233 | Producto 233    |
   |         234 | Producto 234    |
   |         235 | Producto 235    |
   |         236 | Producto 236    |
   |         237 | Producto 237    |
   |         238 | Producto 238    |
   |         239 | Producto 239    |
   |         240 | Producto 240    |
   +-------------+-----------------+
   240 rows in set (0.00 sec)
   ```
   ,

   ## Subconsultas correlacionadas

   ## Consultas variadas
5. Devuelve el listado de clientes indicando el nombre del cliente y cuántos pedidos ha realizado. Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido.
6. Devuelve un listado con los nombres de los clientes y el total pagado por cada uno de ellos. Tenga en cuenta que pueden existir clientes que no han realizado ningún pago.
7. Devuelve el nombre de los clientes que hayan hecho pedidos en 2008 ordenados alfabéticamente de menor a mayor.
8. Devuelve el nombre del cliente, el nombre y primer apellido de su representante de ventas y el número de teléfono de la oficina del representante de ventas, de aquellos clientes que no hayan realizado ningún pago.
9. Devuelve el listado de clientes donde aparezca el nombre del cliente, el nombre y primer apellido de su representante de ventas y la ciudad donde está su oficina.
10. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados que no sean representante de ventas de ningún cliente.
11. Devuelve un listado indicando todas las ciudades donde hay oficinas y el número de empleados que tiene.
