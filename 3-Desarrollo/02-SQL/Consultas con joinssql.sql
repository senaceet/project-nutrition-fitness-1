use netflix1;

-- 1.Nombres y apellidos de clientes registrados
select nombre,apellidos
from usuario;

-- 2.Número de usuarios están registrados en el aplicativo
select count(*)
from usuario;

-- 3.Nombres,apellidos de los clientes y tipo de plan que adquirieron
select nombre_planes,nombre,apellidos
from planes inner join  usuario on planes.id_planes=usuario.fkid_planes;

-- 4.Nombres y apellidos de los clientes que adquirieron pla npremium
select nombre_planes,nombre,apellidos,id_planes
from planes inner join  usuario on planes.id_planes=usuario.fkid_planes
where id_planes = 3;

-- 5.Nombres y apellidos de los clientes que tienen plan diferente al premium
select nombre_planes,nombre,apellidos,id_planes
from planes inner join  usuario on planes.id_planes=usuario.fkid_planes
 where not id_planes = 3;


-- 6.Nombres y apellidos de aquellas personas que tienen asignado rol de administrador
select fkid_rol,numero_documento,nombre,apellidos
from usuario;

-- 7.Nombres y apellidos de los clientes que tienen tipo de documento CC

select numero_documento,desc_doc,nombre_documento,nombre,apellidos
from usuario inner join  documento on documento.id_tipo_documentos=usuario.id_tipo_documento
where id_tipo_documento = 1;

-- 8.Número de usuarios que tienen CC
select count(id_tipo_documento)
from usuario
where id_tipo_documento = 1;

-- 9.Número de usuarios que tienen CC o CE
select count(id_tipo_documento)
from usuario
where not id_tipo_documento = 1;

-- 10.Nombres,apellidos y tipo de pago con el que adquirió el plan
select numero_documento,precio_mensual,id_tipo_documento,tipo_medio_pago
from factura inner join  medio_de_pago on factura.id_pago=medio_de_pago.id_pago;


-- 11.Ordenar las películas por fecha (order by ASC )
select *
from pelicula
order by año_estreno  ASC; 

-- 11.Ordenar las películas por fecha (order by  DESC)
select *
from pelicula
order by año_estreno DESC;