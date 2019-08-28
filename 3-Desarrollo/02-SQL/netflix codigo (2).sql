-- BASE DE DATOS DE NETFLIX
 create database netflix1;
 use netflix1;
 -- tabla rol
 create table rol (
 id_rol int not null,
 nombre_rol varchar (15) not null ,
 primary key (id_rol)
 );
 
 -- tabla usuario
 create table usuario(
 numero_documento varchar(20) not null,
 nombre varchar (50) not null,
 apellidos varchar(50) not null,
 email varchar (50) not null,
 contraseña varchar (50) not null,
-- campos o llaves que se convertiran en foraneas
id_tipo_documento int not null,
fkid_rol int(5) not null,
fkid_plan int (5) not null
);
 -- tabla administrador 
 create table administrador (
 id_administrador int not null,
 nombres varchar (50) not null,
 email varchar (30) not null,
 id_tipo_documento int (50),
 -- llaves o campos que pasaran a foraneos 
 fkid_rol int not null
 
 );
 -- tabla tipo documento
 create table documento (
 id_tipo_documentos int (50),
 desc_doc varchar (15),
 nombre_documento varchar (25),
 primary key (id_tipo_documentos)
 );
 
  -- tabla tipo documento administrador
 create table documentoadministrador (
 id_tipo_documento int (50),
 desc_doc varchar (15),
 nombre_documento varchar (25),
 primary key (id_tipo_documento)
 );
 -- tabla plan 
 create table plan (
 id_plan int (5) not null,
 nombre_plan  varchar (20) not null,
 precio_mensual int (5) not null,
 duranciol_plan varchar (10) not null,
 cantidad_perfiles int (1)  not null,
primary key (id_plan)
);
-- tabla medio de pago
create table medio_de_pago (
id_pago int not null,
tipo_medio_pago varchar(50)not null,
  primary key (id_pago)
);

-- tabla perfil
  create table perfil (
  id_perfil int not null,
  nombre varchar (50) not null,
  imagen blob ,
  id_plan int not null,
  id_tipo_idioma int not null,
  id_categoria int not null
  );
  -- tabla idioma 
  create table idioma ( 
  id_tipo_idioma int not null,
  tipo_idioma varchar (30) not null,
  primary key (id_tipo_idioma)
  );
  -- tabla categoria 
  create table categoria (
  id_categoria int not null,
  tipos_categorias varchar (30) not null,
   primary key (id_categoria)
  );
  -- tabla  temporadas
  create table temporada (
  id_temporada int not null, 
  nombre_temporada varchar (40),
  numero_temporada int (10) not null,
   id_serie int not null,
  primary key (id_temporada)
  );
  -- tabla peliculas 
  create table pelicula (
  id_pelicula int not null,
  nombre_pelicula varchar (50) not null,
  id_categoria int not null,
  año_estreno int(10) not null,
  primary key (id_pelicula)
  );
  -- tabla capitulo
  create table capitulo (
  id_capitulo int not null,
  numero_capitulos int (20) not null,
  nombre_capitulo varchar (60) not null,
  id_temporada int not null, 
  primary key (id_capitulo)
  );
  -- tabla series 
  create table series (
  id_serie int not null,
  nombre_serie varchar(30) not null,
  fkid_categoria int not null,
  num_temporada int (5) not null,
  primary key (id_serie)
  );
-- tabla Factura 
create table factura (
id_fac int(11) not null,
id_plan int (5) not null,
 precio_mensual int (5) not null,
-- campos foraneos 
id_pago int not null,
numero_documento varchar(20) not null,
id_tipo_documento int not null,
primary key (id_fac)
);

alter table administrador add constraint FK_rol_administrador foreign key ( fkid_rol ) references rol(id_rol) on update cascade;
alter table administrador add index FK_rol_administrador_idx(fkid_rol);


alter table administrador add constraint FK_docuemntoadmin_administrador foreign key ( id_tipo_documento ) references documentoadministrador(id_tipo_documento) on update cascade;
alter table administrador add index docuemntoadmin_idx(id_tipo_documento);

alter table administrador add primary key ( id_administrador, id_tipo_documento); 

alter table usuario add constraint FK_usuario_rol foreign key ( fkid_rol ) references rol(id_rol) on update cascade;
alter table usuario add index FK_rol_administrador_idx(fkid_rol);

alter table usuario add constraint FK_usuario_documento foreign key ( id_tipo_documento ) references documento( id_tipo_documentos ) on update cascade;
alter table usuario add index FK_rol_documento_idx( id_tipo_documento );

alter table usuario add primary key (fkid_rol , numero_documento,id_tipo_documento); 
 
alter table usuario add constraint FK_usuario_plan foreign key (fkid_plan) references plan(id_plan ) on update cascade;
alter table usuario add index FK_usuario_plan_idx( fkid_plan);

alter table perfil add constraint FK_perfil_plan foreign key (id_plan ) references plan( id_plan ) on update cascade;
alter table perfil add index FK_perfil_plan_idx(  id_plan );

alter table perfil add constraint FK_perfil_idioma foreign key (id_tipo_idioma ) references idioma( id_tipo_idioma ) on update cascade;
alter table perfil add index FK_perfil_idioma_idx( id_tipo_idioma );

alter table perfil add primary key (id_plan,id_perfil ); 

alter table perfil add constraint FK_perfil_categoria foreign key (id_categoria) references categoria (id_categoria) on update cascade;
alter table perfil add index FK_perfil_categorial_idx(id_categoria);

alter table series add constraint FK_serie_categoria foreign key (fkid_categoria) references categoria(id_categoria) on update cascade;
alter table series add index FK_serie_categoria_idx(fkid_categoria);

alter table pelicula add constraint FK_pelicula_categoria foreign key (id_categoria) references categoria(id_categoria) on update cascade;
alter table pelicula add index FK_pelicula_categoria_idx(id_categoria);

alter table temporada add constraint FK_temporada_serie foreign key (id_serie) references series(id_serie) on update cascade;
alter table temporada add index FK_temporada_serie_idx(id_serie );

alter table capitulo add constraint FK_temporada_capitulo foreign key (id_capitulo) references temporada(id_temporada) on update cascade;
alter table capitulo add index FK_temporada_capitulo_idx(id_capitulo );

alter table factura add constraint FK_plan_factura foreign key (id_plan) references plan(id_plan) on update cascade;
alter table factura add index FK_plan_factura_idx(id_plan);

alter table factura add constraint FK_pago_factura foreign key (id_pago) references medio_de_pago(id_pago) on update cascade;
alter table factura add index FK_pago_factura_idx(id_pago);

alter table factura add constraint FK_usuario_factura foreign key (numero_documento,id_tipo_documento) references usuario (numero_documento,id_tipo_documento) on update cascade;
alter table factura add index FK_usuario_factura_idx(numero_documento,id_tipo_documento);