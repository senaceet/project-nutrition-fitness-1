use nfb;

insert into tip_documento(id_tipo_documento,des_documento)
values (1, 'cedula ciudadania' ),
	   (2, 'cedula extranjeria' ),
       (3, 'tarjeta identidad');
	
insert into rol(id_rol,Nombre_rol)
values (01,'administrador'),
       (02,'cliente');
       
insert into usuario (numero_doc_usuario,fkid_tipo_documento,nombre_usuario,apellido_usuario,contraseña,email,celular,direccion_usu,ciudad,fkid_rol)
values (1000806278,1,'brandon dilan','garzon gomez','holamundo','bdgarzon87@gmail.com',3192605218,'Carrera 3 # 18-45','bogota',01 ),
	   (100120158,2,'sergio alejandro','muñoz rincon','sergitoxdxd','xdxdser45@gmail.com',1023456987,'Carrera 7 # 84-72','medellin',02),
       (1003776965,2,'jhon edier','gonzalez urrego','@jhon@1003776965','gonzalo569@gmail.com',4569871230,'Calle 4 No. 5–10','cali',01),
       (1000128162,1,'jhojan nabuzaradan','campos forero','sigume7645','nabu1457@gmail.com',1245789631,'Calle 11 No. 4 - 14','villavicencio',02),
       (1000858503,1,'daniel estevan','martinez naranjo','soydani98','danielo147@gmail.com',4587123032,'Calle 24 N° 5-60','santa_marta',01),
       (1000231458,2,'juver andrez','rodriquez leon','leona0214','slonaconal4@gmail.com',4567893214,'Av. Ciudad de Cali No. 6C-09','cartagena',02),
       (1478931024,1,'duvan mauricion','bernal sanchez','sanchopansa','dunvan45@gmail.com',1547896321,'Calle 48b sur No. 21-13','cucuta',01),
       (10002469301,1,'devid sebastian','bareño leon','soloagua','garzleonseb@gmail.com',3971012034,'Avenida Cra. 60 No. 57-60','manizales',02),
       (12647890234,2,'laura natali','perez ramos','ponkeramo','laurita12@gmail.com',1478965412,'Calle 11 No. 4-21 / 93','pasto',01),
       (1024598715,2,'sara valentina','salcedo gomez','solosalsa','valentho4@gmail.com',3145602102,'Calle 10 No. 5-22','ibague',02),
       (1015497863,1,'santiago andres','garcia gimenez','locoo','locos22@gmail.com',3212198158,'Carrera 20 No. 37-54','tunja',01),
	   (1001234567,1,'andres armando','rodriguez parra','gyuazon','batman111@gmail.com',3112451458,'Av. Calle 19 N° 2-49 Centro','popayan',02),	
	   (1078964512,2,'andres felipe','ordoñez palacios','catmen','gatitos66@gmail.com',3224567895,'Calle 109a N° 17-10 Sede Norte','neiva',01),
       (1037764580,1,'favian enrique','lopez moreno','soloo999','andres_2000@gmail.com',3114562828,'Cr.8a # 15-63','bucaramanga',02),
       (1001456737,1,'daniel stiven','gonzalez ordoñez','problems','danielg_777@gmail.com',3214231578,'Cr.9 # 74-99','cali',01),
       (1002667907,1,'brayan mateo','guacho pardo','animals','brayan_999@gmail.com',3114778596,'Carrera 1 Este No. 17 01','yopal',02),
       (1000123456,2,'bryan andres','torres flores','asd12345','bryan_888@gmail.com',3197154678,'Cr.6 # 17-12','leticia',01),
       (1011456723,1,'camilo alejandro','perez ordoñez','mnb1234','ccc_222@gmail.com',3114567892,'Calle 12# 2-65','tumaco',02),
       (1000124547,2,'daniel mateo','lopez hernandez','helloworld','alvrt@gmail.com',3117531597,'Cl.119 # 15-41','bello',01),
       (1014567891,2,'claudia marcela','martinez galeano','bbb12345','claudiaeducacion@gmail.com',3191597864,'Cl.45 # 18 -27','bogota',02);
       
insert into categoria(id_categoria,tipo_categoria)
values (100,'belleza'),
       (200,'medicina_alternativa'),
       (300,'suplementos_deportivos');
       
insert into log_error(id_error,descripcion_error,fecha_error,hora_error)
values (1500,'no_funciona','14/02/18','07:02:20'),
       (1600,'error_administrador','19/07/20','09:04:45'),
       (1700,'no_funciona','14/02/18','2:20:00');
       
