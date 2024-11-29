use mahoedb;

-- ------------------- Empiezo mis querys

-- Cual es el producto mas caro
SELECT nombre_producto, precio
FROM productos
ORDER BY precio DESC
LIMIT 1;

-- Cual es el producto mas barato
SELECT nombre_producto, precio
FROM productos
ORDER BY precio ASC
LIMIT 1;

-- Cantidad de cada producto
SELECT p.nombre_producto, SUM(i.cantidad) AS total_cantidad
FROM productos p
JOIN inventario i ON p.producto_id = i.producto_id
GROUP BY p.producto_id, p.nombre_producto;

-- Cantidad de pedidos del ultimo mes
SELECT COUNT(*) AS cantidad_pedidos
FROM pedidos
WHERE fecha_pedido >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH);

-- Número de pedidos por empleado
SELECT e.nombre, e.apellido, COUNT(p.pedido_id) AS numero_pedidos
FROM empleados e
LEFT JOIN pedidos p ON e.empleado_id = p.empleado_id
GROUP BY e.empleado_id, e.nombre, e.apellido
ORDER BY numero_pedidos DESC;

-- Cuantos empleados tengo
SELECT COUNT(EMPLEADO_ID)
FROM EMPLEADOS;

-- precio unitario de los productos vendidos
SELECT cantidad,precio_total, (precio_total /  cantidad) AS precio_unitario
FROM detalle_pedidos;

-- Pedido de mayor cantidad 
select *
from detalle_pedidos
order by cantidad 
limit 1;

-- -Pedido de mayor importe
select *
from detalle_pedidos
order by precio_total 
limit 1;

-- Empleado con mayor sueldo
select *
from empleados
order by salario 
limit 1;

-- Empleado con menor sueldo
select *
from empleados
order by salario desc 
limit 1;


