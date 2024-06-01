# DbGardenTallerOscarArismendi

## Consultas sobre una tabla

1. Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.

   ```mysql
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

   ```mysql
    SELECT
            c.nombre AS ciudad,
            t.numero AS telefono
        FROM
            oficina o
        INNER JOIN
            direccion_oficina d ON o.id = d.oficina_id
        INNER JOIN
            ciudad c ON d.ciudad_id = c.id
        INNER JOIN
            pais p ON d.pais_id = p.id
        INNER JOIN
            telefono_oficina t ON o.id = t.oficina_id
        WHERE
            p.nombre = 'España';
   +----------------------+----------------+
   | ciudad               | telefono       |
   +----------------------+----------------+
   | Barcelona            | +34 93 3561182 |
   | Madrid               | +34 91 7514487 |
   | Talavera de la Reina | +34 925 867231 |
   +----------------------+----------------+
   3 rows in set (0.01 sec)
   ```
3. Devuelve un listado con el nombre, apellidos y email de los empleados cuyo jefe tiene un código de jefe igual a 7.

   ```mysql
    SELECT
            e.nombre,
            e.apellido1,
            e.apellido2,
            e.email
        FROM
            empleado e
        JOIN
            empleado jf ON e.jefe_id = jf.id
        WHERE
            jf.id = 7;
   +---------+-----------+-----------+--------------------------+
   | nombre  | apellido1 | apellido2 | email                    |
   +---------+-----------+-----------+--------------------------+
   | Mariano | López     | Murcia    | mlopez@jardineria.es     |
   | Lucio   | Campoamor | Martín    | lcampoamor@jardineria.es |
   | Hilario | Rodriguez | Huertas   | hrodriguez@jardineria.es |
   +---------+-----------+-----------+--------------------------+
   3 rows in set (0.00 sec)
   ```
4. Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa.

   ```mysql
   SELECT
   	jf.nombre AS nombre_jefe,
   	jf.apellido1 AS apellido1_jefe,
   	jf.apellido2 AS apellido2_jefe,
   	jf.email AS email
   FROM
   	empleado jf
   WHERE
   	jf.jefe_id IS NULL;
   +-------------+----------------+----------------+----------------------+
   | nombre_jefe | apellido1_jefe | apellido2_jefe | email                |
   +-------------+----------------+----------------+----------------------+
   | Marcos      | Magaña         | Perez          | marcos@jardineria.es |
   +-------------+----------------+----------------+----------------------+
   1 row in set (0.00 sec)
   ```
5. Devuelve un listado con el nombre, apellidos y puesto de aquellos empleados que no sean representantes de ventas.

   ```mysql
    SELECT
            e.nombre,
            e.apellido1,
            e.apellido2,
            p.puesto
        FROM
            empleado e
        JOIN
            puesto p ON e.puesto_id = p.id
        WHERE
            p.puesto != 'Representante de ventas';
   +-----------------+------------+-----------+-----------------------+
   | nombre          | apellido1  | apellido2 | puesto                |
   +-----------------+------------+-----------+-----------------------+
   | Marcos          | Magaña     | Perez     | Director General      |
   | Carlos          | Soria      | Jimenez   | Director General      |
   | Emmanuel        | Magaña     | Perez     | Director General      |
   | Francois        | Fignon     |           | Director General      |
   | Michael         | Bolton     |           | Director General      |
   | Hilary          | Washington |           | Director General      |
   | Nei             | Nishikori  |           | Director General      |
   | Amy             | Johnson    |           | Director General      |
   | Kevin           | Fallmer    |           | Director General      |
   | Ruben           | López      | Martinez  | Subdirector Marketing |
   | Alberto         | Soria      | Carrasco  | Subdirector Ventas    |
   | Maria           | Solís      | Jerez     | Secretaria            |
   | Felipe          | Rosas      | Marquez   | Representante Ventas  |
   | Juan Carlos     | Ortiz      | Serrano   | Representante Ventas  |
   | Mariano         | López      | Murcia    | Representante Ventas  |
   | Lucio           | Campoamor  | Martín    | Representante Ventas  |
   | Hilario         | Rodriguez  | Huertas   | Representante Ventas  |
   | José Manuel     | Martinez   | De la Osa | Representante Ventas  |
   | David           | Palma      | Aceituno  | Representante Ventas  |
   | Oscar           | Palma      | Aceituno  | Representante Ventas  |
   | Lionel          | Narvaez    |           | Representante Ventas  |
   | Laurent         | Serra      |           | Representante Ventas  |
   | Walter Santiago | Sanchez    | Lopez     | Representante Ventas  |
   | Marcus          | Paxton     |           | Representante Ventas  |
   | Lorena          | Paxton     |           | Representante Ventas  |
   | Narumi          | Riko       |           | Representante Ventas  |
   | Takuma          | Nomura     |           | Representante Ventas  |
   | Larry           | Westfalls  |           | Representante Ventas  |
   | John            | Walton     |           | Representante Ventas  |
   | Julian          | Bellinelli |           | Representante Ventas  |
   | Mariko          | Kishi      |           | Representante Ventas  |
   +-----------------+------------+-----------+-----------------------+
   31 rows in set (0.00 sec)

   ```
6. Devuelve un listado con el nombre de los todos los clientes españoles.

   ```mysql
    SELECT
            c.nombre
        FROM
            cliente c
        INNER JOIN
            direccion_cliente d ON c.id = d.cliente_id
        INNER JOIN
            pais p ON d.pais_id = p.id
        WHERE
            p.nombre = 'España';
   +--------------------------------+
   | nombre                         |
   +--------------------------------+
   | Lasas S.A.                     |
   | Beragua                        |
   | Club Golf Puerta del hierro    |
   | Naturagua                      |
   | DaraDistribuciones             |
   | Madrileña de riegos            |
   | Lasas S.A.                     |
   | Camunas Jardines S.L.          |
   | Dardena S.A.                   |
   | Jardin de Flores               |
   | Flores Marivi                  |
   | Flowers, S.A                   |
   | Naturajardin                   |
   | Golf S.A.                      |
   | Americh Golf Management SL     |
   | Aloha                          |
   | El Prat                        |
   | Sotogrande                     |
   | Vivero Humanes                 |
   | Fuenla City                    |
   | Jardines y Mansiones Cactus SL |
   | Jardinerías Matías SL          |
   | Agrojardin                     |
   | Top Campo                      |
   | Jardineria Sara                |
   | Campohermoso                   |
   | Flores S.L.                    |
   +--------------------------------+
   27 rows in set (0.01 sec)
   ```
7. Devuelve un listado con los distintos estados por los que puede pasar un pedido.

   ```mysql
   SELECT
            estado
        FROM
            estado_pedido;
   +-----------+
   | estado    |
   +-----------+
   | Entregado |
   | Rechazado |
   | Pendiente |
   +-----------+
   3 rows in set (0.00 sec)
   ```
8. Devuelve un listado con el código de cliente de aquellos clientes que realizaron algún pago en 2008. Tenga en cuenta que deberá eliminar aquellos códigos de cliente que aparezcan repetidos. Resuelva la consulta: • Utilizando la función YEAR de MySQL. • Utilizando la función DATE_FORMAT de MySQL. • Sin utilizar ninguna de las funciones anteriores.

   ```mysql
    • Utilizando la función YEAR de MySQL.
   SELECT DISTINCT cliente_id
   FROM pago
   WHERE YEAR(fecha_pago) = 2008;
   +------------+
   | cliente_id |
   +------------+
   |          1 |
   |         13 |
   |         14 |
   |         26 |
   +------------+
   4 rows in set (0.00 sec)
   • Utilizando la función DATE_FORMAT de MySQL.

   SELECT DISTINCT cliente_id
   FROM pago
   WHERE DATE_FORMAT(fecha_pago, '%Y') = '2008';

   +------------+
   | cliente_id |
   +------------+
   |          1 |
   |         13 |
   |         14 |
   |         26 |
   +------------+
   4 rows in set (0.00 sec)
   • Sin utilizar ninguna de las funciones anteriores.

   SELECT DISTINCT cliente_id
   FROM pago
   WHERE fecha_pago >= '2008-01-01' AND fecha_pago <= '2008-12-31';

   +------------+
   | cliente_id |
   +------------+
   |          1 |
   |         13 |
   |         14 |
   |         26 |
   +------------+
   4 rows in set (0.01 sec)
   ```
9. Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos que no han sido entregados a tiempo.

   ```mysql
   SELECT 
       p.id AS codigo_pedido,
       p.cliente_id AS codigo_cliente,
       p.fecha_esperada,
       p.fecha_entrega
   FROM 
       pedido p
   WHERE 
       p.fecha_entrega > p.fecha_esperada;
   +---------------+----------------+----------------+---------------+
   | codigo_pedido | codigo_cliente | fecha_esperada | fecha_entrega |
   +---------------+----------------+----------------+---------------+
   |             9 |              1 | 2008-12-27     | 2008-12-28    |
   |            13 |              7 | 2009-01-14     | 2009-01-15    |
   |            16 |              7 | 2009-01-07     | 2009-01-15    |
   |            17 |              7 | 2009-01-09     | 2009-01-11    |
   |            18 |              9 | 2009-01-06     | 2009-01-07    |
   |            22 |              1 | 2009-01-11     | 2009-01-13    |
   |            28 |              4 | 2009-02-17     | 2009-02-20    |
   |            31 |              5 | 2008-09-30     | 2008-10-04    |
   |            32 |              3 | 2007-01-19     | 2007-01-27    |
   |            38 |              5 | 2009-03-06     | 2009-03-07    |
   |            39 |              5 | 2009-03-07     | 2009-03-09    |
   |            40 |              5 | 2009-03-10     | 2009-03-13    |
   |            42 |             19 | 2009-03-23     | 2009-03-27    |
   |            43 |             23 | 2009-03-26     | 2009-03-28    |
   |            44 |             23 | 2009-03-27     | 2009-03-30    |
   |            45 |             23 | 2009-03-04     | 2009-03-07    |
   |            46 |             23 | 2009-03-04     | 2009-03-05    |
   |            49 |             26 | 2008-07-22     | 2008-07-30    |
   |            55 |             14 | 2009-01-10     | 2009-01-11    |
   |            60 |              1 | 2008-12-27     | 2008-12-28    |
   |            68 |              3 | 2009-02-17     | 2009-02-20    |
   |            92 |             27 | 2009-04-30     | 2009-05-03    |
   |            96 |             35 | 2008-04-12     | 2008-04-13    |
   |           103 |             30 | 2009-01-20     | 2009-01-24    |
   |           106 |             30 | 2009-05-15     | 2009-05-20    |
   |           112 |             36 | 2009-04-06     | 2009-05-07    |
   |           113 |             36 | 2008-11-09     | 2009-01-09    |
   |           114 |             36 | 2009-01-29     | 2009-01-31    |
   |           115 |             36 | 2009-01-26     | 2009-02-27    |
   |           123 |             30 | 2009-01-20     | 2009-01-24    |
   |           126 |             30 | 2009-05-15     | 2009-05-20    |
   |           128 |             38 | 2008-12-10     | 2008-12-29    |
   +---------------+----------------+----------------+---------------+
   32 rows in set (0.00 sec)
   ```
10. Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al menos dos días antes de la fecha esperada. • Utilizando la función ADDDATE de MySQL. • Utilizando la función DATEDIFF de MySQL. • ¿Sería posible resolver esta consulta utilizando el operador de suma + o resta -?

    ```mysql
    • Utilizando la función ADDDATE de MySQL.

    SELECT 
        id AS codigo_pedido,
        cliente_id AS codigo_cliente,
        fecha_esperada,
        fecha_entrega
    FROM 
        pedido
    WHERE 
        fecha_entrega IS NOT NULL 
        AND fecha_entrega < ADDDATE(fecha_esperada, -2);
    +---------------+----------------+----------------+---------------+
    | codigo_pedido | codigo_cliente | fecha_esperada | fecha_entrega |
    +---------------+----------------+----------------+---------------+
    |            24 |              1 | 2008-07-31     | 2008-07-25    |
    |            30 |              5 | 2008-09-03     | 2008-08-31    |
    |            36 |              1 | 2008-12-15     | 2008-12-10    |
    |            53 |             13 | 2008-11-15     | 2008-11-09    |
    |            89 |             35 | 2007-12-13     | 2007-12-10    |
    |            93 |             27 | 2009-05-30     | 2009-05-17    |
    +---------------+----------------+----------------+---------------+
    6 rows in set (0.01 sec)
    • Utilizando la función DATEDIFF de MySQL.

    SELECT 
        id AS codigo_pedido,
        cliente_id AS codigo_cliente,
        fecha_esperada,
        fecha_entrega
    FROM 
        pedido
    WHERE 
        fecha_entrega IS NOT NULL 
        AND DATEDIFF(fecha_esperada, fecha_entrega) >= 2;

    +---------------+----------------+----------------+---------------+
    | codigo_pedido | codigo_cliente | fecha_esperada | fecha_entrega |
    +---------------+----------------+----------------+---------------+
    |             2 |              5 | 2007-10-28     | 2007-10-26    |
    |            24 |              1 | 2008-07-31     | 2008-07-25    |
    |            30 |              5 | 2008-09-03     | 2008-08-31    |
    |            36 |              1 | 2008-12-15     | 2008-12-10    |
    |            53 |             13 | 2008-11-15     | 2008-11-09    |
    |            89 |             35 | 2007-12-13     | 2007-12-10    |
    |            91 |             27 | 2009-03-29     | 2009-03-27    |
    |            93 |             27 | 2009-05-30     | 2009-05-17    |
    +---------------+----------------+----------------+---------------+

    SELECT 
        id AS codigo_pedido,
        cliente_id AS codigo_cliente,
        fecha_esperada,
        fecha_entrega
    FROM 
        pedido
    WHERE 
        fecha_entrega IS NOT NULL 
        AND fecha_entrega < fecha_esperada - 2;
    +---------------+----------------+----------------+---------------+
    | codigo_pedido | codigo_cliente | fecha_esperada | fecha_entrega |
    +---------------+----------------+----------------+---------------+
    |            24 |              1 | 2008-07-31     | 2008-07-25    |
    |            30 |              5 | 2008-09-03     | 2008-08-31    |
    |            36 |              1 | 2008-12-15     | 2008-12-10    |
    |            53 |             13 | 2008-11-15     | 2008-11-09    |
    |            89 |             35 | 2007-12-13     | 2007-12-10    |
    |            93 |             27 | 2009-05-30     | 2009-05-17    |
    +---------------+----------------+----------------+---------------+
    6 rows in set (0.00 sec)
    ```
11. Devuelve un listado de todos los pedidos que fueron rechazados en 2009.

    ```mysql
    SELECT 
    	* 
    FROM 
    	pedido p 
    WHERE 
    	p.estado_pedido_id = 2 and year(fecha_pedido) = 2009;
    +-----+--------------+----------------+---------------+------------------+------------+--------------------------------------------------------------------------+
    | id  | fecha_pedido | fecha_esperada | fecha_entrega | estado_pedido_id | cliente_id | comentarios                                                              |
    +-----+--------------+----------------+---------------+------------------+------------+--------------------------------------------------------------------------+
    |  14 | 2009-01-02   | 2009-01-02     | NULL          |                2 |          7 | mal pago                                                                 |
    |  21 | 2009-01-09   | 2009-01-09     | 2009-01-09    |                2 |          9 | Mal pago                                                                 |
    |  25 | 2009-02-02   | 2009-02-08     | NULL          |                2 |          3 | El cliente carece de saldo en la cuenta asociada                         |
    |  26 | 2009-02-06   | 2009-02-12     | NULL          |                2 |          4 | El cliente anula la operación para adquirir más producto                 |
    |  40 | 2009-03-09   | 2009-03-10     | 2009-03-13    |                2 |          5 | NULL                                                                     |
    |  46 | 2009-04-03   | 2009-03-04     | 2009-03-05    |                2 |         23 | NULL                                                                     |
    |  65 | 2009-02-02   | 2009-02-08     | NULL          |                2 |          1 | El cliente carece de saldo en la cuenta asociada                         |
    |  66 | 2009-02-06   | 2009-02-12     | NULL          |                2 |          3 | El cliente anula la operacion para adquirir mas producto                 |
    |  74 | 2009-01-14   | 2009-01-22     | NULL          |                2 |         15 | El pedido no llego el dia que queria el cliente por fallo del transporte |
    |  81 | 2009-01-18   | 2009-01-24     | NULL          |                2 |         28 | Los producto estaban en mal estado                                       |
    | 101 | 2009-03-07   | 2009-03-27     | NULL          |                2 |         16 | El pedido fue rechazado por el cliente                                   |
    | 105 | 2009-02-14   | 2009-02-20     | NULL          |                2 |         30 | el producto ha sido rechazado por la pesima calidad                      |
    | 120 | 2009-03-07   | 2009-03-27     | NULL          |                2 |         16 | El pedido fue rechazado por el cliente                                   |
    | 125 | 2009-02-14   | 2009-02-20     | NULL          |                2 |         30 | el producto ha sido rechazado por la pesima calidad                      |
    +-----+--------------+----------------+---------------+------------------+------------+--------------------------------------------------------------------------+
    14 rows in set (0.01 sec)
    ```
12. Devuelve un listado de todos los pedidos que han sido entregados en el mes de enero de cualquier año.

    ```mysql
    SELECT 
    	* 
    FROM 
    	pedido
    WHERE 
    	month(fecha_entrega) = 1;
    +-----+--------------+----------------+---------------+------------------+------------+-----------------------------------------------------------+
    | id  | fecha_pedido | fecha_esperada | fecha_entrega | estado_pedido_id | cliente_id | comentarios                                               |
    +-----+--------------+----------------+---------------+------------------+------------+-----------------------------------------------------------+
    |   1 | 2006-01-17   | 2006-01-19     | 2006-01-19    |                1 |          5 | Pagado a plazos                                           |
    |  13 | 2009-01-12   | 2009-01-14     | 2009-01-15    |                1 |          7 | NULL                                                      |
    |  15 | 2009-01-09   | 2009-01-12     | 2009-01-11    |                1 |          7 | NULL                                                      |
    |  16 | 2009-01-06   | 2009-01-07     | 2009-01-15    |                1 |          7 | NULL                                                      |
    |  17 | 2009-01-08   | 2009-01-09     | 2009-01-11    |                1 |          7 | mal estado                                                |
    |  18 | 2009-01-05   | 2009-01-06     | 2009-01-07    |                1 |          9 | NULL                                                      |
    |  21 | 2009-01-09   | 2009-01-09     | 2009-01-09    |                2 |          9 | Mal pago                                                  |
    |  22 | 2009-01-11   | 2009-01-11     | 2009-01-13    |                1 |          1 | NULL                                                      |
    |  32 | 2007-01-07   | 2007-01-19     | 2007-01-27    |                1 |          3 | Entrega tardía, el cliente puso reclamación               |
    |  55 | 2008-12-10   | 2009-01-10     | 2009-01-11    |                1 |         14 | Retrasado 1 dia por problemas de transporte               |
    |  58 | 2009-01-24   | 2009-01-31     | 2009-01-30    |                1 |          3 | Todo correcto                                             |
    |  64 | 2009-01-24   | 2009-01-31     | 2009-01-30    |                1 |          1 | Todo correcto                                             |
    |  75 | 2009-01-11   | 2009-01-13     | 2009-01-13    |                1 |         15 | El pedido llego perfectamente                             |
    |  79 | 2009-01-12   | 2009-01-13     | 2009-01-13    |                1 |         28 | NULL                                                      |
    |  82 | 2009-01-20   | 2009-01-29     | 2009-01-29    |                1 |         28 | El pedido llego un poco mas tarde de la hora fijada       |
    |  95 | 2008-01-04   | 2008-01-19     | 2008-01-19    |                1 |         35 | NULL                                                      |
    | 100 | 2009-01-10   | 2009-01-15     | 2009-01-15    |                1 |         16 | El pedido llego perfectamente                             |
    | 102 | 2008-12-28   | 2009-01-08     | 2009-01-08    |                1 |         16 | Pago pendiente                                            |
    | 103 | 2009-01-15   | 2009-01-20     | 2009-01-24    |                3 |         30 | NULL                                                      |
    | 113 | 2008-10-28   | 2008-11-09     | 2009-01-09    |                2 |         36 | El producto ha sido rechazado por la tardanza de el envio |
    | 114 | 2009-01-15   | 2009-01-29     | 2009-01-31    |                1 |         36 | El envio llego dos dias más tarde debido al mal tiempo    |
    | 119 | 2009-01-10   | 2009-01-15     | 2009-01-15    |                1 |         16 | El pedido llego perfectamente                             |
    | 121 | 2008-12-28   | 2009-01-08     | 2009-01-08    |                1 |         16 | Pago pendiente                                            |
    | 123 | 2009-01-15   | 2009-01-20     | 2009-01-24    |                3 |         30 | NULL                                                      |
    +-----+--------------+----------------+---------------+------------------+------------+-----------------------------------------------------------+
    24 rows in set (0.01 sec)
    ```
13. Devuelve un listado con todos los pagos que se realizaron en el año 2008 mediante Paypal. Ordene el resultado de mayor a menor.

    ```mysql
    SELECT 
    	* 
    FROM 
    	pago 
    WHERE 
    	forma_pago_id = 1 AND YEAR(fecha_pago) = 2008 ORDER BY total DESC;
    +----+------------+---------------+--------------+------------+----------+
    | id | cliente_id | forma_pago_id | tipo_pago_id | fecha_pago | total    |
    +----+------------+---------------+--------------+------------+----------+
    | 21 |         26 |             1 |            1 | 2008-03-18 | 18846.00 |
    | 15 |         14 |             1 |            1 | 2008-07-15 |  4160.00 |
    | 14 |         13 |             1 |            1 | 2008-08-04 |  2246.00 |
    |  1 |          1 |             1 |            1 | 2008-11-10 |  2000.00 |
    |  2 |          1 |             1 |            1 | 2008-12-10 |  2000.00 |
    +----+------------+---------------+--------------+------------+----------+
    5 rows in set (0.00 sec)

    ```
14. Devuelve un listado con todas las formas de pago que aparecen en la tabla pago. Tenga en cuenta que no deben aparecer formas de pago repetidas.

    ```mysql
    SELECT
    	fp.forma
    FROM
    	forma_pago fp;
    +---------------+
    | forma         |
    +---------------+
    | PayPal        |
    | Transferencia |
    | Cheque        |
    +---------------+
    3 rows in set (0.01 sec)
    ```
15. Devuelve un listado con todos los productos que pertenecen a la gama Ornamentales y que tienen más de 100 unidades en stock. El listado deberá estar ordenado por su precio de venta, mostrando en primer lugar los de mayor precio.

    ```mysql
     SELECT
          p.nombre AS nombre_producto,
          p.cantidad_en_stock AS stock_disponible,
          p.dimensiones,
          p.descripcion,
          gp.nombre AS nombre_gama,
          pe.precio_venta
      FROM
          producto p
      JOIN
          precio pe ON pe.producto_id = p.id
      JOIN
          gama_producto gp ON p.gama_id = gp.id
      WHERE
         gp.nombre = 'Ornamentales' AND p.cantidad_en_stock > 100
      ORDER BY
          pe.precio_venta DESC;
    +-----------------+------------------+-------------+------------------------------+--------------+--------------+
    | nombre_producto | stock_disponible | dimensiones | descripcion                  | nombre_gama  | precio_venta |
    +-----------------+------------------+-------------+------------------------------+--------------+--------------+
    | Producto 243    |              125 | 29x48x4     | Descripción del producto 243 | Ornamentales |       147.67 |
    | Producto 2      |              189 | 7x43x45     | Descripción del producto 2   | Ornamentales |       147.58 |
    | Producto 231    |              193 | 16x2x11     | Descripción del producto 231 | Ornamentales |       143.84 |
    | Producto 213    |              142 | 16x6x30     | Descripción del producto 213 | Ornamentales |       140.37 |
    | Producto 114    |              151 | 46x31x15    | Descripción del producto 114 | Ornamentales |       136.63 |
    | Producto 45     |              155 | 9x4x39      | Descripción del producto 45  | Ornamentales |       135.28 |
    | Producto 227    |              119 | 33x24x19    | Descripción del producto 227 | Ornamentales |       131.19 |
    | Producto 96     |              178 | 49x49x48    | Descripción del producto 96  | Ornamentales |       130.87 |
    | Producto 222    |              132 | 18x9x41     | Descripción del producto 222 | Ornamentales |       127.11 |
    | Producto 256    |              165 | 4x18x29     | Descripción del producto 256 | Ornamentales |       125.18 |
    | Producto 221    |              147 | 25x23x40    | Descripción del producto 221 | Ornamentales |       124.60 |
    | Producto 5      |              174 | 18x3x10     | Descripción del producto 5   | Ornamentales |       122.86 |
    | Producto 129    |              140 | 49x17x36    | Descripción del producto 129 | Ornamentales |       109.94 |
    | Producto 81     |              151 | 25x30x25    | Descripción del producto 81  | Ornamentales |       109.05 |
    | Producto 41     |              110 | 11x4x37     | Descripción del producto 41  | Ornamentales |       107.39 |
    | Producto 48     |              180 | 39x22x42    | Descripción del producto 48  | Ornamentales |       103.23 |
    | Producto 113    |              151 | 10x11x24    | Descripción del producto 113 | Ornamentales |       100.58 |
    | Producto 185    |              190 | 4x39x33     | Descripción del producto 185 | Ornamentales |        99.97 |
    | Producto 132    |              116 | 31x6x39     | Descripción del producto 132 | Ornamentales |        98.75 |
    | Producto 201    |              155 | 2x10x43     | Descripción del producto 201 | Ornamentales |        97.92 |
    | Producto 246    |              160 | 8x19x19     | Descripción del producto 246 | Ornamentales |        92.75 |
    | Producto 181    |              117 | 6x40x28     | Descripción del producto 181 | Ornamentales |        92.35 |
    | Producto 29     |              152 | 13x24x31    | Descripción del producto 29  | Ornamentales |        89.83 |
    | Producto 137    |              198 | 40x48x19    | Descripción del producto 137 | Ornamentales |        82.43 |
    | Producto 239    |              146 | 18x7x31     | Descripción del producto 239 | Ornamentales |        72.94 |
    | Producto 177    |              164 | 7x45x5      | Descripción del producto 177 | Ornamentales |        66.87 |
    | Producto 111    |              111 | 11x6x48     | Descripción del producto 111 | Ornamentales |        65.32 |
    | Producto 202    |              149 | 34x25x22    | Descripción del producto 202 | Ornamentales |        55.81 |
    | Producto 130    |              172 | 24x41x33    | Descripción del producto 130 | Ornamentales |        54.63 |
    | Producto 3      |              157 | 2x12x5      | Descripción del producto 3   | Ornamentales |        42.08 |
    | Producto 264    |              144 | 21x12x43    | Descripción del producto 264 | Ornamentales |        39.41 |
    | Producto 204    |              146 | 34x27x33    | Descripción del producto 204 | Ornamentales |        39.36 |
    | Producto 80     |              114 | 35x32x4     | Descripción del producto 80  | Ornamentales |        38.38 |
    | Producto 95     |              189 | 7x43x46     | Descripción del producto 95  | Ornamentales |        29.08 |
    | Producto 175    |              104 | 9x50x24     | Descripción del producto 175 | Ornamentales |        20.13 |
    | Producto 28     |              167 | 22x10x34    | Descripción del producto 28  | Ornamentales |        19.90 |
    | Producto 33     |              159 | 9x4x40      | Descripción del producto 33  | Ornamentales |        17.05 |
    | Producto 93     |              135 | 28x47x4     | Descripción del producto 93  | Ornamentales |        15.28 |
    +-----------------+------------------+-------------+------------------------------+--------------+--------------+
    38 rows in set (0.02 sec)
    ```
16. Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y cuyo representante de ventas tenga el código de empleado 11 o 30.

    ```
     SELECT
          c.*,
          e.id as codigo_empleado
      FROM
          cliente c
      INNER JOIN
          direccion_cliente dc ON dc.cliente_id = c.id
      INNER JOIN
           empleado e ON e.id = c.empleado_id
      WHERE
           dc.ciudad_id = 4
           AND (e.id = 11 OR e.id = 30);
    +----+-----------------------------+-------------+-------------+----------------+-----------------+
    | id | nombre                      | contacto_id | empleado_id | limite_credito | codigo_empleado |
    +----+-----------------------------+-------------+-------------+----------------+-----------------+
    |  7 | Beragua                     |           6 |          11 |       20000.00 |              11 |
    |  8 | Club Golf Puerta del hierro |           7 |          11 |       40000.00 |              11 |
    |  9 | Naturagua                   |           8 |          11 |       32000.00 |              11 |
    | 10 | DaraDistribuciones          |           9 |          11 |       50000.00 |              11 |
    | 11 | Madrileña de riegos         |          10 |          11 |       20000.00 |              11 |
    | 15 | Jardin de Flores            |          13 |          30 |       40000.00 |              30 |
    | 18 | Naturajardin                |          16 |          30 |        5050.00 |              30 |
    | 24 | Vivero Humanes              |          22 |          30 |        7430.00 |              30 |
    | 28 | Agrojardin                  |          26 |          30 |        8040.00 |              30 |
    | 31 | Campohermoso                |          29 |          30 |        3250.00 |              30 |
    +----+-----------------------------+-------------+-------------+----------------+-----------------+
    10 rows in set (0.01 sec)
    ```

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
    SELECT
        c.nombre AS nombre_cliente,
        e.nombre AS nombre_representante,
        e.apellido1 AS apellido_representante,
        e.apellido2 AS apellido_representante
    FROM
        cliente c
    LEFT JOIN
        pago p ON c.id = p.cliente_id
    INNER JOIN
        empleado e ON c.empleado_id = e.id
    WHERE
        p.id IS NULL;
    +-----------------------------+----------------------+------------------------+------------------------+
    | nombre_cliente              | nombre_representante | apellido_representante | apellido_representante |
    +-----------------------------+----------------------+------------------------+------------------------+
    | Gardening Competitor        | Walter Santiago      | Sanchez                | Lopez                  |
    | Lasas S.A.                  | Mariano              | López                  | Murcia                 |
    | Club Golf Puerta del hierro | Emmanuel             | Magaña                 | Perez                  |
    | DaraDistribuciones          | Emmanuel             | Magaña                 | Perez                  |
    | Madrileña de riegos         | Emmanuel             | Magaña                 | Perez                  |
    | Lasas S.A.                  | Mariano              | López                  | Murcia                 |
    | Flowers, S.A                | Felipe               | Rosas                  | Marquez                |
    | Naturajardin                | Julian               | Bellinelli             |                        |
    | Americh Golf Management SL  | José Manuel          | Martinez               | De la Osa              |
    | Aloha                       | José Manuel          | Martinez               | De la Osa              |
    | El Prat                     | José Manuel          | Martinez               | De la Osa              |
    | Vivero Humanes              | Julian               | Bellinelli             |                        |
    | Fuenla City                 | Felipe               | Rosas                  | Marquez                |
    | Top Campo                   | Felipe               | Rosas                  | Marquez                |
    | Campohermoso                | Julian               | Bellinelli             |                        |
    | france telecom              | Lionel               | Narvaez                |                        |
    | Musée du Louvre             | Lionel               | Narvaez                |                        |
    | Flores S.L.                 | Michael              | Bolton                 |                        |
    | The Magic Garden            | Michael              | Bolton                 |                        |
    +-----------------------------+----------------------+------------------------+------------------------+
    19 rows in set (0.00 sec)
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

    ```mysql
    SELECT
    	COUNT(empleado.id) AS total_empleados
    FROM
    	empleado;
    +-----------------+
    | total_empleados |
    +-----------------+
    |              31 |
    +-----------------+
    1 row in set (0.01 sec)
    ```
19. ¿Cuántos clientes tiene cada país?

    ```mysql
     SELECT
           p.nombre AS pais,
           COUNT(c.id) AS total_clientes
      FROM
           cliente c
      INNER JOIN
           direccion_cliente dc ON dc.cliente_id = c.id
      INNER JOIN
           pais p ON p.id = dc.pais_id
       GROUP BY
           p.nombre;
    +------------+----------------+
    | pais       | total_clientes |
    +------------+----------------+
    | España     |             27 |
    | EEUU       |              5 |
    | Inglaterra |              1 |
    | Francia    |              2 |
    | Australia  |              2 |
    +------------+----------------+
    5 rows in set (0.01 sec)
    ```
20. ¿Cuál fue el pago medio en 2009?

    ```mysql
     SELECT AVG(total) AS pago_medio_2009
     FROM pago
     WHERE YEAR(fecha_pago) = 2009;
    +-----------------+
    | pago_medio_2009 |
    +-----------------+
    |     4504.076923 |
    +-----------------+
    1 row in set (0.00 sec)
    ```
21. ¿Cuántos pedidos hay en cada estado? Ordena el resultado de forma descendente por el número de pedidos.

    ```mysql
      SELECT
           ep.estado AS estado_pedido,
            COUNT(p.id) AS numero_pedidos
      FROM
          pedido p
      INNER JOIN
          estado_pedido ep ON p.estado_pedido_id = ep.id
      GROUP BY
          ep.estado
      ORDER BY
          numero_pedidos DESC;
    +---------------+----------------+
    | estado_pedido | numero_pedidos |
    +---------------+----------------+
    | Entregado     |             61 |
    | Pendiente     |             30 |
    | Rechazado     |             24 |
    +---------------+----------------+
    3 rows in set (0.01 sec)
    ```
22. Calcula el precio de venta del producto más caro y más barato en una misma consulta.

    ```mysql
    SELECT
       MAX(precio_venta) AS precio_maximo,
       MIN(precio_venta) AS precio_minimo
     FROM
       precio;
    +---------------+---------------+
    | precio_maximo | precio_minimo |
    +---------------+---------------+
    |        149.07 |          1.43 |
    +---------------+---------------+
    1 row in set (0.00 sec)
    ```
23. Calcula el número de clientes que tiene la empresa.

    ```mysql
    SELECT
    	COUNT(cl.id) AS total_clientes
    FROM
    	cliente cl;
    +----------------+
    | total_clientes |
    +----------------+
    |             37 |
    +----------------+
    1 row in set (0.00 sec)
    ```
24. ¿Cuántos clientes existen con domicilio en la ciudad de Madrid?

    ```mysql
    SELECT COUNT(*) AS numero_clientes_en_madrid
    FROM 
    	cliente c
    INNER JOIN 
    	direccion_cliente dc ON c.id = dc.cliente_id
    INNER JOIN 
    	ciudad ci ON dc.ciudad_id = ci.id
    WHERE 
    	ci.nombre = 'Madrid';
    +---------------------------+
    | numero_clientes_en_madrid |
    +---------------------------+
    |                        24 |
    +---------------------------+
    ```
25. ¿Calcula cuántos clientes tiene cada una de las ciudades que empiezan por M?

    ```mysql
     SELECT ci.nombre AS nombre_ciudad, COUNT(c.id) AS total_clientes
     FROM cliente c
     INNER JOIN direccion_cliente dc ON c.id = dc.cliente_id
     INNER JOIN ciudad ci ON dc.ciudad_id = ci.id
     WHERE ci.nombre LIKE 'M%'
     GROUP BY ci.nombre;
    +---------------+----------------+
    | nombre_ciudad | total_clientes |
    +---------------+----------------+
    | Madrid        |             24 |
    +---------------+----------------+
    1 row in set (0.01 sec)
    ```
26. Devuelve el nombre de los representantes de ventas y el número de clientes al que atiende cada uno.

    ```mysql
     SELECT
         e.nombre AS nombre_representante,
         COUNT(c.id) AS numero_clientes_atendidos
     FROM
         empleado e
     LEFT JOIN
         cliente c ON e.id = c.empleado_id
     GROUP BY
         e.nombre;
    +----------------------+---------------------------+
    | nombre_representante | numero_clientes_atendidos |
    +----------------------+---------------------------+
    | Marcos               |                         0 |
    | Ruben                |                         0 |
    | Alberto              |                         0 |
    | Maria                |                         0 |
    | Felipe               |                         5 |
    | Juan Carlos          |                         0 |
    | Carlos               |                         0 |
    | Mariano              |                         4 |
    | Lucio                |                         2 |
    | Hilario              |                         0 |
    | Emmanuel             |                         5 |
    | José Manuel          |                         5 |
    | David                |                         0 |
    | Oscar                |                         0 |
    | Francois             |                         0 |
    | Lionel               |                         2 |
    | Laurent              |                         0 |
    | Michael              |                         2 |
    | Walter Santiago      |                         3 |
    | Hilary               |                         0 |
    | Marcus               |                         0 |
    | Lorena               |                         2 |
    | Nei                  |                         0 |
    | Narumi               |                         0 |
    | Takuma               |                         0 |
    | Amy                  |                         0 |
    | Larry                |                         0 |
    | John                 |                         0 |
    | Kevin                |                         0 |
    | Julian               |                         5 |
    | Mariko               |                         2 |
    +----------------------+---------------------------+
    31 rows in set (0.00 sec)
    ```
27. Calcula el número de clientes que no tiene asignado representante de ventas.

    ```mysql
     SELECT COUNT(*) AS clientes_sin_representante
     FROM cliente
     WHERE empleado_id IS NULL;
     +----------------------------+
    | clientes_sin_representante |
    +----------------------------+
    |                          0 |
    +----------------------------+
    1 row in set (0.00 sec)
    -- Es 0 porque cada cliente en esta base de datos tiene un representante de ventas
    ```
28. Calcula la fecha del primer y último pago realizado por cada uno de los clientes. El listado deberá mostrar el nombre y los apellidos de cada cliente.

    ```mysql
     SELECT
         c.nombre,
         MIN(p.fecha_pago) AS primera_fecha_pago,
         MAX(p.fecha_pago) AS ultima_fecha_pago
     FROM
         cliente c
     LEFT JOIN
         pago p ON c.id = p.cliente_id
     GROUP BY
         c.id, c.nombre;

    +--------------------------------+--------------------+-------------------+
    | nombre                         | primera_fecha_pago | ultima_fecha_pago |
    +--------------------------------+--------------------+-------------------+
    | GoldFish Garden                | 2008-11-10         | 2008-12-10        |
    | Gardening Competitor           | NULL               | NULL              |
    | Gardening Associates           | 2009-01-16         | 2009-02-19        |
    | Gerudo Valley                  | 2007-01-08         | 2007-01-08        |
    | Tendo Garden                   | 2006-01-18         | 2006-01-18        |
    | Lasas S.A.                     | NULL               | NULL              |
    | Beragua                        | 2009-01-13         | 2009-01-13        |
    | Club Golf Puerta del hierro    | NULL               | NULL              |
    | Naturagua                      | 2009-01-06         | 2009-01-06        |
    | DaraDistribuciones             | NULL               | NULL              |
    | Madrileña de riegos            | NULL               | NULL              |
    | Lasas S.A.                     | NULL               | NULL              |
    | Camunas Jardines S.L.          | 2008-08-04         | 2008-08-04        |
    | Dardena S.A.                   | 2008-07-15         | 2008-07-15        |
    | Jardin de Flores               | 2009-01-15         | 2009-02-15        |
    | Flores Marivi                  | 2009-02-16         | 2009-02-16        |
    | Flowers, S.A                   | NULL               | NULL              |
    | Naturajardin                   | NULL               | NULL              |
    | Golf S.A.                      | 2009-03-06         | 2009-03-06        |
    | Americh Golf Management SL     | NULL               | NULL              |
    | Aloha                          | NULL               | NULL              |
    | El Prat                        | NULL               | NULL              |
    | Sotogrande                     | 2009-03-26         | 2009-03-26        |
    | Vivero Humanes                 | NULL               | NULL              |
    | Fuenla City                    | NULL               | NULL              |
    | Jardines y Mansiones Cactus SL | 2008-03-18         | 2008-03-18        |
    | Jardinerías Matías SL          | 2009-02-08         | 2009-02-08        |
    | Agrojardin                     | 2009-01-13         | 2009-01-13        |
    | Top Campo                      | NULL               | NULL              |
    | Jardineria Sara                | 2009-01-16         | 2009-01-16        |
    | Campohermoso                   | NULL               | NULL              |
    | france telecom                 | NULL               | NULL              |
    | Musée du Louvre                | NULL               | NULL              |
    | Tutifruti S.A                  | 2007-10-06         | 2007-10-06        |
    | Flores S.L.                    | NULL               | NULL              |
    | The Magic Garden               | NULL               | NULL              |
    | El Jardin Viviente S.L         | 2006-05-26         | 2006-05-26        |
    +--------------------------------+--------------------+-------------------+
    37 rows in set (0.00 sec)
    ```
29. Calcula el número de productos diferentes que hay en cada uno de los pedidos.

    ```mysql
     SELECT
         pedido_id,
         COUNT(DISTINCT producto_id) AS num_productos_diferentes
     FROM
        detalle_pedido
     GROUP BY
         pedido_id;
    +-----------+--------------------------+
    | pedido_id | num_productos_diferentes |
    +-----------+--------------------------+
    |         3 |                        4 |
    |         8 |                        4 |
    |         9 |                        4 |
    |        13 |                        4 |
    |        15 |                        4 |
    |        16 |                        4 |
    |        17 |                        4 |
    |        18 |                        4 |
    |        22 |                        4 |
    |        24 |                        4 |
    |        27 |                        4 |
    |        28 |                        4 |
    |        30 |                        4 |
    |        32 |                        4 |
    |        34 |                        4 |
    |        36 |                        4 |
    |        38 |                        4 |
    |        41 |                        4 |
    |        42 |                        4 |
    |        45 |                        4 |
    |        47 |                        4 |
    |        48 |                        4 |
    |        49 |                        4 |
    |        51 |                        4 |
    |        53 |                        4 |
    |        55 |                        4 |
    |        58 |                        4 |
    |        59 |                        4 |
    |        60 |                        4 |
    |        64 |                        4 |
    |        67 |                        4 |
    |        68 |                        4 |
    |        75 |                        4 |
    |        76 |                        4 |
    |        78 |                        4 |
    |        79 |                        4 |
    |        82 |                        4 |
    |        83 |                        4 |
    |        89 |                        4 |
    |        91 |                        4 |
    |        92 |                        4 |
    |        93 |                        4 |
    |        95 |                        4 |
    |        96 |                        4 |
    |        97 |                        4 |
    |       100 |                        4 |
    |       102 |                        4 |
    |       104 |                        4 |
    |       107 |                        4 |
    |       108 |                        4 |
    |       109 |                        4 |
    |       110 |                        4 |
    |       111 |                        4 |
    |       114 |                        4 |
    |       116 |                        4 |
    |       119 |                        4 |
    |       121 |                        4 |
    |       122 |                        4 |
    |       124 |                        4 |
    |       127 |                        4 |
    +-----------+--------------------------+
    60 rows in set (0.02 sec)
    ```
30. Calcula la suma de la cantidad total de todos los productos que aparecen en cada uno de los pedidos.

    ```mysql
    SELECT
         pedido_id,
         SUM(cantidad) AS cantidad_total
     FROM
         detalle_pedido
     GROUP BY
        pedido_id;
    +-----------+----------------+
    | pedido_id | cantidad_total |
    +-----------+----------------+
    |         3 |             26 |
    |         8 |             23 |
    |         9 |             26 |
    |        13 |             28 |
    |        15 |             29 |
    |        16 |             23 |
    |        17 |             20 |
    |        18 |             15 |
    |        22 |             30 |
    |        24 |             22 |
    |        27 |             19 |
    |        28 |             24 |
    |        30 |             25 |
    |        32 |             21 |
    |        34 |             24 |
    |        36 |             28 |
    |        38 |             26 |
    |        41 |             17 |
    |        42 |             26 |
    |        45 |             24 |
    |        47 |             33 |
    |        48 |             21 |
    |        49 |             27 |
    |        51 |             31 |
    |        53 |             20 |
    |        55 |             26 |
    |        58 |             28 |
    |        59 |             26 |
    |        60 |             22 |
    |        64 |             25 |
    |        67 |             31 |
    |        68 |             19 |
    |        75 |             24 |
    |        76 |             24 |
    |        78 |             22 |
    |        79 |             25 |
    |        82 |             22 |
    |        83 |             25 |
    |        89 |             25 |
    |        91 |             17 |
    |        92 |             25 |
    |        93 |             21 |
    |        95 |             20 |
    |        96 |             19 |
    |        97 |             29 |
    |       100 |             35 |
    |       102 |             30 |
    |       104 |             27 |
    |       107 |             30 |
    |       108 |             28 |
    |       109 |             26 |
    |       110 |             25 |
    |       111 |             21 |
    |       114 |             29 |
    |       116 |             25 |
    |       119 |             29 |
    |       121 |             17 |
    |       122 |             24 |
    |       124 |             23 |
    |       127 |             22 |
    +-----------+----------------+
    60 rows in set (0.01 sec)
    ```
31. Devuelve un listado de los 20 productos más vendidos y el número total de unidades que se han vendido de cada uno. El listado deberá estar ordenado por el número total de unidades vendidas.

    ```mysql
     SELECT
         p.id AS id_producto,
         p.nombre AS nombre_producto,
         SUM(dp.cantidad) AS total_unidades_vendidas
     FROM
        detalle_pedido dp
     INNER JOIN
         producto p ON dp.producto_id = p.id
     GROUP BY
         p.id, p.nombre
     ORDER BY
         total_unidades_vendidas DESC
     LIMIT
         20;
    | id_producto | nombre_producto | total_unidades_vendidas |
    +-------------+-----------------+-------------------------+
    |          90 | Producto 90     |                      11 |
    |          77 | Producto 77     |                      11 |
    |          56 | Producto 56     |                      11 |
    |         180 | Producto 180    |                      11 |
    |          88 | Producto 88     |                      11 |
    |          64 | Producto 64     |                      11 |
    |         185 | Producto 185    |                      11 |
    |          12 | Producto 12     |                      11 |
    |         193 | Producto 193    |                      11 |
    |          15 | Producto 15     |                      11 |
    |         238 | Producto 238    |                      11 |
    |         118 | Producto 118    |                      11 |
    |         117 | Producto 117    |                      11 |
    |          20 | Producto 20     |                      11 |
    |          73 | Producto 73     |                      11 |
    |           3 | Producto 3      |                      10 |
    |         139 | Producto 139    |                      10 |
    |           6 | Producto 6      |                      10 |
    |          31 | Producto 31     |                      10 |
    |          32 | Producto 32     |                      10 |
    +-------------+-----------------+-------------------------+
    20 rows in set (0.01 sec)
    ```
32. La facturación que ha tenido la empresa en toda la historia, indicando la base imponible, el IVA y el total facturado. La base imponible se calcula sumando el coste del producto por el número de unidades vendidas de la tabla detalle_pedido. El IVA es el 21 % de la base imponible, y el total la suma de los dos campos anteriores.

    ```mysql
     SELECT
         SUM(dp.cantidad * pr.precio_venta) AS base_imponible,
         SUM(dp.cantidad * pr.precio_venta) * 0.21 AS iva,
         SUM(dp.cantidad * pr.precio_venta) + (SUM(dp.cantidad * pr.precio_venta) * 0.21) AS total_facturado
     FROM
         detalle_pedido dp
     INNER JOIN
         producto p ON dp.producto_id = p.id
     INNER JOIN
        precio pr ON p.id = pr.producto_id;
    +----------------+------------+-----------------+
    | base_imponible | iva        | total_facturado |
    +----------------+------------+-----------------+
    |      116073.97 | 24375.5337 |     140449.5037 |
    +----------------+------------+-----------------+
    1 row in set (0.01 sec)
    ```
33. La misma información que en la pregunta anterior, pero agrupada por código de producto.

    ```mysql
     SELECT
         dp.producto_id,
         SUM(dp.cantidad * pr.precio_venta) AS base_imponible,
         SUM(dp.cantidad * pr.precio_venta) * 0.21 AS iva,
         SUM(dp.cantidad * pr.precio_venta) + (SUM(dp.cantidad * pr.precio_venta) * 0.21) AS total_facturado
     FROM
         detalle_pedido dp
     INNER JOIN
         producto p ON dp.producto_id = p.id
     INNER JOIN
         precio pr ON p.id = pr.producto_id
     GROUP BY
        dp.producto_id;
     +-------------+----------------+----------+-----------------+
    | producto_id | base_imponible | iva      | total_facturado |
    +-------------+----------------+----------+-----------------+
    |           1 |         666.99 | 140.0679 |        807.0579 |
    |           2 |         295.16 |  61.9836 |        357.1436 |
    |           3 |         420.80 |  88.3680 |        509.1680 |
    |           4 |         116.48 |  24.4608 |        140.9408 |
    |           5 |        1105.74 | 232.2054 |       1337.9454 |
    |           6 |         132.50 |  27.8250 |        160.3250 |
    |           7 |          30.90 |   6.4890 |         37.3890 |
    |           8 |          71.34 |  14.9814 |         86.3214 |
    |           9 |         526.50 | 110.5650 |        637.0650 |
    |          10 |         489.52 | 102.7992 |        592.3192 |
    |          11 |         197.52 |  41.4792 |        238.9992 |
    |          12 |        1048.85 | 220.2585 |       1269.1085 |
    |          13 |          72.56 |  15.2376 |         87.7976 |
    |          14 |         367.00 |  77.0700 |        444.0700 |
    |          15 |         334.51 |  70.2471 |        404.7571 |
    |          16 |         515.07 | 108.1647 |        623.2347 |
    |          17 |         119.24 |  25.0404 |        144.2804 |
    |          18 |          12.73 |   2.6733 |         15.4033 |
    |          19 |        1290.06 | 270.9126 |       1560.9726 |
    |          20 |         735.68 | 154.4928 |        890.1728 |
    |          21 |         603.00 | 126.6300 |        729.6300 |
    |          22 |         165.84 |  34.8264 |        200.6664 |
    |          23 |         561.72 | 117.9612 |        679.6812 |
    |          24 |         357.35 |  75.0435 |        432.3935 |
    |          25 |         432.06 |  90.7326 |        522.7926 |
    |          26 |          32.86 |   6.9006 |         39.7606 |
    |          27 |         384.84 |  80.8164 |        465.6564 |
    |          28 |          99.50 |  20.8950 |        120.3950 |
    |          29 |         538.98 | 113.1858 |        652.1658 |
    |          30 |         114.84 |  24.1164 |        138.9564 |
    |          31 |         259.30 |  54.4530 |        313.7530 |
    |          32 |         763.90 | 160.4190 |        924.3190 |
    |          33 |         102.30 |  21.4830 |        123.7830 |
    |          34 |         595.76 | 125.1096 |        720.8696 |
    |          35 |         120.80 |  25.3680 |        146.1680 |
    |          36 |         127.92 |  26.8632 |        154.7832 |
    |          37 |           2.86 |   0.6006 |          3.4606 |
    |          38 |         124.41 |  26.1261 |        150.5361 |
    |          39 |        1069.70 | 224.6370 |       1294.3370 |
    |          40 |          58.44 |  12.2724 |         70.7124 |
    |          41 |         966.51 | 202.9671 |       1169.4771 |
    |          42 |          33.10 |   6.9510 |         40.0510 |
    |          43 |         354.64 |  74.4744 |        429.1144 |
    |          44 |          57.18 |  12.0078 |         69.1878 |
    |          45 |         946.96 | 198.8616 |       1145.8216 |
    |          46 |         483.42 | 101.5182 |        584.9382 |
    |          47 |         171.34 |  35.9814 |        207.3214 |
    |          48 |         929.07 | 195.1047 |       1124.1747 |
    |          49 |         829.56 | 174.2076 |       1003.7676 |
    |          50 |         199.32 |  41.8572 |        241.1772 |
    |          51 |        1263.69 | 265.3749 |       1529.0649 |
    |          52 |         248.72 |  52.2312 |        300.9512 |
    |          53 |         188.60 |  39.6060 |        228.2060 |
    |          54 |         262.72 |  55.1712 |        317.8912 |
    |          55 |         348.00 |  73.0800 |        421.0800 |
    |          56 |        1388.53 | 291.5913 |       1680.1213 |
    |          57 |        1116.63 | 234.4923 |       1351.1223 |
    |          58 |          20.22 |   4.2462 |         24.4662 |
    |          59 |          32.76 |   6.8796 |         39.6396 |
    |          60 |         244.17 |  51.2757 |        295.4457 |
    |          61 |         160.56 |  33.7176 |        194.2776 |
    |          62 |         318.96 |  66.9816 |        385.9416 |
    |          63 |         786.84 | 165.2364 |        952.0764 |
    |          64 |         393.91 |  82.7211 |        476.6311 |
    |          65 |         435.35 |  91.4235 |        526.7735 |
    |          66 |        1179.90 | 247.7790 |       1427.6790 |
    |          67 |         118.50 |  24.8850 |        143.3850 |
    |          68 |          85.94 |  18.0474 |        103.9874 |
    |          69 |         380.48 |  79.9008 |        460.3808 |
    |          70 |         848.40 | 178.1640 |       1026.5640 |
    |          71 |         699.84 | 146.9664 |        846.8064 |
    |          72 |         159.30 |  33.4530 |        192.7530 |
    |          73 |         655.16 | 137.5836 |        792.7436 |
    |          74 |         970.47 | 203.7987 |       1174.2687 |
    |          75 |          27.54 |   5.7834 |         33.3234 |
    |          76 |          54.22 |  11.3862 |         65.6062 |
    |          77 |         924.99 | 194.2479 |       1119.2379 |
    |          78 |          30.40 |   6.3840 |         36.7840 |
    |          79 |         308.10 |  64.7010 |        372.8010 |
    |          80 |         307.04 |  64.4784 |        371.5184 |
    |          81 |         872.40 | 183.2040 |       1055.6040 |
    |          82 |         314.44 |  66.0324 |        380.4724 |
    |          83 |         280.55 |  58.9155 |        339.4655 |
    |          84 |         206.72 |  43.4112 |        250.1312 |
    |          85 |          83.76 |  17.5896 |        101.3496 |
    |          86 |         435.84 |  91.5264 |        527.3664 |
    |          87 |         838.68 | 176.1228 |       1014.8028 |
    |          88 |         616.99 | 129.5679 |        746.5579 |
    |          89 |         483.50 | 101.5350 |        585.0350 |
    |          90 |        1446.50 | 303.7650 |       1750.2650 |
    |          91 |        1292.00 | 271.3200 |       1563.3200 |
    |          92 |         351.60 |  73.8360 |        425.4360 |
    |          93 |          61.12 |  12.8352 |         73.9552 |
    |          94 |         477.55 | 100.2855 |        577.8355 |
    |          95 |          87.24 |  18.3204 |        105.5604 |
    |          96 |        1046.96 | 219.8616 |       1266.8216 |
    |          97 |        1038.40 | 218.0640 |       1256.4640 |
    |          98 |         524.94 | 110.2374 |        635.1774 |
    |          99 |         189.95 |  39.8895 |        229.8395 |
    |         100 |         521.43 | 109.5003 |        630.9303 |
    |         101 |         150.22 |  31.5462 |        181.7662 |
    |         102 |         104.92 |  22.0332 |        126.9532 |
    |         103 |        1177.52 | 247.2792 |       1424.7992 |
    |         104 |         167.31 |  35.1351 |        202.4451 |
    |         105 |         437.78 |  91.9338 |        529.7138 |
    |         106 |        1179.80 | 247.7580 |       1427.5580 |
    |         107 |         153.80 |  32.2980 |        186.0980 |
    |         108 |         438.52 |  92.0892 |        530.6092 |
    |         109 |          27.24 |   5.7204 |         32.9604 |
    |         110 |         283.80 |  59.5980 |        343.3980 |
    |         111 |         522.56 | 109.7376 |        632.2976 |
    |         112 |        1025.50 | 215.3550 |       1240.8550 |
    |         113 |        1005.80 | 211.2180 |       1217.0180 |
    |         114 |        1229.67 | 258.2307 |       1487.9007 |
    |         115 |          85.44 |  17.9424 |        103.3824 |
    |         116 |          80.08 |  16.8168 |         96.8968 |
    |         117 |        1494.57 | 313.8597 |       1808.4297 |
    |         118 |          91.19 |  19.1499 |        110.3399 |
    |         119 |         235.30 |  49.4130 |        284.7130 |
    |         120 |         460.11 |  96.6231 |        556.7331 |
    |         121 |         224.77 |  47.2017 |        271.9717 |
    |         122 |          28.53 |   5.9913 |         34.5213 |
    |         123 |         158.50 |  33.2850 |        191.7850 |
    |         124 |         242.92 |  51.0132 |        293.9332 |
    |         125 |         687.18 | 144.3078 |        831.4878 |
    |         126 |         391.32 |  82.1772 |        473.4972 |
    |         127 |         878.67 | 184.5207 |       1063.1907 |
    |         128 |         456.18 |  95.7978 |        551.9778 |
    |         129 |         989.46 | 207.7866 |       1197.2466 |
    |         130 |         437.04 |  91.7784 |        528.8184 |
    |         131 |          78.78 |  16.5438 |         95.3238 |
    |         132 |         493.75 | 103.6875 |        597.4375 |
    |         133 |         137.10 |  28.7910 |        165.8910 |
    |         134 |         661.65 | 138.9465 |        800.5965 |
    |         135 |         387.66 |  81.4086 |        469.0686 |
    |         136 |         137.85 |  28.9485 |        166.7985 |
    |         137 |         577.01 | 121.1721 |        698.1821 |
    |         138 |         702.42 | 147.5082 |        849.9282 |
    |         139 |        1323.50 | 277.9350 |       1601.4350 |
    |         140 |         222.28 |  46.6788 |        268.9588 |
    |         141 |         140.48 |  29.5008 |        169.9808 |
    |         142 |         277.52 |  58.2792 |        335.7992 |
    |         143 |         648.84 | 136.2564 |        785.0964 |
    |         144 |         321.24 |  67.4604 |        388.7004 |
    |         145 |         386.08 |  81.0768 |        467.1568 |
    |         146 |         236.28 |  49.6188 |        285.8988 |
    |         147 |         957.50 | 201.0750 |       1158.5750 |
    |         148 |         606.76 | 127.4196 |        734.1796 |
    |         149 |          62.10 |  13.0410 |         75.1410 |
    |         150 |         889.65 | 186.8265 |       1076.4765 |
    |         151 |         697.97 | 146.5737 |        844.5437 |
    |         152 |         713.51 | 149.8371 |        863.3471 |
    |         153 |         408.72 |  85.8312 |        494.5512 |
    |         154 |          69.63 |  14.6223 |         84.2523 |
    |         155 |         299.46 |  62.8866 |        362.3466 |
    |         156 |         317.84 |  66.7464 |        384.5864 |
    |         157 |        1164.24 | 244.4904 |       1408.7304 |
    |         158 |          57.80 |  12.1380 |         69.9380 |
    |         159 |        1182.32 | 248.2872 |       1430.6072 |
    |         160 |         679.50 | 142.6950 |        822.1950 |
    |         161 |         511.10 | 107.3310 |        618.4310 |
    |         162 |         184.85 |  38.8185 |        223.6685 |
    |         163 |         168.76 |  35.4396 |        204.1996 |
    |         164 |         277.76 |  58.3296 |        336.0896 |
    |         165 |         207.90 |  43.6590 |        251.5590 |
    |         166 |        1341.63 | 281.7423 |       1623.3723 |
    |         167 |         599.10 | 125.8110 |        724.9110 |
    |         168 |         298.41 |  62.6661 |        361.0761 |
    |         169 |         353.32 |  74.1972 |        427.5172 |
    |         170 |          58.20 |  12.2220 |         70.4220 |
    |         171 |         328.16 |  68.9136 |        397.0736 |
    |         172 |         143.16 |  30.0636 |        173.2236 |
    |         173 |         200.88 |  42.1848 |        243.0648 |
    |         174 |         359.17 |  75.4257 |        434.5957 |
    |         175 |         120.78 |  25.3638 |        146.1438 |
    |         176 |         424.06 |  89.0526 |        513.1126 |
    |         177 |         401.22 |  84.2562 |        485.4762 |
    |         178 |        1202.80 | 252.5880 |       1455.3880 |
    |         179 |         284.00 |  59.6400 |        343.6400 |
    |         180 |         329.89 |  69.2769 |        399.1669 |
    |         181 |         831.15 | 174.5415 |       1005.6915 |
    |         182 |         538.64 | 113.1144 |        651.7544 |
    |         183 |         634.64 | 133.2744 |        767.9144 |
    |         184 |        1236.78 | 259.7238 |       1496.5038 |
    |         185 |        1099.67 | 230.9307 |       1330.6007 |
    |         186 |         345.66 |  72.5886 |        418.2486 |
    |         187 |         184.05 |  38.6505 |        222.7005 |
    |         188 |         114.30 |  24.0030 |        138.3030 |
    |         189 |         847.35 | 177.9435 |       1025.2935 |
    |         190 |         168.28 |  35.3388 |        203.6188 |
    |         191 |        1316.34 | 276.4314 |       1592.7714 |
    |         192 |         757.40 | 159.0540 |        916.4540 |
    |         193 |        1250.48 | 262.6008 |       1513.0808 |
    |         194 |         512.80 | 107.6880 |        620.4880 |
    |         195 |         250.68 |  52.6428 |        303.3228 |
    |         196 |         251.91 |  52.9011 |        304.8111 |
    |         197 |        1078.10 | 226.4010 |       1304.5010 |
    |         198 |         594.04 | 124.7484 |        718.7884 |
    |         199 |         488.79 | 102.6459 |        591.4359 |
    |         200 |         399.90 |  83.9790 |        483.8790 |
    |         201 |         489.60 | 102.8160 |        592.4160 |
    |         202 |         223.24 |  46.8804 |        270.1204 |
    |         203 |         147.98 |  31.0758 |        179.0558 |
    |         204 |         354.24 |  74.3904 |        428.6304 |
    |         205 |         507.95 | 106.6695 |        614.6195 |
    |         206 |         307.48 |  64.5708 |        372.0508 |
    |         207 |         722.48 | 151.7208 |        874.2008 |
    |         208 |         484.52 | 101.7492 |        586.2692 |
    |         209 |        1108.32 | 232.7472 |       1341.0672 |
    |         210 |         216.05 |  45.3705 |        261.4205 |
    |         211 |         121.70 |  25.5570 |        147.2570 |
    |         212 |         787.56 | 165.3876 |        952.9476 |
    |         213 |         982.59 | 206.3439 |       1188.9339 |
    |         214 |         949.83 | 199.4643 |       1149.2943 |
    |         215 |         227.42 |  47.7582 |        275.1782 |
    |         216 |         326.61 |  68.5881 |        395.1981 |
    |         217 |         936.72 | 196.7112 |       1133.4312 |
    |         218 |          17.16 |   3.6036 |         20.7636 |
    |         219 |          26.80 |   5.6280 |         32.4280 |
    |         220 |          64.56 |  13.5576 |         78.1176 |
    |         221 |         996.80 | 209.3280 |       1206.1280 |
    |         222 |         635.55 | 133.4655 |        769.0155 |
    |         223 |         185.42 |  38.9382 |        224.3582 |
    |         224 |          25.00 |   5.2500 |         30.2500 |
    |         225 |         417.06 |  87.5826 |        504.6426 |
    |         226 |         951.79 | 199.8759 |       1151.6659 |
    |         227 |        1049.52 | 220.3992 |       1269.9192 |
    |         228 |         407.10 |  85.4910 |        492.5910 |
    |         229 |         497.45 | 104.4645 |        601.9145 |
    |         230 |         393.50 |  82.6350 |        476.1350 |
    |         231 |        1150.72 | 241.6512 |       1392.3712 |
    |         232 |         393.45 |  82.6245 |        476.0745 |
    |         233 |          84.90 |  17.8290 |        102.7290 |
    |         234 |         268.17 |  56.3157 |        324.4857 |
    |         235 |         922.40 | 193.7040 |       1116.1040 |
    |         236 |         325.80 |  68.4180 |        394.2180 |
    |         237 |         881.50 | 185.1150 |       1066.6150 |
    |         238 |        1628.22 | 341.9262 |       1970.1462 |
    |         239 |         218.82 |  45.9522 |        264.7722 |
    |         240 |          89.60 |  18.8160 |        108.4160 |
    +-------------+----------------+----------+-----------------+
    240 rows in set (0.01 sec)
    ```
34. La misma información que en la pregunta anterior, pero agrupada por código de producto filtrada por los códigos que empiecen por OR.

    ```mysql
    SELECT
         dp.producto_id,
         SUM(dp.cantidad * pr.precio_venta) AS base_imponible,
         SUM(dp.cantidad * pr.precio_venta) * 0.21 AS iva,
         SUM(dp.cantidad * pr.precio_venta) + (SUM(dp.cantidad * pr.precio_venta) * 0.21) AS total_facturado
     FROM
         detalle_pedido dp
     INNER JOIN
         producto p ON dp.producto_id = p.id
     INNER JOIN
         precio pr ON p.id = pr.producto_id
     WHERE
         p.id LIKE 'OR%'
     GROUP BY
         dp.producto_id;
    Empty set (0.01 sec)
    ```
35. Lista las ventas totales de los productos que hayan facturado más de 3000 euros. Se mostrará el nombre, unidades vendidas, total facturado y total facturado con impuestos (21% IVA).

    ```mysql
    SELECT 
        p.nombre,
        SUM(dp.cantidad) AS unidades_vendidas,
        SUM(dp.cantidad * pr.precio_venta) AS total_facturado,
        SUM(dp.cantidad * pr.precio_venta) * 1.21 AS total_facturado_con_iva
    FROM 
        detalle_pedido dp
    INNER JOIN 
        producto p ON dp.producto_id = p.id
    INNER JOIN 
        precio pr ON p.id = pr.producto_id
    GROUP BY 
        p.nombre
    HAVING 
        total_facturado > 3000;
    Empty set (0.01 sec)
    ```
36. Muestre la suma total de todos los pagos que se realizaron para cada uno de los años que aparecen en la tabla pagos.

    ```mysql
     SELECT
         YEAR(fecha_pago) AS año,
         SUM(total) AS total_pagado
     FROM
        pago
     GROUP BY
         YEAR(fecha_pago)
     ORDER BY
         año;
    +------+--------------+
    | año  | total_pagado |
    +------+--------------+
    | 2006 |     24965.00 |
    | 2007 |     85170.00 |
    | 2008 |     29252.00 |
    | 2009 |     58553.00 |
    +------+--------------+
    4 rows in set (0.00 sec)
    ```

    ## Subconsultas

    ## Con operadores básicos de comparación
37. Devuelve el nombre del cliente con mayor límite de crédito.

    ```mysql
     SELECT
        nombre,
        limite_credito
     FROM
        cliente
     ORDER BY
         limite_credito DESC
    LIMIT 1;
    +--------------+----------------+
    | nombre       | limite_credito |
    +--------------+----------------+
    | Tendo Garden |      600000.00 |
    +--------------+----------------+
    1 row in set (0.00 sec)
    ```
38. Devuelve el nombre del producto que tenga el precio de venta más caro.

    ```mysql
    SELECT
         p.nombre,
         pr.precio_venta
     FROM
        producto p
     JOIN
         precio pr ON p.id = pr.producto_id
     ORDER BY
         pr.precio_venta DESC
     LIMIT 1;
     +--------------+--------------+
    | nombre       | precio_venta |
    +--------------+--------------+
    | Producto 166 |       149.07 |
    +--------------+--------------+
    1 row in set (0.01 sec)
    ```
39. Devuelve el nombre del producto del que se han vendido más unidades. (Tenga en cuenta que tendrá que calcular cuál es el número total de unidades que se han vendido de cada producto a partir de los datos de la tabla detalle_pedido)

    ```mysql
    SELECT
         p.nombre,
         SUM(dp.cantidad) AS total_vendido
     FROM
        producto p
     JOIN
        detalle_pedido dp ON p.id = dp.producto_id
     GROUP BY
         p.id, p.nombre
     ORDER BY
        total_vendido DESC
     LIMIT 1;
    +-------------+---------------+
    | nombre      | total_vendido |
    +-------------+---------------+
    | Producto 12 |            11 |
    +-------------+---------------+
    1 row in set (0.00 sec)
    ```
40. Los clientes cuyo límite de crédito sea mayor que los pagos que haya realizado. (Sin utilizar INNER JOIN).

    ```mysql
     SELECT
         c.nombre
     FROM
         cliente c
     WHERE
         c.limite_credito > (
             SELECT
                IFNULL(SUM(p.total), 0)
             FROM
                 pago p
             WHERE
                p.cliente_id = c.id
         );
    +--------------------------------+
    | nombre                         |
    +--------------------------------+
    | Gardening Competitor           |
    | Tendo Garden                   |
    | Lasas S.A.                     |
    | Beragua                        |
    | Club Golf Puerta del hierro    |
    | Naturagua                      |
    | DaraDistribuciones             |
    | Madrileña de riegos            |
    | Lasas S.A.                     |
    | Camunas Jardines S.L.          |
    | Dardena S.A.                   |
    | Jardin de Flores               |
    | Flowers, S.A                   |
    | Naturajardin                   |
    | Golf S.A.                      |
    | Americh Golf Management SL     |
    | Aloha                          |
    | El Prat                        |
    | Sotogrande                     |
    | Vivero Humanes                 |
    | Fuenla City                    |
    | Jardines y Mansiones Cactus SL |
    | Jardinerías Matías SL          |
    | Top Campo                      |
    | Campohermoso                   |
    | france telecom                 |
    | Musée du Louvre                |
    | Tutifruti S.A                  |
    | Flores S.L.                    |
    | The Magic Garden               |
    | El Jardin Viviente S.L         |
    +--------------------------------+
    31 rows in set (0.01 sec)
    ```
41. Devuelve el producto que más unidades tiene en stock.

    ```mysql
    SELECT
         nombre,
         cantidad_en_stock
     FROM
         producto
     ORDER BY
         cantidad_en_stock DESC
     LIMIT 1;
     +--------------+-------------------+
    | nombre       | cantidad_en_stock |
    +--------------+-------------------+
    | Producto 120 |               199 |
    +--------------+-------------------+
    1 row in set (0.00 sec)
    ```
42. Devuelve el producto que menos unidades tiene en stock.

    ```mysql
    SELECT
         nombre,
         cantidad_en_stock
     FROM
         producto
     ORDER BY
         cantidad_en_stock ASC
     LIMIT 1;
     +--------------+-------------------+
    | nombre       | cantidad_en_stock |
    +--------------+-------------------+
    | Producto 146 |                50 |
    +--------------+-------------------+
    1 row in set (0.00 sec)
    ```
43. Devuelve el nombre, los apellidos y el email de los empleados que están a cargo de Alberto Soria.

    ```mysql
     SELECT
         e.nombre,
         e.apellido1,
        e.apellido2,
         e.email
     FROM
         empleado AS e
     JOIN
         empleado AS jefe ON e.jefe_id = jefe.id
     WHERE
         jefe.nombre = 'Alberto' AND jefe.apellido1 = 'Soria';
    +-------------+------------+-----------+---------------------------+
    | nombre      | apellido1  | apellido2 | email                     |
    +-------------+------------+-----------+---------------------------+
    | Felipe      | Rosas      | Marquez   | frosas@jardineria.es      |
    | Juan Carlos | Ortiz      | Serrano   | cortiz@jardineria.es      |
    | Carlos      | Soria      | Jimenez   | csoria@jardineria.es      |
    | Emmanuel    | Magaña     | Perez     | manu@jardineria.es        |
    | Francois    | Fignon     |           | ffignon@gardening.com     |
    | Michael     | Bolton     |           | mbolton@gardening.com     |
    | Hilary      | Washington |           | hwashington@gardening.com |
    | Nei         | Nishikori  |           | nnishikori@gardening.com  |
    | Amy         | Johnson    |           | ajohnson@gardening.com    |
    | Kevin       | Fallmer    |           | kfalmer@gardening.com     |
    +-------------+------------+-----------+---------------------------+
    10 rows in set (0.01 sec)
    ```

    ## Subconsultas con ALL y ANY
44. Devuelve el nombre del cliente con mayor límite de crédito.

    ```mysql
    SELECT
        nombre
    FROM
        cliente
    WHERE
        limite_credito >= ALL (SELECT limite_credito FROM cliente);
    +--------------+
    | nombre       |
    +--------------+
    | Tendo Garden |
    +--------------+
    1 row in set (0.00 sec)
    ```
45. Devuelve el nombre del producto que tenga el precio de venta más caro.

    ```mysql
    SELECT
        p.nombre
    FROM
        producto AS p
    JOIN
        precio AS pr ON p.id = pr.producto_id
    WHERE
        pr.precio_venta >= ALL (SELECT precio_venta FROM precio);
    +--------------+
    | nombre       |
    +--------------+
    | Producto 166 |
    +--------------+
    1 row in set (0.01 sec)
    ```
46. Devuelve el producto que menos unidades tiene en stock.

    ```mysql
    SELECT
        nombre
    FROM
        producto
    WHERE
        cantidad_en_stock <= ANY (SELECT cantidad_en_stock FROM producto)
    LIMIT 1;
    +------------+
    | nombre     |
    +------------+
    | Producto 1 |
    +------------+
    1 row in set (0.00 sec)
    ```

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

    ```mysql
    SELECT
    	em.nombre AS nombre_empleado,
    	em.apellido1  AS  apellido1_empleado,
    	em.apellido2 AS apellido2_empleado,
    	pu.puesto,
    	tlfofc.numero AS telefono_oficina
    FROM
    	empleado em
    INNER JOIN
    	puesto pu ON pu.id = em.puesto_id
    INNER JOIN
    	oficina ofc ON ofc.id = em.oficina_id
    INNER JOIN
    	telefono_oficina tlfofc ON ofc.id = tlfofc.oficina_id
    WHERE
    	em.id NOT IN (
        SELECT
        	cliente.empleado_id
        FROM
        	cliente
        );
    +-----------------+--------------------+--------------------+-----------------------+------------------+
    | nombre_empleado | apellido1_empleado | apellido2_empleado | puesto                | telefono_oficina |
    +-----------------+--------------------+--------------------+-----------------------+------------------+
    | David           | Palma              | Aceituno           | Representante Ventas  | +34 93 3561182   |
    | Oscar           | Palma              | Aceituno           | Representante Ventas  | +34 93 3561182   |
    | Hilary          | Washington         |                    | Director General      | +1 215 837 0825  |
    | Marcus          | Paxton             |                    | Representante Ventas  | +1 215 837 0825  |
    | Amy             | Johnson            |                    | Director General      | +44 20 78772041  |
    | Larry           | Westfalls          |                    | Representante Ventas  | +44 20 78772041  |
    | John            | Walton             |                    | Representante Ventas  | +44 20 78772041  |
    | Carlos          | Soria              | Jimenez            | Director General      | +34 91 7514487   |
    | Hilario         | Rodriguez          | Huertas            | Representante Ventas  | +34 91 7514487   |
    | Francois        | Fignon             |                    | Director General      | +33 14 723 4404  |
    | Laurent         | Serra              |                    | Representante Ventas  | +33 14 723 4404  |
    | Kevin           | Fallmer            |                    | Director General      | +61 2 9264 2451  |
    | Marcos          | Magaña             | Perez              | Director General      | +34 925 867231   |
    | Ruben           | López              | Martinez           | Subdirector Marketing | +34 925 867231   |
    | Alberto         | Soria              | Carrasco           | Subdirector Ventas    | +34 925 867231   |
    | Maria           | Solís              | Jerez              | Secretaria            | +34 925 867231   |
    | Juan Carlos     | Ortiz              | Serrano            | Representante Ventas  | +34 925 867231   |
    | Nei             | Nishikori          |                    | Director General      | +81 33 224 5000  |
    | Narumi          | Riko               |                    | Representante Ventas  | +81 33 224 5000  |
    | Takuma          | Nomura             |                    | Representante Ventas  | +81 33 224 5000  |
    +-----------------+--------------------+--------------------+-----------------------+------------------+
    20 rows in set (0.01 sec)
    ```
52. Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los representantes de ventas de algún cliente que haya realizado la compra de algún producto de la gama Frutales.

    ```
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
53. Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado ningún pago.

    ```
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
    	cl.id NOT IN(
    	SELECT
    		pa.cliente_id
    	FROM
    		pago pa);
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
    8 rows in set (0.03 sec)
    ```

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

   ```mysql
   SELECT
       c.nombre AS nombre_cliente,
        COUNT(p.id) AS cantidad_pedidos
    FROM
        cliente c
    LEFT JOIN
        pedido p ON c.id = p.cliente_id
    GROUP BY
        c.id, c.nombre;
   +--------------------------------+------------------+
   | nombre_cliente                 | cantidad_pedidos |
   +--------------------------------+------------------+
   | GoldFish Garden                |               13 |
   | Gardening Competitor           |                2 |
   | Gardening Associates           |               11 |
   | Gerudo Valley                  |                3 |
   | Tendo Garden                   |                9 |
   | Lasas S.A.                     |                1 |
   | Beragua                        |                5 |
   | Club Golf Puerta del hierro    |                0 |
   | Naturagua                      |                4 |
   | DaraDistribuciones             |                0 |
   | Madrileña de riegos            |                0 |
   | Lasas S.A.                     |                0 |
   | Camunas Jardines S.L.          |                3 |
   | Dardena S.A.                   |                2 |
   | Jardin de Flores               |                5 |
   | Flores Marivi                  |               10 |
   | Flowers, S.A                   |                0 |
   | Naturajardin                   |                0 |
   | Golf S.A.                      |                2 |
   | Americh Golf Management SL     |                0 |
   | Aloha                          |                0 |
   | El Prat                        |                0 |
   | Sotogrande                     |                5 |
   | Vivero Humanes                 |                0 |
   | Fuenla City                    |                0 |
   | Jardines y Mansiones Cactus SL |                5 |
   | Jardinerías Matías SL          |                5 |
   | Agrojardin                     |                5 |
   | Top Campo                      |                0 |
   | Jardineria Sara                |               10 |
   | Campohermoso                   |                0 |
   | france telecom                 |                0 |
   | Musée du Louvre                |                0 |
   | Tutifruti S.A                  |                5 |
   | Flores S.L.                    |                5 |
   | The Magic Garden               |                0 |
   | El Jardin Viviente S.L         |                5 |
   +--------------------------------+------------------+
   37 rows in set (0.01 sec)
   ```
