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

1. Muestra el nombre de los clientes que no hayan realizado pagos junto con el nombre de sus representantes de ventas.

   ```mysql
   
   ```

   

2. Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.

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

   

1. Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.

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

   

2. Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.

​	

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

3. Devuelve un listado que muestre el nombre de cada empleados, el nombre de su jefe y el nombre del jefe de sus jefe.

4. Devuelve el nombre de los clientes a los que no se les ha entregado a tiempo un pedido.

5. Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente.

   ## Consultas multitabla (Composición externa)

   

   **Resuelva todas las consultas utilizando las cláusulas LEFT JOIN, RIGHT JOIN, NATURAL** **LEFT JOIN y NATURAL RIGHT JOIN.**

6. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.

7. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pedido.

8. Devuelve un listado que muestre los clientes que no han realizado ningún pago y los que no han realizado ningún pedido.

9. Devuelve un listado que muestre solamente los empleados que no tienen una oficina asociada.

10. Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado.

11. Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado junto con los datos de la oficina donde trabajan.

12. Devuelve un listado que muestre los empleados que no tienen una oficina asociada y los que no tienen un cliente asociado.

13. Devuelve un listado de los productos que nunca han aparecido en un pedido.

14. Devuelve un listado de los productos que nunca han aparecido en un pedido. El resultado debe mostrar el nombre, la descripción y la imagen del producto.

15. Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los representantes de ventas de algún cliente que haya realizado la compra de algún producto de la gama Frutales.

16. Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado ningún pago.

17. Devuelve un listado con los datos de los empleados que no tienen clientes asociados y el nombre de su jefe asociado.

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

48. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.

49. Devuelve un listado que muestre solamente los clientes que sí han realizado algún pago.

50. Devuelve un listado de los productos que nunca han aparecido en un pedido.

51. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados que no sean representante de ventas de ningún cliente.

52. Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los representantes de ventas de algún cliente que haya realizado la compra de algún producto de la gama Frutales.

53. Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado ningún pago. 18.

## Subconsultas con EXISTS y NOT EXISTS



1. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.

2. Devuelve un listado que muestre solamente los clientes que sí han realizado algún pago.

3. Devuelve un listado de los productos que nunca han aparecido en un pedido.

4. Devuelve un listado de los productos que han aparecido en un pedido alguna vez.

   ## Subconsultas correlacionadas

   

   ## Consultas variadas

   

5. Devuelve el listado de clientes indicando el nombre del cliente y cuántos pedidos ha realizado. Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido.

6. Devuelve un listado con los nombres de los clientes y el total pagado por cada uno de ellos. Tenga en cuenta que pueden existir clientes que no han realizado ningún pago.

7. Devuelve el nombre de los clientes que hayan hecho pedidos en 2008 ordenados alfabéticamente de menor a mayor.

8. Devuelve el nombre del cliente, el nombre y primer apellido de su representante de ventas y el número de teléfono de la oficina del representante de ventas, de aquellos clientes que no hayan realizado ningún pago.

9. Devuelve el listado de clientes donde aparezca el nombre del cliente, el nombre y primer apellido de su representante de ventas y la ciudad donde está su oficina.

10. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados que no sean representante de ventas de ningún cliente.

11. Devuelve un listado indicando todas las ciudades donde hay oficinas y el número de empleados que tiene.
