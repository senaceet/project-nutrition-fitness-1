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
fkid_rol int not null,
fkid_planes int not null
);
 -- tabla administrador 
 create table administrador (
 id_administrador int not null,
 nombres varchar (50) not null,
 email varchar (30) not null,
 id_tipo_documento int ,
 -- llaves o campos que pasaran a foraneos 
 fkid_rol int not null
 
 );
 -- tabla tipo documento
 create table documento (
 id_tipo_documentos int ,
 desc_doc varchar (15),
 nombre_documento varchar (25),
 primary key (id_tipo_documentos)
 );
 
  -- tabla tipo documento administrador
 create table documentoadministrador (
 id_tipo_documento int ,
 desc_doc varchar (15),
 nombre_documento varchar (25),
 primary key (id_tipo_documento)
 );
 -- tabla plan 
 create table planes (
 id_planes int  not null,
 nombre_planes  varchar (20) not null,
 precio_mensual int  not null,
 duranciol_planes varchar (10) not null,
 cantidad_perfiles int   not null,
primary key (id_planes)
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
  imagen varbinary ,
  id_planes int not null,
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
  numero_temporada int  not null,
   id_serie int not null,
  primary key (id_temporada)
  );
  -- tabla peliculas 
  create table pelicula (
  id_pelicula int not null,
  nombre_pelicula varchar (50) not null,
  id_categoria int not null,
  año_estreno int not null,
  primary key (id_pelicula)
  );
  -- tabla capitulo
  create table capitulo (
  id_capitulo int not null,
  numero_capitulos int  not null,
  nombre_capitulo varchar (60) not null,
  id_temporada int not null, 
  primary key (id_capitulo)
  );
  -- tabla series 
  create table series (
  id_serie int not null,
  nombre_serie varchar(30) not null,
  fkid_categoria int not null,
  num_temporada int  not null,
  primary key (id_serie)
  );
-- tabla Factura 
create table factura (
id_fac int not null,
id_plan int  not null,
 precio_mensual int  not null,
-- campos foraneos 
id_pago int not null,
numero_documento varchar(20) not null,
id_tipo_documento int not null,
primary key (id_fac)
);

alter table administrador add  foreign key ( fkid_rol ) references rol(id_rol) on update cascade;



alter table administrador add  foreign key ( id_tipo_documento ) references documentoadministrador(id_tipo_documento) on update cascade;


alter table administrador add primary key ( id_administrador, id_tipo_documento); 

alter table usuario add  foreign key ( fkid_rol ) references rol(id_rol) on update cascade;


alter table usuario add  foreign key ( id_tipo_documento ) references documento( id_tipo_documentos ) on update cascade;


alter table usuario add primary key (fkid_rol , numero_documento,id_tipo_documento); 
 
alter table usuario add  foreign key (fkid_planes) references planes(id_planes ) on update cascade;


alter table perfil add foreign key (id_planes ) references planes( id_planes ) on update cascade;


alter table perfil add  foreign key (id_tipo_idioma ) references idioma( id_tipo_idioma ) on update cascade;


alter table perfil add primary key (id_plan,id_perfil ); 

alter table perfil add  foreign key (id_categoria) references categoria (id_categoria) on update cascade;


alter table series add  foreign key (fkid_categoria) references categoria(id_categoria) on update cascade;


alter table pelicula add  foreign key (id_categoria) references categoria(id_categoria) on update cascade;


alter table temporada add  foreign key (id_serie) references series(id_serie) on update cascade;


alter table capitulo add  foreign key (id_capitulo) references temporada(id_temporada) on update cascade;


alter table factura add  foreign key (id_plan) references planes(id_planes) on update cascade;


alter table factura add constraint FK_pago_factura foreign key (id_pago) references medio_de_pago(id_pago) on update cascade;


alter table factura add  foreign key (numero_documento,id_tipo_documento) references usuario (numero_documento,id_tipo_documento) on update cascade;



-- datos tabla rol
 insert into rol(id_rol, nombre_rol)
values (1,'administrador'),
       (2,'usuario');
      
-- datos administrador
insert into administrador (id_administrador, nombres, email,fkid_rol,id_tipo_documento)
values (1, 'Hernández Hernández Juan Carlos','herjuan@gmail.com',1,1), 
(2, 'García García María','koi12@gmail.com',1,2), 
(3, 'García García Juana','filo45@gmail.com',1,1),
(4, 'García Hernández José','poloa4@gmail.com',1,1), 
(5, 'García García José Luis','vilao45@gmail.com',1,1), 
(6, 'García García Juan','campo48@gmail.com',1,1), 
(7, 'García Martínez Miguel Ángel','kilo728@gmail.com',1,1), 
(8, 'Hernández Hernández Miguel','ñolo69@gmail.com',1,1), 
(9, 'Flores García Jesús','holpo782@gmail.com',1,2), 
(10, 'García Hernández José Luis','ciuda798@gmail.com',1,2), 
(11, 'García Hernández Juana','vilo10@gmail.com',1,3), 
(12, 'García Hernández María Guadalupe','rosa200@gmail.com',1,1), 
(13, 'García Hernández Pedro','xiomiri698@gmail.com',1,1), 
(14, 'García Martínez Alejandro','maloi1458@gmail.com',1,1), 
(15, 'Hernández Hernández Francisco','karina01@gmail.com',1,2), 
(16, 'Hernández Hernández Juana','seven3004@gmail.com',1,2), 
(17, 'Sánchez Hernández Alejandro','año154@gmail.com',1,2), 
(18, 'García García Margarita','viloapo@gmail.com',1,1), 
(19, 'García García Pedro','mijoi3@gmail.com',1,3), 
(20, 'García Hernández Guadalupe','xikilo70@gmail.com',1,2);