6. Devuelve un listado con los nombres de los clientes y el total pagado por cada uno de ellos. Tenga en cuenta que pueden existir clientes que no han realizado ningún pago.

   ```mysql
    SELECT
        c.nombre AS nombre_cliente,
       COALESCE(SUM(pa.total), 0) AS total_pagado
    FROM
        cliente c
    LEFT JOIN
       pago pa ON c.id = pa.cliente_id
    GROUP BY
        c.id, c.nombre;
   +--------------------------------+--------------+
   | nombre_cliente                 | total_pagado |
   +--------------------------------+--------------+
   | GoldFish Garden                |      4000.00 |
   | Gardening Competitor           |         0.00 |
   | Gardening Associates           |     10926.00 |
   | Gerudo Valley                  |     81849.00 |
   | Tendo Garden                   |     23794.00 |
   | Lasas S.A.                     |         0.00 |
   | Beragua                        |      2390.00 |
   | Club Golf Puerta del hierro    |         0.00 |
   | Naturagua                      |       929.00 |
   | DaraDistribuciones             |         0.00 |
   | Madrileña de riegos            |         0.00 |
   | Lasas S.A.                     |         0.00 |
   | Camunas Jardines S.L.          |      2246.00 |
   | Dardena S.A.                   |      4160.00 |
   | Jardin de Flores               |     12081.00 |
   | Flores Marivi                  |      4399.00 |
   | Flowers, S.A                   |         0.00 |
   | Naturajardin                   |         0.00 |
   | Golf S.A.                      |       232.00 |
   | Americh Golf Management SL     |         0.00 |
   | Aloha                          |         0.00 |
   | El Prat                        |         0.00 |
   | Sotogrande                     |       272.00 |
   | Vivero Humanes                 |         0.00 |
   | Fuenla City                    |         0.00 |
   | Jardines y Mansiones Cactus SL |     18846.00 |
   | Jardinerías Matías SL          |     10972.00 |
   | Agrojardin                     |      8489.00 |
   | Top Campo                      |         0.00 |
   | Jardineria Sara                |      7863.00 |
   | Campohermoso                   |         0.00 |
   | france telecom                 |         0.00 |
   | Musée du Louvre                |         0.00 |
   | Tutifruti S.A                  |      3321.00 |
   | Flores S.L.                    |         0.00 |
   | The Magic Garden               |         0.00 |
   | El Jardin Viviente S.L         |      1171.00 |
   +--------------------------------+--------------+
   37 rows in set (0.01 sec)
   ```
