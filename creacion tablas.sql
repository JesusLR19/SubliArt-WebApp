-- Tabla Direccion
create table direccion(
	id_direccion serial primary key,
	calle varchar (50) not null,
	numero int not null,
	colonia varchar(50) not null,
	cp int not null,
	referencias varchar(255)
);
create table usuarios(
	id_usuario serial primary key,
	nombre varchar(50) not null,
	apellido_p varchar(50) not null,
	apellido_m varchar(50) not null,
	id_contacto int,
	username varchar(20) not null unique,
	password varchar(50) not null,
	constraint fk_id_direccion
	foreign key(id_direccion)
	references direccion(id_direccion)
	ON DELETE RESTRICT
	ON UPDATE CASCADE
);

create table rol(
	id_rol serial primary key,
	descripcion varchar(255) not null
);

create table contacto(
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