-- tipos de idioma
insert into idioma (id_tipo_idioma, tipo_idioma)
value (1,'frances'),
(2,'ingles'),
(3,'español');

-- datos de tabla documento
insert into documento (id_tipo_documentos, desc_doc , nombre_documento)
 values (1, 'cc', 'cadula ciudadania'),
 (2, 'ti', 'terjeta de identidad'),
 (3, 'ce' ,'cedula de extrajeria');
 
 -- datos de tabla documento adminstrador
insert into documentoadministrador (id_tipo_documento, desc_doc , nombre_documento)
 values (1, 'cc', 'cadula ciudadania'),
 (2, 'ti', 'terjeta de identidad'),
 (3, 'ce' ,'cedula de extrajeria');
 
 -- datos tabla plan
 insert into planes (id_planes, nombre_planes , precio_mensual, duranciol_planes,cantidad_perfiles)
 values (1,'basico', 19900,'30dias',1),
 (2,'estandar',24900,'30dias',2),
 (3,'premium',32900,'30dias',4);
 
 -- datos usuario
 insert into usuario (numero_documento, nombre, apellidos, email, contraseña, id_tipo_documento, fkid_rol, fkid_planes)
 values ('1000858503','Daniel Esteban','Martinez Naranjo','esteban200240@gmail.com','12345',2,2,3),
 ('1000728162','johan nabuzaradan','campos forero','jncampos2@gmail.com','123654',2,2,3),
 ('1192925073', 'Yuber Andres', 'Espinosa Guaneme', 'yaespinosa370@misena.edu.co', '2123', 1, 2, 3),
 ('1001201058','Sergio', 'Muñoz Rincon','sergitomuri19@gmail.com','456432135', 2,1,3 ),
 ('1003776965','jhon edier','gonzalez urrego','johngonxales@gmail.com','12345',2,2,2),
 ('1024104014','juan david','solo guitierres','juansolo@gmail.com','12348',2,2,2),
 ('1024896455','daniel felipe','vargas guzman','varagasguz@gmail.com','159357',2,2,2),
 ('1256647885','felipe Esteban','Molina Perez','felipemo7@misena.edu.co','456451',3,2,1),
 ('5641235432',' Karol Juliana','Acuña Lopez','karollopezacu@gmail.com','46542442',1,2,3),
 ('1220642319','Eduardo Alfonso','Alvaro Pacheco','Eduardopapa@gmail.com','242121',3,2,1),
 ('1000545652',' Ingrid Lorena','Arenalez Lopez','ingridarenalez@gmail.com','445562',2,2,3),
 ('1000856245','Julian Ferley','Barajas Gomez','barajasferley@gmail.com','456431',3,2,2),
 ('1230215321','Veyker Aldair','Barreto Ruz','beykerarlin@gmail.com','465465',2,2,1),
 ('1231546213',' Karen Dayana','Basto Pico','picodayana@gmail.com','354654543',1,2,2),
 ('1564321321',' Karen Yuliana','Bermudez Delgado','karendelgado@gmail.com','45675645',1,2,3),
 ('4546454655','Daniel Esteban','Buitrago Lozano','daniellozanobiu@gmail.com','456543418',2,2,3),
 ('4156461231','Silvia Juliana','Caceres Peralta','silviacaceres@gmail.com','45634',1,2,2),
 ('1005421332',' Karol Daniela','Corredor Duran ','karolcorredor@gmail.com','4562215',3,2,1),
 ('1004132213','Yohana','Delgado Contreras','delgadoyohanacon@gmail.com','54685413',3,2,2),
('1320320031',' Angel David','Delgado Sarmiento','angeldaviddelgado@gmail.com','51223',1,2,1);
 
 
-- datos tabla categoria
 insert into  categoria (id_categoria ,tipos_categorias)
 values(1,'accion'),
  (2,'animacion'),
  (3,'aventura'),
  (4,'biografia'),
  (5,'ciencia ficcion'),
  (6,'drama'),
  (7,'terror');

-- datos tabla perfil
insert into perfil(id_perfil ,nombre ,imagen ,id_planes,id_tipo_idioma ,id_categoria) 
values(1,'Daniel Esteban Martinez Naranjo',null,3,1,1),
 (2,'johan nabuzaradan campos forero',null,3,1,2),
 (3,'Yuber Andres Espinosa Guaneme',null, 3,3,5),
 (4,'Sergio Muñoz Rincon',null,3 ,2,7),
 (5,'jhon edier gonzalez urrego',null,2,3,6),
 (6,'juan david solo guitierres',null,2,3,4),
 (7,'daniel felipe vargas guzman',null,2,3,1),