7. Devuelve el nombre de los clientes que hayan hecho pedidos en 2008 ordenados alfabéticamente de menor a mayor.

   ```mysql
    SELECT DISTINCT 
    	c.nombre AS nombre_cliente
    FROM
        cliente c
    JOIN
       pedido p ON c.id = p.cliente_id
    WHERE
       YEAR(p.fecha_pedido) = 2008
    ORDER BY
        nombre_cliente ASC;
   +--------------------------------+
   | nombre_cliente                 |
   +--------------------------------+
   | Camunas Jardines S.L.          |
   | Dardena S.A.                   |
   | El Jardin Viviente S.L         |
   | Flores Marivi                  |
   | Flores S.L.                    |
   | Gardening Associates           |
   | Gardening Competitor           |
   | GoldFish Garden                |
   | Jardin de Flores               |
   | Jardines y Mansiones Cactus SL |
   | Lasas S.A.                     |
   | Tendo Garden                   |
   | Tutifruti S.A                  |
   +--------------------------------+
   13 rows in set (0.00 sec)
   ```
8. Devuelve el nombre del cliente, el nombre y primer apellido de su representante de ventas y el número de teléfono de la oficina del representante de ventas, de aquellos clientes que no hayan realizado ningún pago.

   ```mysql
    SELECT
       c.nombre AS nombre_cliente,
        CONCAT(e.nombre, ' ', e.apellido1) AS nombre_representante,
        tof.numero AS telefono_oficina_representante
    FROM
        cliente c
    LEFT JOIN
        empleado e ON c.empleado_id = e.id
    LEFT JOIN
        telefono_oficina tof ON e.oficina_id = tof.oficina_id
    WHERE
        c.id NOT IN (SELECT DISTINCT cliente_id FROM pago)
    ;
    +-----------------------------+-------------------------+--------------------------------+
   | nombre_cliente              | nombre_representante    | telefono_oficina_representante |
   +-----------------------------+-------------------------+--------------------------------+
   | Gardening Competitor        | Walter Santiago Sanchez | +1 650 219 4782                |
   | Lasas S.A.                  | Mariano López           | +34 91 7514487                 |
   | Club Golf Puerta del hierro | Emmanuel Magaña         | +34 93 3561182                 |
   | DaraDistribuciones          | Emmanuel Magaña         | +34 93 3561182                 |
   | Madrileña de riegos         | Emmanuel Magaña         | +34 93 3561182                 |
   | Lasas S.A.                  | Mariano López           | +34 91 7514487                 |
   | Flowers, S.A                | Felipe Rosas            | +34 925 867231                 |
   | Naturajardin                | Julian Bellinelli       | +61 2 9264 2451                |
   | Americh Golf Management SL  | José Manuel Martinez    | +34 93 3561182                 |
   | Aloha                       | José Manuel Martinez    | +34 93 3561182                 |
   | El Prat                     | José Manuel Martinez    | +34 93 3561182                 |
   | Vivero Humanes              | Julian Bellinelli       | +61 2 9264 2451                |
   | Fuenla City                 | Felipe Rosas            | +34 925 867231                 |
   | Top Campo                   | Felipe Rosas            | +34 925 867231                 |
   | Campohermoso                | Julian Bellinelli       | +61 2 9264 2451                |
   | france telecom              | Lionel Narvaez          | +33 14 723 4404                |
   | Musée du Louvre             | Lionel Narvaez          | +33 14 723 4404                |
   | Flores S.L.                 | Michael Bolton          | +1 650 219 4782                |
   | The Magic Garden            | Michael Bolton          | +1 650 219 4782                |
   +-----------------------------+-------------------------+--------------------------------+
   19 rows in set (0.02 sec)
   ```