insert into producto(codigo_producto,nom_producto,precio_producto,descripcion_producto,imagen_producto,fkid_categoria)
values (1254,'inmunocal mx aislado de proteina de suero de leche con cisteina',300000,'Poderoso antioxidante ideal para deportistas para un mayor rendimiento',('C:\Users\Public\Pictures\12'),100),
	   (1897,'Amino X Bsn',690000,'Poderoso antioxidante ideal para deportistas para un mayor rendimiento',('C:\Users\Public\Pictures\17'),300),
       (5478,'PRO T-F',231000,'Una de las proteínas más avanzadas y efectivas disponibles para ayudarte a transformar tu cuerpo, optimizar tu rendimiento y respaldar tu sistema inmunitario',('C:\Users\Public\Pictures\14'),200),
       (7894,'WHEY GOLD STANDARD',100000,'Proteína de alta calidad biológica es una de las marcas más reconocidas y consumidas del mercado, una sola dosis aporta 24 gr de proteína pura y de fácil absorción',('C:\Users\Public\Pictures\11'),300),
       (4578,'BEBIDA DEPORTIVA PX - G',55000,'Bebida para deportistas Con péptidos de colágeno hidrolizado Proporciona electrolitos, sodios, potasio y calcio, con proteína de colágeno y proteína de sueroExcelente fuente de vitamina C y de vitamina E',('C:\Users\Public\Pictures\16'),100),
       (3654,'TNT MEGA MASS GAINE',100000,'Proteína Hipercalórica e Hiperprotéica para aumento de masa muscular y volumen, TNT MEGA MASS GAINER es una potente fórmula patentada con materia prima importada de máxima calidad con una tabla nutricional única.',('C:\Users\Public\Pictures\03'),100),
       (7895,'beta-sitostero',29999,'Complejo de esteroles vegetalescon beta-sitosterol (por dosis), 1200 mg, 120 Cápsulas',null,200),
       (3214,'KISSKISS GUERLAIN',117000,'El rojo de labios KissKiss de Guerlain vuelve a sorprendernos esta primavera vistiéndose con un estuche',('C:\Users\Public\Pictures\01'),100),
       (4578,'Iso 100 Dymatize',213000,'Apoya la construcción de músculo, protege la musculatura, ayuda a recuperar de forma rápida. Con nuevo sabor delicioso, 100% hidrolizado de proteína de suero aislado, una de las formas de proteína más puras',('C:\Users\Public\Pictures\04'),200),
	   (6547,'WHEY ELITE',235999,'Elite Whey Protein es un producto que combina aislado y concentrado de suero para proporcionar una proteína de gran calidad a un precio muy atractivo',('C:\Users\Public\Pictures\05'),300),
       (9874,'GNC MEGA MEN SPORT',137000,'es un Multivitaminíco especial para deportistas que ayuda a mejorar el rendimiento físico',('C:\Users\Public\Pictures\06'),100),
       (7894,'THE SPORT FORMULA',254000,'Fórmula deporte diario de multivitaminas Bono BCAA Aminoácidos en Polvo Cápsulas para hombres y mujeres.',('C:\Users\Public\Pictures\07'),200),
       (2364,'Ergogenix Ergomulti',113000,'La proteína de absorción rápida y los carbohidratos adquieren fórmula con un racimo de patente patentado.',('C:\Users\Public\Pictures\08'),300),
	   (8974,'ANIMALl PAK',174000,'Deportes De Vitaminas Nutricionales Con Aminoácidos, Antioxidantes, Enzimas Digestivas',('C:\Users\Public\Pictures\09'),200),
       (1254,'GNC MEGA MEN SPORT',137000,'es un Multivitaminíco especial para deportistas que ayuda a mejorar el rendimiento físico',('C:\Users\Public\Pictures\10'),300),
       (2310,'THE SPORT FORMULA',254000,'Fórmula deporte diario de multivitaminas Bono BCAA Aminoácidos en Polvo Cápsulas para hombres y mujeres. ',('C:\Users\Public\Pictures\12'),100),
       (4875,'Ergogenix Ergomulti ',113000,'La proteína de absorción rápida y los carbohidratos adquieren fórmula con un racimo de patente patentado',('C:\Users\Public\Pictures\13'),100),
       (4454,'ANIMALl PAK',254000,'Deportes De Vitaminas Nutricionales Con Aminoácidos, Antioxidantes, Enzimas Digestivas',('C:\Users\Public\Pictures\15'),200),
       (4897,'ALPHA AMINO',80000,'Ayuda a incrementar la energía potencial cuando más se necesita y mejora el rendimiento yla hidratación.',('C:\Users\Public\Pictures\19'),100);

insert into medio_de_pago(id_pago,nombre_tipo_pago)
values (0001,'tajeta credito'),
       (0002,'cuenta de ahorro');
 
insert into carro_compras (id_carro_compra,cantidad_productos,total_compra)
values (11111,1,300000),
	   (22222,3,690000),
       (33333,5,231000),
       (44444,7,100000),
       (55555,8,55000),
       (66666,10,100000),
       (77777,2,29999),
       (11110,0,117000),
       (10111,9,213000),
       (11112,4,235999),
       (11113,4,137000),
	   (11114,12,254000),	
	   (11115,9,113000),
       (11116,9,174000),
       (11117,6,137000),
       (11118,45,254000),
       (11119,11,113000),
       (11120,10,254000),
       (11121,12,80000),
       (11122,19,113000); 
 
