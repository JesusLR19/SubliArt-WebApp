-- Tabla Direccion
create table if not exists direccion(
	id_direccion serial primary key,
	calle varchar (50) not null,
	numero int not null,
	colonia varchar(50) not null,
	cp int not null,
	referencias varchar(255)
);
create table if not exists contacto(
	id_contacto serial primary key,
	id_usuario int,
	id_direccion int,
	num_telefonico int(10) not null,
	constraint fk_id_usuario
	foreign key(id_usuario)
	references usuario(id_usuario)
	constraint fk_id_direccion
	foreign key(id_direccion)
	references direccion(id_direccion)
	ON DELETE RESTRICT 
	ON UPDATE CASCADE
);

create table if not exists usuarios(
	id_usuario serial primary key,
	nombre varchar(50) not null,
	apellido_p varchar(50) not null,
	apellido_m varchar(50) not null,
	id_contacto int,
	id_rol int,
	username varchar(20) not null unique,
	password varchar(50) not null,
	constraint fk_id_rol foreign key(id_rol) references rol(id_rol)
	constraint fk_id_direccion foreign key(id_direccion) references direccion(id_direccion)
	ON DELETE RESTRICT
	ON UPDATE CASCADE
);

create table if not exists rol(
	id_rol serial primary key,
	descripcion varchar(255) not null
);

create table if not exists descripcion_pedido(
	id_descripcion serial primary key,
	estilo varchar(50) not null,
	color varchar(50) not null,
	talla varchar(50) not null
);

create table if not exists categoria_producto(
	id_categoria serial primary key,
	nombre_categoria varchar(50) not null,
	descripcion text
);

create table if not exists productos(
	id_producto serial primary key,
	nombre_producto varchar(50),
	id_descripcion int,
	id_categoria int,
	precio float,
	constraint fk_id_descripcion foreign key(id_descripcion) references descripcion_pedido(id_descripcion)
	constraint fk_id_categoria foreign key(id_categoria) references categoria_producto(id_categoria)
	ON DELETE RESTRICT 
	ON UPDATE CASCADE
);

create table if not exists pedidos(
	id_pedido serial primary key,
	total_productos int not null,
	total_mxn float
);

create table if not exists almacen(
	id_producto serial primary key,
	cantidad int not null,
	estatus boolean
);





