use netflix1;



-- 1. Listar nombres de clientes que su primer nombre inicie por la letra "j
select nombre
from usuario
where nombre like 'j%';


-- 2. Películas publicadas en el año 2015 o 2014
select id_pelicula ,nombre_pelicula ,id_categoria,año_estreno
from pelicula
where año_estreno BETWEEN 2014 AND 2015;


-- 3. Nombre de series que tienen más de 2 temporadas
select  id_serie,nombre_serie,fkid_categoria,num_temporada
from series
where  num_temporada >=2;


-- 4. Nombres de películas que inician por "r"
select id_pelicula,nombre_pelicula,id_categoria,año_estreno
from pelicula
where nombre_pelicula like 'r%';


-- 5. El tipo de plan que tiene el precio más económico
select min(precio_mensual)
from plan;


--  6. El tipo de plan que tiene el precio más alto
select max(precio_mensual)
from plan;


-- 7. Usuarios con rol "cliente" y tipo de documento "cc"
select fkid_rol,numero_documento,nombre,apellidos
from usuario
where fkid_rol = 2 and id_tipo_documento = 1;



-- 8.Usuarios con rol "admin" y tipo de de documento "cc"
select id_administrador,nombres,email,id_tipo_documento,fkid_rol
from administrador
where fkid_rol = 1 and id_tipo_documento = 1;



-- 9. Usuarios en general que tienen tipo de documento diferente a "cc"
select *
from usuario
where id_tipo_documento <> 1;







-- 10. Cantidad de usuarios registrados (max)
select count(*)
from usuario;




-- 11. Cantidad de usuarios que adquirieron plan "premium" (count)
select count(*)
from usuario
where id_plan = 3;



-- 12. Cantidad de usuarios que adquirieron plan "básico" (count) (editado) 
select count(*)
from usuario
where id_plan = 1;