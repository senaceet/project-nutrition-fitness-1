create database nfb;
use nfb;

-- tabla rol
create table rol(
id_rol smallint not null,
Nombre_rol varchar(30) not null,
primary key (id_rol)
);

-- tabla usuario
create table usuario (
numero_doc_usuario bigint not null,
nombre_usuario varchar(50) not null,
apellido_usuario varchar (50) not null,
email varchar(70) not null,
direccion_usu varchar(50) not null,
contraseña varchar(50) not null,
ciudad varchar(40) not null,
celular bigint not null,
-- llaves o campos que pasaran a foraneos
fkid_rol smallint not null,
fkid_tipo_documento smallint not null,

);

-- tabla documento
create table tip_documento(
id_tipo_documento smallint not null,
des_documento varchar(25) not null,
primary key (id_tipo_documento)
);

-- tabla medio de pago
create table medio_de_pago (
id_pago int not null,
nombre_tipo_pago varchar (50)
);

 -- tabla categoria
create table categoria(
id_categoria bigint not null,
tipo_categoria varchar(25)not null,
primary key (id_categoria) 
);

-- tabla servidor
create table servidor_correo (
id_servidor bigint not null,
nombre_servidor varchar(30) not null,
primary key (id_servidor)
);

-- tabla log_error
create table log_error(
id_error bigint not null,
descripcion_error varchar(25)  not null,
fecha_error date not null,
hora_error time not null,
primary key (id_error)
);

-- tabla carro de compras
create table carro_compras (
id_carro_compra int not null,
cantidad_productos int not null,
total_compra bigint not null
);

-- tabla Factura 
create table factura (
id_fac int not null,
Precio_fac int not null,
-- campos foraneos 
fkid_pago int not null,
fknumero_doc_usuario bigint not null,
fkid_tipo_documento smallint not null,
fecha date not null,
hora time not null,
fkcodigo_producto int not null,
fkid_categoria bigint not null,
fkid_carro_compra int not null
);

-- tabla Envio 
create table envio (
id_envio bigint not null,
id_fac int not null,
fknumero_doc_usuario bigint not null,
fkid_tipo_documento smallint not null,
fkcodigo_producto int not null,
fkid_categoria bigint not null,
fkid_carro_compra int not null
);

-- tabla producto
create table producto(
codigo_producto int not null,
nom_producto varchar(100) not null,
precio_producto int not null,
descripcion_producto text,
imagen_producto varbinary,
-- campos foraneos
fkid_categoria bigint not null
);

-- tabla producto - carro compras
create table producto_carro_compras(
fkcodigo_producto int not null,
fkid_categoria bigint not null,
fkid_carro_compra int not null
);

-- relaciones carro de compras
alter table carro_compras add primary key(id_carro_compra);

-- relaciones producto
alter table producto add constraint FK_categoria_producto foreign key (fkid_categoria) references categoria(id_categoria) on update cascade;
alter table producto add primary key (fkid_categoria, codigo_producto); 

-- relaciones producto - carro compras
alter table producto_carro_compras add constraint FK_producto_carro_compras foreign key (fkid_categoria, fkcodigo_producto ) references producto(fkid_categoria, codigo_producto) on update cascade;
alter table producto_carro_compras add constraint FK_carro_compras_producto foreign key (fkid_carro_compra) references carro_compras(id_carro_compra);
alter table producto_carro_compras add primary key(fkcodigo_producto, fkid_categoria, fkid_carro_compra);

-- relaciones tabla usuario
alter table usuario add constraint FK_usuario_tip_documento foreign key (fkid_tipo_documento) references tip_documento(id_tipo_documento) on update cascade;
alter table usuario add constraint FK_usuario_rol foreign key (fkid_rol) references rol(id_rol) on update cascade;
alter table usuario add primary key (fkid_tipo_documento,numero_doc_usuario);

-- relaciones medio de pago
alter table medio_de_pago add primary key(id_pago);

-- relaciones factura
alter table factura add constraint FK_factura_medio_de_pago foreign key (fkid_pago) references medio_de_pago(id_pago) on update cascade;
alter table factura add constraint FK_usuario foreign key (fkid_tipo_documento, fknumero_doc_usuario) references usuario(fkid_tipo_documento, numero_doc_usuario) on update cascade ;
alter table factura add constraint FK_factura_producto_carro_compras foreign key (fkcodigo_producto,fkid_categoria,fkid_carro_compra) references producto_carro_compras(fkcodigo_producto,fkid_categoria,fkid_carro_compra) on update cascade ;
alter table factura add primary key(fkcodigo_producto,fkid_categoria,fkid_carro_compra,fkid_tipo_documento,fknumero_doc_usuario, id_fac);

-- relaciones envio
alter table envio add constraint FK_envio_factura foreign key (fkcodigo_producto,fkid_categoria,fkid_carro_compra,fkid_tipo_documento,fknumero_doc_usuario, id_fac) references factura (fkcodigo_producto,fkid_categoria,fkid_carro_compra,fkid_tipo_documento,fknumero_doc_usuario, id_fac) on update cascade;
alter table envio add primary key (fkcodigo_producto,fkid_categoria,fkid_carro_compra,fkid_tipo_documento,fknumero_doc_usuario, id_fac, id_envio);