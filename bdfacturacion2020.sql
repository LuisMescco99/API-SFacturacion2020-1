create database bdfacturacion2020;

use bdfacturacion2020;

create table if not exists cliente(
	id int not null auto_increment primary key,
    ruc int not null,
    razonSocial varchar(45) not null,
    direccion varchar(45) not null,
    telefono varchar(45) null,
    correo varchar(45) not null,
    vista int null
)ENGINE=INNODB ;

create table if not exists usuario(
	id int not null auto_increment primary key,
    apellidos varchar(45) not null,
    nombres varchar(45) not null,
    correo varchar(45) not null,
    dni int not null,
    telefono int null,
    rol int not null,
    vista int null
)ENGINE=InnoDB;

create table if not exists marca(
	id int not null auto_increment primary key,
    descripcion varchar(45) null,
    vista int null
)ENGINE=InnoDB;

create table if not exists categoria(
	id int not null auto_increment primary key,
    decripcion varchar(45) null,
    vista int null
)ENGINE=InnoDB;

create table if not exists factura(
	id int not null auto_increment primary key,
    numero int not null,
    fecha date not null,
    tipo int not null,
    estado int not null,
    subtotal decimal(5,2),
    igv decimal(5,2),
    total decimal(5,2),
    tipoPago int not null,
    vista int null,
    cliente_id int not null,
    usuario_id int not null,
    foreign key(cliente_id) references cliente(id),
    foreign key(usuario_id) references usuario(id)
)ENGINE=InnoDB;

create table if not exists articulo(
	id int not null auto_increment primary key,
    descripcion varchar(45) null,
    precio decimal(4,2)not null,
    stock int not null,
    vista int null,
    marca_id int not null,
    categoria_id int not null,
    foreign key(marca_id) references marca(id),
    foreign key(categoria_id) references categoria(id)
)ENGINE=InnoDB;

create table if not exists detalle(
	id int not null auto_increment primary key,
    precio decimal(5,2) not null,
    cantidad int not null,
    articulo_id int not null,
    factura_id int not null,
    foreign key(articulo_id) references articulo(id),
    foreign key(factura_id) references factura(id)
);
