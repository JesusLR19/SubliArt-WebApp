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
    ('Confort,durabilidad y resistencia al mejor precio del mercado,si buscas una playera básica para serigrafía,bordado o cualquier otro proceso de decorado,estás en el lugar correcto.', 'M','100% Algodon'),
    ('La mejor playera deportiva con tecnología dry tech para hombre , nuestra nueva línea deportiva de manga larga es un producto básico, tanto para el uso personal como para uniformar o promocionar tu equipo.', 'M','100% Poliester'),
    ('Prueba nuestro fit con ajuste relajado y mangas holgadas, que te brindan mayor movilidad y estilo. Descubre el estilo sin límites con nuestros nuevos fit oversize. Con los mejores diseños y comodidad incomparable, nuestros fit oversize son la elección perfecta para destacar tu individualidad.', 'M','100% Algodon');

INSERT INTO categoria_producto (nombre_categoria, descripcion) VALUES
    ('Basica', 'Camiseta clasica medio holgada')
    ('SlimFit', 'Camiseta clasica espalda ancha y cadera estrecha'),
    ('MuscleFit', 'Marcar mejor la musculatura del individuo'),
    ('RelaxedFit', 'La mejor version para comodidad'),
    ('VintageFit', 'Corte de playera con cuello mas redondo y diametro pequeño');

INSERT INTO productos (nombre_producto, id_descripcion, id_categoria, precio) VALUES
    ('Basica-negra', 1, 1, 150),
    ('Basica-blanca', 1, 1, 150),
    ('Basica-caqui', 1, 1, 150),
    ('Basica-gris', 1, 1, 150),
    ('Basica-rosa', 1, 1, 150),
    ('Basica-vino', 1, 1, 150),
    ('Basica-roja', 1, 1, 150),
    ('Basica-azul', 1, 1, 150);
    ('Deportiva-blanca', 2, 2, 200),
    ('Deportiva-carbon', 2, 2, 200),
    ('Deportiva-negra', 2, 2, 200),
    ('Deportiva-roja', 2, 2, 200),
    ('Oversize-hueso', 3, 4, 200),
    ('Oversize-cafe', 3, 4, 200),
    ('Oversize-gris', 3, 4, 200),
    ('Oversize-vino', 3, 4, 200),


INSERT INTO pedidos (id_usuario, total_productos, total_mxn, estatus) VALUES
    (1, 2, 1199.98, true),
    (1, 1, 699.99, true);

INSERT INTO almacen (id_producto, cantidad, estatus) VALUES
    (1, 50, true),
    (2, 30, true);
