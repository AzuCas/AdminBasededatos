/*Seleccionar los clientes del a�o 2021 en base a la fecha de la factura.*/

SELECT nombre, apellido
FROM cliente
INNER JOIN factura ON cliente.id_cliente = factura.id_cliente
WHERE YEAR (fecha) = 2021 

/*Seleccionar los clientes de 2022 (hasta el momento) en base a la fecha de la
factura.*/
SELECT nombre, apellido
FROM cliente
INNER JOIN factura ON cliente.id_cliente = factura.id_cliente
WHERE fecha BETWEEN '2022-01-01' AND GETDATE();

/*Seleccionar los clientes de diciembre de 2021.*/

SELECT nombre, apellido
FROM cliente
INNER JOIN factura ON cliente.id_cliente = factura.id_cliente
WHERE YEAR (fecha) = 2021 AND MONTH (fecha)= 12;

/*�Qu� compras han realizado los siguientes clientes?
Valentina Anastasia Huerta Corral*/

SELECT producto.nombre
FROM cliente
JOIN factura ON cliente.id_cliente = factura.id_cliente
JOIN detalle ON factura.id_detalle = detalle.id_detalle
JOIN producto ON detalle.id_producto = producto.id_producto
WHERE CONVERT(varchar,cliente.nombre) = 'Valentina Anastasia';

/*Zayra Manuela G�mez L�pez*/

SELECT producto.nombre
FROM cliente
JOIN factura ON cliente.id_cliente = factura.id_cliente
JOIN detalle ON factura.id_detalle = detalle.id_detalle
JOIN producto ON detalle.id_producto = producto.id_producto
WHERE CONVERT(varchar,cliente.nombre) = 'Zayra Manuela';

/* Dante Eduardo Dolores Meza*/

SELECT producto.nombre
FROM cliente
JOIN factura ON cliente.id_cliente = factura.id_cliente
JOIN detalle ON factura.id_detalle = detalle.id_detalle
JOIN producto ON detalle.id_producto = producto.id_producto
WHERE CONVERT(varchar,cliente.nombre) = 'Dante Eduardo';

/*Ana Maribel Cedillo N��ez*/

SELECT producto.nombre
FROM cliente
JOIN factura ON cliente.id_cliente = factura.id_cliente
JOIN detalle ON factura.id_detalle = detalle.id_detalle
JOIN producto ON detalle.id_producto = producto.id_producto
WHERE CONVERT(varchar,cliente.nombre) = 'Ana Maribel';

/*Rodrigo Ismael Silva Ugarte*/
SELECT producto.nombre
FROM cliente
JOIN factura ON cliente.id_cliente = factura.id_cliente
JOIN detalle ON factura.id_detalle = detalle.id_detalle
JOIN producto ON detalle.id_producto = producto.id_producto
WHERE CONVERT(varchar,cliente.nombre) = 'Rodrigo Ismael';

/* Seleccionar el producto que m�s ventas ha tenido.*/

SELECT
cantidad, id_producto,
   RANK() OVER (ORDER BY cantidad DESC) as ranking
FROM detalle
ORDER BY ranking;

WITH detalle_ranking AS (
  SELECT
    id_producto, cantidad, 
    RANK() OVER (ORDER BY cantidad DESC) as ranking
  FROM detalle
)
SELECT
   id_producto, cantidad
FROM detalle_ranking
WHERE ranking = 1

SELECT nombre
FROM producto
INNER JOIN detalle ON detalle.id_producto = producto.id_producto 
WHERE cantidad = 10


/*�Qu� producto tienen m�s cantidad en stock?*/

SELECT
stock, nombre, 
   RANK() OVER (ORDER BY stock DESC) as ranking
FROM producto
ORDER BY ranking;

WITH producto_ranking AS (
  SELECT
    nombre,
    RANK() OVER (ORDER BY stock DESC) as ranking
  FROM producto
)
SELECT
   nombre
FROM producto_ranking
WHERE ranking = 1

/*Ordenar, de la m�s antigua a la m�s reciente, las compras que ha habido en la
tienda*/

SELECT fecha, id_cliente
FROM factura
ORDER BY fecha DESC;


/*Ordenar alfab�ticamente los nombres de todos los clientes de la tienda.*/

select
nombre
from cliente
order by nombre;

/*en este caso te sale el erro de que varchar y text no son compatibles por lo que se tiene 
que cambiar el c�digo al siguiente*/

select nombre from cliente
order by CAST(nombre AS varchar(100));

/*Seleccionar cu�les productos pertenecen a cada categor�a*/
/*falda*/
SELECT producto.nombre
FROM categoria
INNER JOIN producto ON categoria.id_categoria=producto.id_categoria
WHERE convert (varchar, categoria.nombre)='falda'

/*pantal�n*/

SELECT producto.nombre
FROM categoria
INNER JOIN producto ON categoria.id_categoria=producto.id_categoria
WHERE convert (varchar, categoria.nombre)='pantal�n'

/*chamarra*/

SELECT producto.nombre
FROM categoria
INNER JOIN producto ON categoria.id_categoria=producto.id_categoria
WHERE convert (varchar, categoria.nombre)='chamarra'

/*zapato*/

SELECT producto.nombre
FROM categoria
INNER JOIN producto ON categoria.id_categoria=producto.id_categoria
WHERE convert (varchar, categoria.nombre)='zapato'

/*accesorios*/

SELECT producto.nombre
FROM categoria
INNER JOIN producto ON categoria.id_categoria=producto.id_categoria
WHERE convert (varchar, categoria.nombre)='accesorios'

/* Seleccionar los encargados de las sucursales de la tienda Akira�s Boutique*/
select 
nombre_sucursal, nombre_persona_encargada
from Sucursales;

/*Seleccionar los empleados que trabajan en la sucursal de Akira�s Boutique:
Constituci�n*/

select 
nombre_empleado, sucursal_pertenece
from Empleados
where
sucursal_pertenece = 'Constitucion';

/*�Qu� clientes son mayores de 30 a�os?*/

SELECT nombre, fec_nac, apellido
FROM cliente
WHERE DATEDIFF(year, fec_nac, GETDATE()) > 30;
