insert into producto_carro_compras(fkcodigo_producto,fkid_categoria,fkid_carro_compra) 
values (1254,100,11111),
	   (1897,300,22222),
       (5478,200,33333),
       (7894,300,44444),
       (4578,100,55555),
       (3654,100,66666),
       (7895,200,77777),
       (3214,100,11110),
       (4578,200,10111),
       (6547,300,11112),
       (9874,100,11113),
       (7894,200,11114),
       (2364,300,11115),
       (8974,200,11116),
       (1254,300,11117),
       (2310,100,11118),
       (4875,100,11119),
       (4454,200,11120),
       (4897,100,11121);
       
insert into servidor_correo(id_servidor,nombre_servidor)
values (0101,'Gmail'),
       (0202,'Outlook');
       
insert into factura (id_fac ,  Precio_fac,  fkid_pago,  fknumero_doc_usuario,  fkid_tipo_documento,  fecha,  fkcodigo_producto,   fkid_categoria,  fkid_carro_compra)
values (9901,300000,0001,1000806278,1,'2019-05-24-05:45',1254,100,11111),
	   (9902,690000,0001,100120158,1,'2020-06-13-05:45',1897,300,22222),
       (9903,231000,0002,1003776965,2,'2018-05-5-05:45',5478,200,33333),
       (9904,100000,0001,1000128162,3,'2019-05-12-05:45',7894,300,44444),
       (9905,55000,0002,1000858503,2,'2019-03-2-05:45',4578,100,55555),
       (9906,100000,0002,1000231458,2,'2020-01-1-05:45',3654,100,66666),
       (9907,299990,0001,1478931024,1,'2019-11-28-05:45',7895,200,77777),
       (9908,117000,0002,10002469301,3,'2019-12-24-05:45',3214,100,11110),
       (9909,213000,0001,12647890234,1,'2019-09-2-05:45',4578,200,10111),
       (9910,235999,0002,1024598715,3,'2019-01-02-05:45',6547,300,11112),
       (9911,137000,0001,1015497863,2,'2020-03-14-05:45',9874,100,11113),
	   (9912,254000,0001,1001234567,2,'2019-09-17-05:45',7894,200,11114),	
	   (9913,113000,0001,1078964512,1,'2019-01-24-05:45',2364,300,11115),
       (9914,174000,0002,1037764580,3,'2020-02-25-05:45',8974,200,11116),
       (9915,137000,0001,1001456737,1,'2019-02-25-05:45',1254,300,11117),
       (9916,254000,0002,1002667907,1,'2020-02-03-05:45',2310,100,11118),
       (9917,113000,0001,1000123456,1,'2019-08-20-05:45',4875,100,11119),
       (9918,254000,0002,1011456723,3,'2019-04-05-05:45',4454,200,11120),
       (9919,800000,0001,1000124547,2,'2019-07-06-05:45',4897,100,11121);
       
insert into envio (id_envio,id_fac,fkid_pago,fkid_tipo_documento,fknumero_doc_usuario,fkcodigo_producto,fkid_categoria,fkid_carro_compra)
values (1895478932145789632,9901,0001,1,1000806278,1254,100,11111),
       (1897896452002145787,9902,0002,2,100120158,1897,300,22222),
       (8489494956684833468,9903,0001,2,1003776965,5478,200,33333),
       (1895478963245345632,9904,0002,1,1000128162,7894,300,44444),
       (1897896451203424787,9905,0001,1,1000858503,4578,100,55555),
       (8489494956353644468,9906,0002,2,1000231458,3654,100,66666),
       (1895478345345349632,9907,0001,1,1478931024,7895,200,77777),
       (1845343451200215787,9908,0002,1,10002469301,3214,100,11110),
       (8489446345875634468,9909,0001,2,12647890234,4578,200,10111),
       (1895236535463453932,9910,0002,2,1024598715,6547,300,11112),
       (1897891365432632577,9911,0001,1,1015497863,9874,100,11113),
       (8489421356432534468,9912,0002,1,1001234567,7894,200,11114),
       (1895443654763319632,9913,0001,2,1078964512,2364,300,11115),
       (2354516535233345787,9914,0002,1,1037764580,8974,200,11116),
       (8325236534338644682,9915,0001,1,1001456737,1254,300,11117),
       (1435143532412343213,9916,0002,1,1002667907,2310,100,11118),
       (1832151345132432154,9917,0001,2,1000123456,4875,100,11119),
       (8658375435123543119,9918,0002,1,1011456723,4454,200,11120),
       (1465426345135266435,9919,0001,2,1000124547,4897,100,11121);