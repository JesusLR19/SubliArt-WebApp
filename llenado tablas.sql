INSERT INTO contacto (calle, numero, colonia, cp, referencias, num_telefonico) VALUES
    ('Calle 26', '6', 'Costa Verde', 94294, 'Torre de departamentos', '7831148376'),
    ('Adolfo Lopez Mateos', '31', 'Del Valle', 92875, 'Porton blanco', '2293015889');

INSERT INTO rol (nombre_rol, descripcion) VALUES
    ('Administrador', 'Acceso'),
    ('Usuario', 'Acceso a compras y foro de pagina');

INSERT INTO usuarios (nombre, apellido_p, apellido_m, username, password, id_contacto, id_rol, estatus) VALUES
    ('Jesus Eduardo', 'Lopez', 'Rodriguez', 'jesuslr', '12345', 1, 1, true),
    ('Holly Abigail', 'Huerta', 'Prado', 'hollycg', '12345', 2, 2, true);

INSERT INTO descripcion_producto (color, talla, material) VALUES
    ('Negro', 'M','Poliester'),
    ('Blanco', 'L', 'Algodon');

INSERT INTO categoria_producto (nombre_categoria, descripcion) VALUES
    ('SlimFit', 'Camiseta clasica espalda ancha y cadera estrecha'),
    ('MuscleFit', 'Marcar mejor la musculatura del individuo'),
    ('RelaxedFit', 'La mejor version para comodidad'),
    ('VintageFit', 'Corte de playera con cuello mas redondo y diametro pequeño');

INSERT INTO productos (nombre_producto, id_descripcion, id_categoria, precio) VALUES
    ('Camiseta Personalizada', 1, 1, 299.99),
    ('Playera Personalizada', 2, 3, 299.99);

INSERT INTO pedidos (id_usuario, total_productos, total_mxn, estatus) VALUES
    (1, 2, 1199.98, true),
    (1, 1, 699.99, true);

INSERT INTO almacen (id_producto, cantidad, estatus) VALUES
    (1, 50, true),
    (2, 30, true);
