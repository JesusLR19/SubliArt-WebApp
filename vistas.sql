CREATE VIEW vista_productos AS
SELECT 
    p.id_producto,
    p.nombre_producto,
    dp.descripcion,
    cp.nombre_categoria as categoria,
	p.precio
FROM 
    productos p
JOIN 
    descripcion_producto dp ON p.id_descripcion = dp.id_descripcion
JOIN 
    categoria_producto cp ON p.id_categoria = cp.id_categoria;
