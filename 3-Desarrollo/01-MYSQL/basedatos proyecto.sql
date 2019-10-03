create database nfb;
use nfb;

-- tabla rol
create table nfb.rol(
id_rol smallint not null,
Nombre_rol varchar(30) not null,
primary key (id_rol)
);

-- tabla usuario
create table nfb.usuario (
numero_doc_usuario bigint not null,
nombre_usuario varchar(50)not null,
apellido_usuario varchar (50)not null,
email varchar(70) not null,
direccion_usu varchar(50),
contraseña varchar(50),
ciudad varchar(40),
celular bigint(11),
-- llaves o campos que pasaran a foraneos
fkid_rol smallint not null,
fkid_tipo_documento smallint not null
);

-- tabla documento
create table nfb.tip_documento(
id_tipo_documento smallint not null,
des_documento varchar(25) not null,
primary key (id_tipo_documento)
);

-- tabla medio de pago
create table nfb.medio_de_pago (
id_pago smallint not null,
nombre_tipo_pago varchar (50)
);

 -- tabla categoria
create table nfb.categoria(
id_categoria bigint not null,
tipo_categoria varchar(25)not null,
primary key (id_categoria) 
);

-- tabla servidor
create table nfb.servidor_correo (
id_servidor bigint not null,
nombre_servidor varchar(30) not null,
primary key (id_servidor)
);

-- tabla log_error
create table nfb.log_error(
id_error bigint not null,
descripcion_error varchar(25)  not null,
fecha_error date not null,
hora_error time not null,
primary key (id_error)
);

-- tabla carro de compras
create table nfb.carro_compras (
id_carro_compra int(11) not null,
cantidad_productos int(30) not null,
total_compra int(10) not null
);

-- tabla Factura 
create table nfb.factura (
id_fac int(11) not null,
Precio_fac bigint not null,
-- campos foraneos 
fkid_pago smallint not null,
fknumero_doc_usuario bigint not null,
fkid_tipo_documento smallint not null,
fecha datetime not null,
fkid_carro_compra int(11) not null
);

-- tabla Envio 
create table nfb.envio (
id_envio bigint not null,
fkid_tipo_documento smallint not null,
fknumero_doc_usuario bigint not null, 
fkid_carro_compra int(11) not null, 
id_fac int(11) not null
);

-- tabla producto
create table nfb.producto(
codigo_producto int(20) not null,
nom_producto varchar(100) not null,
precio_producto int(11) not null,
descripcion_producto text,
imagen_producto blob,
-- campos foraneos
fkid_categoria bigint not null
);

-- tabla producto - carro compras
create table nfb.producto_carro_compras(
fkcodigo_producto int(20) not null,
fkid_categoria bigint not null,
fkid_carro_compra int(11) not null
);

-- relaciones carro de compras
alter table nfb.carro_compras add primary key(id_carro_compra);

-- relaciones producto
alter table nfb.producto add constraint FK_categoria_producto foreign key (fkid_categoria) references nfb.categoria(id_categoria) on update cascade;
alter table nfb.producto add index FK_categoria_producto_idx(fkid_categoria);
alter table nfb.producto add primary key (fkid_categoria, codigo_producto); 

-- relaciones producto - carro compras
alter table nfb.producto_carro_compras add constraint FK_producto_carro_compras foreign key (fkid_categoria, fkcodigo_producto ) references nfb.producto(fkid_categoria, codigo_producto) on update cascade;
alter table nfb.producto_carro_compras add index FK_producto_carro_compras_idx(fkcodigo_producto, fkid_categoria);
alter table nfb.producto_carro_compras add constraint FK_carro_compras_producto foreign key (fkid_carro_compra) references nfb.carro_compras(id_carro_compra);
alter table nfb.producto_carro_compras add index FK_carro_compras_producto_idx(fkid_carro_compra);
alter table nfb.producto_carro_compras add primary key(fkcodigo_producto, fkid_categoria, fkid_carro_compra);

-- relaciones tabla usuario
alter table nfb.usuario add constraint FK_usuario_tip_documento foreign key (fkid_tipo_documento) references nfb.tip_documento(id_tipo_documento) on update cascade;
alter table nfb.usuario add index FK_usuario_tip_documento_idx(fkid_tipo_documento);
alter table nfb.usuario add constraint FK_usuario_rol foreign key (fkid_rol) references nfb.rol(id_rol) on update cascade;
alter table nfb.usuario add index FK_usuario_rol_idx(fkid_rol);
alter table nfb.usuario add primary key (fkid_tipo_documento,numero_doc_usuario);

-- relaciones medio de pago
alter table nfb.medio_de_pago add primary key(id_pago);

-- relaciones factura
alter table nfb.factura add constraint FK_factura_medio_de_pago foreign key (fkid_pago) references nfb.medio_de_pago(id_pago) on update cascade;
alter table nfb.factura add index FK_factura_medio_de_pago_idx(fkid_pago);
alter table nfb.factura add constraint FK_factura_usuario foreign key (fkid_tipo_documento, fknumero_doc_usuario) references nfb.usuario(fkid_tipo_documento, numero_doc_usuario) on update cascade ;
alter table nfb.factura add index FK_factura_usuario_idx(fkid_tipo_documento,fknumero_doc_usuario);
alter table nfb.factura add constraint FK_factura_carro_compras foreign key (fkid_carro_compra) references nfb.carro_compras( id_carro_compra) on update cascade;
alter table nfb.factura add index FK_factura_carro_compras_idx(fkid_carro_compra);
alter table nfb.factura add primary key(fkid_tipo_documento,fknumero_doc_usuario,fkid_carro_compra, id_fac);

-- relaciones envio
alter table nfb.envio add constraint FK_envio_factura foreign key (fkid_tipo_documento,fknumero_doc_usuario,fkid_carro_compra, id_fac) references nfb.factura (fkid_tipo_documento,fknumero_doc_usuario,fkid_carro_compra, id_fac) on update cascade;
alter table nfb.envio add index FK_envio_factura_idx(fkid_tipo_documento,fknumero_doc_usuario,fkid_carro_compra, id_fac);
alter table nfb.envio add primary key (fkid_tipo_documento,fknumero_doc_usuario,fkid_carro_compra, id_fac, id_envio);