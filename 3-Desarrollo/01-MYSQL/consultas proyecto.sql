use nfb;

-- 1- Lista de usuarios registrados con el tipo de documento --
select nombre_usuario, apellido_usuario, fkid_tipo_documento
from nfb.usuario;

-- 2- Lista de usuarios registrados con el tipo de documento diferente de 'CC' --
select nombre_usuario, apellido_usuario, fkid_tipo_documento
from nfb.usuario
where fkid_tipo_documento = '2';

-- 3- Cantidad de usarios registrados --
select count(*)
from nfb.usuario;

-- 4- Lista de usuarios con rol administrador con sus datos --
select nombre_usuario, apellido_usuario, Nombre_rol
from nfb.usuario
join nfb.rol
on usuario.fkid_rol = rol.id_rol    
where id_rol = '01';

 -- 5- Reporte de ventas por día, semana, mes
 
 select fkid_carro_compra,fecha,id_carro_compra,cantidad_productos
 from factura inner join carro_compras on factura.fkid_carro_compra=carro_compras.id_carro_compra;

 -- 6- Usuarios, la compra que realizó, el método de pago utilizado
 


-- 7- Lista de productos y categoría (inventario)
select id_categoria,tipo_categoria,nom_producto
from  nfb.producto inner join  nfb.categoria on producto.fkid_categoria=categoria.id_categoria;

-- 8- Cantidad total de productos registrados
select count(*)
from nfb.producto;

-- 9- Lista de categorías de productos
select fkid_categoria,tipo_categoria,nom_producto
from  categoria inner join  producto on categoria.id_categoria=producto.fkid_categoria
where  fkid_categoria = 100;


select tipo_categoria,nom_producto
from  categoria inner join  producto on categoria.id_categoria=producto.fkid_categoria
where  fkid_categoria = 200;


select tipo_categoria,nom_producto
from  categoria inner join  producto on categoria.id_categoria=producto.fkid_categoria
where  fkid_categoria = 300;

-- 10- Cantidad de categorías
select count(*)
from nfb.categoria;

-- 11- Nombres y apellidos, documento de identidad del cliente que realizó la compra de mayor valor
-- 12- Nombres y apellidos, documento de identidad del cliente que realizó la compra de menor valor
-- 13- Nombres y apellidos, documento de identidad del cliente que no haya realizado compra
-- 14- Ordenar usarios, productos, categorías (ASC)

-- 15- Ordenar ventas por fecha (Desde la más actual a la más antigua)
select *
from factura
order by fecha DESC;