9. Devuelve el listado de clientes donde aparezca el nombre del cliente, el nombre y primer apellido de su representante de ventas y la ciudad donde está su oficina.

   ```mysql
    SELECT
        c.nombre AS nombre_cliente,
       CONCAT(e.nombre, ' ', e.apellido1) AS nombre_representante,
        ci.nombre AS ciudad_oficina
    FROM
        cliente c
    JOIN
        empleado e ON c.empleado_id = e.id
    JOIN
       direccion_oficina do ON e.oficina_id = do.oficina_id
    JOIN
       ciudad ci ON do.ciudad_id = ci.id;
   +--------------------------------+-------------------------+----------------------+
   | nombre_cliente                 | nombre_representante    | ciudad_oficina       |
   +--------------------------------+-------------------------+----------------------+
   | GoldFish Garden                | Walter Santiago Sanchez | San Francisco        |
   | Gardening Competitor           | Walter Santiago Sanchez | San Francisco        |
   | Gardening Associates           | Walter Santiago Sanchez | San Francisco        |
   | Gerudo Valley                  | Lorena Paxton           | Boston               |
   | Tendo Garden                   | Lorena Paxton           | Boston               |
   | Lasas S.A.                     | Mariano López           | Madrid               |
   | Beragua                        | Emmanuel Magaña         | Barcelona            |
   | Club Golf Puerta del hierro    | Emmanuel Magaña         | Barcelona            |
   | Naturagua                      | Emmanuel Magaña         | Barcelona            |
   | DaraDistribuciones             | Emmanuel Magaña         | Barcelona            |
   | Madrileña de riegos            | Emmanuel Magaña         | Barcelona            |
   | Lasas S.A.                     | Mariano López           | Madrid               |
   | Camunas Jardines S.L.          | Mariano López           | Madrid               |
   | Dardena S.A.                   | Mariano López           | Madrid               |
   | Jardin de Flores               | Julian Bellinelli       | Sydney               |
   | Flores Marivi                  | Felipe Rosas            | Talavera de la Reina |
   | Flowers, S.A                   | Felipe Rosas            | Talavera de la Reina |
   | Naturajardin                   | Julian Bellinelli       | Sydney               |
   | Golf S.A.                      | José Manuel Martinez    | Barcelona            |
   | Americh Golf Management SL     | José Manuel Martinez    | Barcelona            |
   | Aloha                          | José Manuel Martinez    | Barcelona            |
   | El Prat                        | José Manuel Martinez    | Barcelona            |
   | Sotogrande                     | José Manuel Martinez    | Barcelona            |
   | Vivero Humanes                 | Julian Bellinelli       | Sydney               |
   | Fuenla City                    | Felipe Rosas            | Talavera de la Reina |
   | Jardines y Mansiones Cactus SL | Lucio Campoamor         | Madrid               |
   | Jardinerías Matías SL          | Lucio Campoamor         | Madrid               |
   | Agrojardin                     | Julian Bellinelli       | Sydney               |
   | Top Campo                      | Felipe Rosas            | Talavera de la Reina |
   | Jardineria Sara                | Felipe Rosas            | Talavera de la Reina |
   | Campohermoso                   | Julian Bellinelli       | Sydney               |
   | france telecom                 | Lionel Narvaez          | Paris                |
   | Musée du Louvre                | Lionel Narvaez          | Paris                |
   | Tutifruti S.A                  | Mariko Kishi            | Sydney               |
   | Flores S.L.                    | Michael Bolton          | San Francisco        |
   | The Magic Garden               | Michael Bolton          | San Francisco        |
   | El Jardin Viviente S.L         | Mariko Kishi            | Sydney               |
   +--------------------------------+-------------------------+----------------------+
   37 rows in set (0.00 sec)
   ```
10. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados que no sean representante de ventas de ningún cliente.

    ```mysql
     SELECT
         e.nombre,
        e.apellido1,
         e.apellido2,
         p.puesto,
        tof.numero AS telefono_oficina
     FROM
        empleado e
     JOIN
         puesto p ON e.puesto_id = p.id
    JOIN
         telefono_oficina tof ON e.oficina_id = tof.oficina_id
     WHERE
         e.id NOT IN (SELECT DISTINCT empleado_id FROM cliente WHERE empleado_id IS NOT NULL);
    +-------------+------------+-----------+-----------------------+------------------+
    | nombre      | apellido1  | apellido2 | puesto                | telefono_oficina |
    +-------------+------------+-----------+-----------------------+------------------+
    | Marcos      | Magaña     | Perez     | Director General      | +34 925 867231   |
    | Carlos      | Soria      | Jimenez   | Director General      | +34 91 7514487   |
    | Francois    | Fignon     |           | Director General      | +33 14 723 4404  |
    | Hilary      | Washington |           | Director General      | +1 215 837 0825  |
    | Nei         | Nishikori  |           | Director General      | +81 33 224 5000  |
    | Amy         | Johnson    |           | Director General      | +44 20 78772041  |
    | Kevin       | Fallmer    |           | Director General      | +61 2 9264 2451  |
    | Ruben       | López      | Martinez  | Subdirector Marketing | +34 925 867231   |
    | Alberto     | Soria      | Carrasco  | Subdirector Ventas    | +34 925 867231   |
    | Maria       | Solís      | Jerez     | Secretaria            | +34 925 867231   |
    | Juan Carlos | Ortiz      | Serrano   | Representante Ventas  | +34 925 867231   |
    | Hilario     | Rodriguez  | Huertas   | Representante Ventas  | +34 91 7514487   |
    | David       | Palma      | Aceituno  | Representante Ventas  | +34 93 3561182   |
    | Oscar       | Palma      | Aceituno  | Representante Ventas  | +34 93 3561182   |
    | Laurent     | Serra      |           | Representante Ventas  | +33 14 723 4404  |
    | Marcus      | Paxton     |           | Representante Ventas  | +1 215 837 0825  |
    | Narumi      | Riko       |           | Representante Ventas  | +81 33 224 5000  |
    | Takuma      | Nomura     |           | Representante Ventas  | +81 33 224 5000  |
    | Larry       | Westfalls  |           | Representante Ventas  | +44 20 78772041  |
    | John        | Walton     |           | Representante Ventas  | +44 20 78772041  |
    +-------------+------------+-----------+-----------------------+------------------+
    20 rows in set (0.01 sec)

    ```
11. Devuelve un listado indicando todas las ciudades donde hay oficinas y el número de empleados que tiene.

    ```mysql
     SELECT
         c.nombre AS ciudad,
         COUNT(e.id) AS numero_empleados
     FROM
         ciudad c
     JOIN
         direccion_oficina do ON c.id = do.ciudad_id
     JOIN
         empleado e ON do.oficina_id = e.oficina_id
     GROUP BY
        c.id;
    +----------------------+------------------+
    | ciudad               | numero_empleados |
    +----------------------+------------------+
    | Barcelona            |                4 |
    | Boston               |                3 |
    | Londres              |                3 |
    | Madrid               |                4 |
    | Paris                |                3 |
    | San Francisco        |                2 |
    | Sydney               |                3 |
    | Talavera de la Reina |                6 |
    | Tokyo                |                3 |
    +----------------------+------------------+
    9 rows in set (0.01 sec)
    ```