(8,'felipe Esteban Molina Perez',null,1,1,2),
 (9,' Karol Juliana Acuña Lopez',null,3,1,3),
 (10,'Eduardo Alfonso Alvaro Pacheco',null,1,2,6),
 (11,' Ingrid Lorena Arenalez Lopez',null,3,2,4),
 (12,'Julian Ferley Barajas Gomez',null,2,3,2),
 (13,'Veyker Aldair Barreto Ruz',null,1,1,7),
 (14,' Karen Dayana Basto Pico',null,2,3,1),
 (15,' Karen Yuliana Bermudez Delgado',null,3,3,1),
 (16,'Daniel Esteba Buitrago Lozano',null,3,2,3),
 (17,'Silvia Juliana Caceres Peralta',null,2,1,2),
 (18,' Karol Daniela Corredor Duran ',null,1,1,4),
 (19,'Yohana Delgado Contreras',null,2,2,6),
(20,' Angel David Delgado Sarmiento',null,1,2,7);
 

 
 -- datos tabla series
 insert into series (id_serie ,nombre_serie,fkid_categoria,num_temporada)
 values(1,'los 7 pecados capitales',2,3),
 (2,'Unbreakable Kimmy Schmid',3,2),
 (3,'Kingdom',7,1),
 (4,'Examen de conciencia',4,2 ),
 (5,'Muñeca Rusa',3,1),
 (6,'Nightflyers ',5,1),
 (7,'The Umbrella Academy',1,1),
 (8,'la case de pael',1,3),
 (9,'After Life',3,4),
 (10,'Love, Death & Robots',5,2),
 (11,'The OA',5,1),
 (12,'On my block ',6,1),
 (13,'La casa de papel',1,2),
 (14,'The Crown',6,2),
 (15,'Narcos',1,1),
 (16,'Élite',6,3),
 (17,'Alta mar',3,2),
 (18,'Ozark',6,1),
 (19,'Luke Cage',1,2),
 (20,'Love',6,3);

-- datos tabla temporada
insert  into temporada (id_temporada , nombre_temporada ,numero_temporada,id_serie)
values(1,'the seven deably sins',1,1);


-- datos tabla capitulos
insert into capitulo (id_capitulo,numero_capitulos,nombre_capitulo,id_temporada) 
values(1,1,'Los Siete Pecados Capitales',1);

-- datos tabla pelicula
insert into pelicula(id_pelicula ,nombre_pelicula ,id_categoria,año_estreno)
values(1,'Avengers Infinity War',1,2019),
(2,'Pantera Negra',1,2018),
(3,'Un lugar en silencio',7,2015),
(4,'Misión imposible: repercusión',1,2016),
(5,'Isla de perros',2,2018),
(6,'Los increíbles 2',2,2018),
(7,'Ha nacido una estrella',6,2014),
(8,'Aniquilación',7,2015),
(9,'Bohemian Rhapsody: la historia de Freddie Mercury',4,2017),
(10,'Spider-Man: un nuevo universo',2,2017),
(11,'El primer hombre en la luna',3,2019),
(12,'Jurassic World: el reino caído',1,2014),
(13,'Ready Player One: comienza el juego',1,2017),
(14,'Roma',6,2018),
(15,'Rampage: devastación',1,2015),
(16,'Titanes del Pacífico la insurrección',1,2016),
(17,'Can You Ever Forgive Me',3,2016),
(18,'Chaplin',4,2015),
(19,'Misión rescate',5,2014),
(20,'Al Filo del Mañana',5,2012);

insert into medio_de_pago(id_pago,tipo_medio_pago)
values (1,'tajeta credito'),
      (2,'cuenta de ahorro'),
      (3,'tarjeta de regalo');	
	
insert into factura(id_fac,id_plan,precio_mensual,id_pago,numero_documento,id_tipo_documento)
values(1,3,32900,1,'1000858503',2),             
(2,3,32900,3,'1000728162',2),
(3,3,32900,3,'1192925073',1),
(4,3,32900,3,'1001201058',2),
(5,2,24900,2,'1003776965',2),
(6,2,24900,2,'1024104014',2),
(7,2,24900,2,'1024896455',2),
(8,1,19000,1,'1256647885',3),
(9,3,32900,3,'5641235432',1),
(10,1,19900,1,'1220642319',3),
(11,3,32900,3,'100054565,',2),
(12,2,24900,2,'1000856245',3),
(13,1,19000,1,'1230215321',2),
(14,2,24900,2,'1231546213',1),
(15,3,32900,3,'1564321321',1),
(16,3,32900,3,'4546454655',2),
(17,2,24900,2,'4156461231',1),
(18,1,19000,1,'1005421332',3),
(19,2,24900,2,'1004132213',3),
(20,1,19000,1,'1320320031',1);

     
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
