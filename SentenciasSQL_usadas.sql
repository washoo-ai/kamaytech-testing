
------Actualizar totales de la cabecera de pedidos: cpe_subtotal cpe_impuesto cpe_total-------


UPDATE cpedidos c
SET 
    cpe_subtotal = subquery.subtotal,
    cpe_impuesto = subquery.impuesto,
    cpe_total = subquery.total
FROM (
    SELECT 
        d.cpe_id,
        SUM(d.dpe_precio * d.dpe_cantidad) AS subtotal,
        SUM(d.dpe_precio * d.dpe_cantidad * (i.imp_porcentaje::numeric / 100)) AS impuesto,
        SUM(d.dpe_precio * d.dpe_cantidad) + SUM(d.dpe_precio * d.dpe_cantidad * (i.imp_porcentaje::numeric / 100)) AS total
    FROM dpedidos d
    JOIN cpedidos c ON d.cpe_id = c.cpe_id
    JOIN impuesto i ON c.imp_id = i.imp_id
    GROUP BY d.cpe_id, i.imp_porcentaje
) subquery
WHERE c.cpe_id = subquery.cpe_id;



------------Actualizar el impuesto a 15% de los pedidos del mes Julio y agosto, Se debe recalcular subtotal,iva y total de las cabeceras-----------


WITH impuesto_15 AS (
    SELECT imp_id
    FROM impuesto
    WHERE imp_porcentaje = '15'
),
actualizado_pedidos AS (
    UPDATE cpedidos c
    SET 
        imp_id = (SELECT imp_id FROM impuesto_15),
        cpe_subtotal = subquery.subtotal,
        cpe_impuesto = subquery.impuesto,
        cpe_total = subquery.total
    FROM (
        SELECT 
            d.cpe_id,
            SUM(d.dpe_precio * d.dpe_cantidad) AS subtotal,
            SUM(d.dpe_precio * d.dpe_cantidad * 0.15) AS impuesto,
            SUM(d.dpe_precio * d.dpe_cantidad) + SUM(d.dpe_precio * d.dpe_cantidad * 0.15) AS total
        FROM dpedidos d
        JOIN cpedidos c ON d.cpe_id = c.cpe_id
        WHERE EXTRACT(MONTH FROM c.cpe_fecha) IN (7, 8)
        GROUP BY d.cpe_id
    ) subquery
    WHERE c.cpe_id = subquery.cpe_id
    RETURNING c.cpe_id
)

UPDATE dpedidos d
SET 
    dpe_total = d.dpe_precio * d.dpe_cantidad * 1.15
WHERE d.cpe_id IN (SELECT cpe_id FROM actualizado_pedidos);



------------Elaborar un reporte de pedidos de clientes, el pedido debe contener cliente, mes, valor total(CON IMPUESTO) ordenado por mes, y valor de pedido de manera descendente---------------
SELECT 
    cl.cli_nombre || ' ' || cl.cli_apellido AS cliente,
    EXTRACT(MONTH FROM p.cpe_fecha) AS mes,
    SUM(p.cpe_total) AS valor_total
FROM cpedidos p
JOIN cliente cl ON p.cli_id = cl.cli_id
GROUP BY cl.cli_nombre, cl.cli_apellido, EXTRACT(MONTH FROM p.cpe_fecha)
ORDER BY EXTRACT(MONTH FROM p.cpe_fecha), valor_total DESC;



------------Elaborar un reporte con clientes que mas compraron en los ultimos 4 meses.----------------
SELECT 
    cl.cli_nombre || ' ' || cl.cli_apellido AS cliente,
    SUM(p.cpe_total) AS total_compras
FROM cpedidos p
JOIN cliente cl ON p.cli_id = cl.cli_id
WHERE p.cpe_fecha >= CURRENT_DATE - INTERVAL '4 months'
GROUP BY cl.cli_nombre, cl.cli_apellido
ORDER BY total_compras DESC;



-------------Actualizar la cantidad de unidades a 2 en todos los productos que correspondan a los pedidos 28,29,30, Se debe recalcular subtotal,iva y total de las cabeceras---------------------------




UPDATE dpedidos
SET dpe_cantidad = 2
WHERE cpe_id IN (28, 29, 30);


WITH recalculo AS (
    SELECT 
        d.cpe_id,
        SUM(d.dpe_precio * d.dpe_cantidad) AS subtotal,
        SUM(d.dpe_precio * d.dpe_cantidad * (i.imp_porcentaje::numeric / 100)) AS impuesto,
        SUM(d.dpe_precio * d.dpe_cantidad) + SUM(d.dpe_precio * d.dpe_cantidad * (i.imp_porcentaje::numeric / 100)) AS total
    FROM dpedidos d
    JOIN cpedidos c ON d.cpe_id = c.cpe_id
    JOIN impuesto i ON c.imp_id = i.imp_id
    WHERE d.cpe_id IN (28, 29, 30)
    GROUP BY d.cpe_id
)
UPDATE cpedidos c
SET 
    cpe_subtotal = r.subtotal,
    cpe_impuesto = r.impuesto,
    cpe_total = r.total
FROM recalculo r
WHERE c.cpe_id = r.cpe_id;
