use nfb;
​
-- 1- Lista de usuarios registrados con el tipo de documento --
select nombre_usuario, apellido_usuario, fkid_tipo_documento
from usuario;
​
-- 2- Lista de usuarios registrados con el tipo de documento diferente de 'CC' --
select nombre_usuario, apellido_usuario, fkid_tipo_documento
from usuario
where fkid_tipo_documento = '2';
​
-- 3- Cantidad de usarios registrados --
select count(*)
from usuario;
​
-- 4- Lista de usuarios con rol administrador con sus datos --
select nombre_usuario, apellido_usuario, Nombre_rol
from usuario
join rol
on usuario.fkid_rol = rol.id_rol    
where id_rol = '01';
​
 -- 5- Reporte de ventas por día, semana, mes
 
 select fkid_carro_compra,fecha,id_carro_compra,cantidad_productos
 from factura inner join carro_compras on factura.fkid_carro_compra=carro_compras.id_carro_compra;
​
 -- 6- Usuarios, la compra que realizó, el método de pago utilizado
select numero_doc_usuario, nombre_usuario, apellido_usuario, nom_producto fkid_pago, nombre_tipo_pago
from factura
inner join usuario
on factura.fknumero_doc_usuario = usuario.numero_doc_usuario
left join producto
on factura.fkcodigo_producto = producto.codigo_producto
inner join medio_de_pago 
on factura.fkid_pago = medio_de_pago.id_pago;
​​
-- 7- Lista de productos y categoría (inventario)
select id_categoria,tipo_categoria,nom_producto
from  producto inner join  categoria on producto.fkid_categoria = categoria.id_categoria;
​
-- 8- Cantidad total de productos registrados
select count(*)
from producto;
​
-- 9- Lista de categorías de productos
select fkid_categoria,tipo_categoria,nom_producto
from  categoria inner join  producto on categoria.id_categoria=producto.fkid_categoria
where  fkid_categoria = 100;
​
​
select tipo_categoria,nom_producto
from  categoria inner join  producto on categoria.id_categoria=producto.fkid_categoria
where  fkid_categoria = 200;
​
​
select tipo_categoria,nom_producto
from  categoria inner join  producto on categoria.id_categoria=producto.fkid_categoria
where  fkid_categoria = 300;
​
-- 10- Cantidad de categorías
select count(*)
from categoria;
​
-- 11- Nombres y apellidos, documento de identidad del cliente que realizó la compra de mayor valor
select numero_doc_usuario, nombre_usuario, apellido_usuario, Precio_fac
from factura 
inner join usuario 
on factura.fknumero_doc_usuario = usuario.numero_doc_usuario
where Precio_fac = (select MAX(Precio_fac) from factura);

-- 12- Nombres y apellidos, documento de identidad del cliente que realizó la compra de menor valor+
select numero_doc_usuario, nombre_usuario, apellido_usuario,Precio_fac
from factura 
inner join usuario 
on factura.fknumero_doc_usuario = usuario.numero_doc_usuario 
where Precio_fac = (select min(Precio_fac) from factura);

-- 13- Nombres y apellidos, documento de identidad del cliente que no haya realizado compra
select numero_doc_usuario, nombre_usuario, apellido_usuario, Precio_fac
from usuario
left join factura
on usuario.numero_doc_usuario = factura.fknumero_doc_usuario
where Precio_fac is null ;

-- 14- Ordenar usarios, productos, categorías (ASC) --
select nombre_usuario,apellido_usuario,nom_producto,tipo_categoria
from factura
inner join usuario
on usuario.numero_doc_usuario = factura.fknumero_doc_usuario
inner join producto
on factura.fkcodigo_producto = producto.codigo_producto
inner join categoria
on categoria.id_categoria = factura.fkid_categoria
order by nombre_usuario,apellido_usuario,nom_producto,tipo_categoria asc;
​
-- 15- Ordenar ventas por fecha (Desde la más actual a la más antigua)
select fecha
from factura
order by fecha DESC;