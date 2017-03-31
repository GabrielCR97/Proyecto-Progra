CREATE DATABASE EDescargas; 
GO
USE EDescargas;
GO
CREATE SCHEMA Administracion;
GO
CREATE SCHEMA Ventas;
GO
CREATE SCHEMA Seguridad;
GO 
CREATE SCHEMA Datos;
GO


/*ERRORES*/
CREATE TABLE Seguridad.Errores (
cod_Consecutivo VARBINARY(8000) not null,
num_Error VARBINARY(8000) not null,
mensaje_error VARBINARY(8000) not null,
fecha_error VARBINARY(8000) not null,
PRIMARY KEY (cod_Consecutivo)
);
GO

CREATE TABLE Ventas.Descargas(
codigo_descarga int identity (1,1) not null,
tipo_Descarga VARBINARY(8000) not null,
cantidad_descarga VARBINARY(8000) not null,
genero_descarga VARBINARY(8000) null,
PRIMARY KEY (codigo_descarga)
);
GO

CREATE TABLE Ventas.Clientes(
cod_Consecutivo_Cliente VARBINARY(8000) not null,
nombre_Cliente VARBINARY(8000) not null,
paterno_Cliente VARBINARY(8000) not null,
materno_Cliente  VARBINARY(8000) not null,
correo_Cliente VARBINARY(8000) not null,
usuario_Cliente VARBINARY(8000) not null,
clave_Cliente VARBINARY(8000) not null,
PRIMARY KEY (cod_Consecutivo_Cliente)
);
GO
/*
CREATE TABLE Datos.GeneroPeliculas(
codigo_pelicula int identity (1,1) not null,
nombre_pelicula VARBINARY(8000) not null,
descripcion_pelicula VARBINARY(8000) not null,
PRIMARY KEY (codigo_pelicula)
);
GO*/

CREATE TABLE Datos.GeneroMusica(
codigo_GeneroMusica int identity (1,1) not null,
nombre_GeneroMusica VARBINARY(8000) not null,
descripcion_GeneroMusica VARBINARY(8000) not null,
PRIMARY KEY (codigo_GeneroMusica)
);
GO

CREATE TABLE Datos.Idioma(
codigo_Idioma int identity (1,1) not null,
Nombre_idioma VARBINARY(8000) not null,
PRIMARY KEY (codigo_Idioma)
);
GO

CREATE TABLE Datos.TipoMusica(
codigo_TipoMusica int identity (1,1) not null,
nombre_TipoMusica VARBINARY(8000) not null,
descripcion_TipoMusica VARBINARY(8000) not null,
PRIMARY KEY (codigo_TipoMusica)
);
GO

CREATE TABLE Datos.GeneroPelicula(
codigo_GeneroPelicula int identity (1,1) not null,
nombre_GeneroPelicula VARBINARY(8000) not null,
descripcion_GeneroPelicula VARBINARY(8000) not null,
PRIMARY KEY (codigo_GeneroPelicula)
);
GO

CREATE TABLE Datos.Pais(
codigo_pais int identity (1,1) not null,
pais VARBINARY(8000) not null,
PRIMARY KEY (codigo_pais)
);
GO

CREATE TABLE Datos.Editorial(
codigo_Editorial int identity (1,1) not null,
nombre_Editorial VARBINARY(8000) not null,
descripcion_Editorial VARBINARY(8000) not null,
PRIMARY KEY (codigo_Editorial)
);
GO

CREATE TABLE Datos.CategoriaLibros(
codigo_CategoriaLibros int identity (1,1) not null,
nombre_CategoriaLibros VARBINARY(8000) not null,
descripcion_CategoriaLibros VARBINARY(8000) not null,
PRIMARY KEY (codigo_CategoriaLibros)
);
GO

CREATE TABLE Datos.Autor(
codigo_Autor int identity (1,1) not null,
nombre_Autor  VARBINARY(8000) not null,
apellidoUno_Autor VARBINARY(8000) not null,
apellidoDos_Autor VARBINARY(8000) not null,
pais int not null,
PRIMARY KEY (codigo_Autor),
constraint FK_Autor_Pais FOREIGN KEY (pais) REFERENCES Datos.Pais(codigo_pais)
);
GO

CREATE TABLE Datos.Disquera(
codigo_Disquera int identity (1,1) not null,
nombre_Disquera VARBINARY(8000) not null,
pais int not null,
PRIMARY KEY (codigo_Disquera),
constraint FK_Disquera_Pais FOREIGN KEY (pais) REFERENCES Datos.Pais(codigo_pais)
);
GO

CREATE TABLE Administracion.Roles(
codigo_Roles int identity (1,1) not null,
nombre_Roles VARBINARY(8000) not null,
descripcion_Roles VARBINARY(8000) not null,
PRIMARY KEY (codigo_Roles),
);
GO

CREATE TABLE Administracion.Consecutivos(
codigo_Consecutivo int identity (1,1) not null,
descripcion_Consecutivo VARBINARY(8000) not null,
consecutivo_Consecutivo VARBINARY(8000) not null,
prefijo_Consecutivo VARBINARY(8000) null,
rangoInicial_Consecutivo VARBINARY(8000) null,
rangoFin_Consecutivo VARBINARY(8000) null,
poseePrefijo_Consecutivo VARBINARY(8000) not null,
poseeRango_Consecutivo VARBINARY(8000) not null,
PRIMARY KEY (codigo_Consecutivo)
);
GO

CREATE TABLE Datos.Parametros(
codigo_Parametros int identity (1,1) not null,
rutaLibros_Parametros VARBINARY(8000) not null,
rutaPeliculas_Parametros VARBINARY(8000) not null,
rutaMusica_Parametros VARBINARY(8000) not null,
preLibros_Parametros VARBINARY(8000) not null,
prePeliculas_Parametros VARBINARY(8000) not null,
preMusica_Parametros VARBINARY(8000) not null,
PRIMARY KEY (codigo_Parametros)
);
GO

CREATE TABLE  Administracion.Usuarios(
usuario VARBINARY(8000) not null,
contrasena_usuario VARBINARY(8000) not null,
nombre_usuario VARBINARY(8000)not null,
apellidoUno_usuario VARBINARY(8000) not null,
apellidoDos_usuario VARBINARY(8000) not null,
correo_usuario VARBINARY(8000) not null,
rol_usuario int not null,
PRIMARY KEY (usuario),
constraint FK_Usuario_Rol foreign key (rol_usuario) references Administracion.Roles(codigo_Roles)
);
GO


CREATE TABLE Seguridad.Bitacora(
codConsecutivo_Bitacora VARBINARY(8000) not null,
usuario_Bitacora VARBINARY(8000) not null,
fecha_Bitacora VARBINARY(8000) not null,
codRegistro_Bitacora VARBINARY(8000) not null,
tipoRegistro_Bitacora VARBINARY(8000) not null,
descripcion_Bitacora VARBINARY(8000) not null,
detalleRegistro_Bitacora VARBINARY(8000) not null,
primary key (codConsecutivo_Bitacora),
constraint FK_Bitacora_Usuario foreign key (usuario_Bitacora) references Administracion.usuarios(usuario)
);
GO


CREATE TABLE Datos.Libros(
codConsecutivo_Libros VARBINARY(8000) not null,
nombre_Libros VARBINARY(8000) not null,
categoria_Libros INT not null,
autor_Libros INT not null,
editorial_Libros INT not null,
idioma_Libros INT not null,
añoPublicacion_Libros  VARBINARY(8000) not null,
linkDescarga_Libros  VARBINARY(8000) not null,
linkPrevio_Libros  VARBINARY(8000) not null,
PRIMARY KEY (codConsecutivo_Libros),
constraint FK_Libros_Categoria foreign key (categoria_Libros) references Datos.CategoriaLibros(codigo_CategoriaLibros),
constraint FK_Libros_Autores foreign key (autor_Libros) references Datos.Autor(codigo_Autor),
constraint FK_Libros_Editoriales foreign key (editorial_Libros) references Datos.Editorial(codigo_Editorial),
constraint FK_Libros_Idioma foreign key (idioma_Libros) references Datos.Idioma(codigo_Idioma)
);
GO

CREATE TABLE Datos.Musica(
codConsecutivo_Musica VARBINARY(8000) not null,
nombre_Musica  VARBINARY(8000) not null,
genero_Musica  INT not null,
tipoInterprete_Musica  INT not null,
disquera_Musica  INT not null,
idioma_Musica  INT not null,
pais INT not null,
nombreDisco_Musica   VARBINARY(8000) not null,
año_Musica   VARBINARY(8000) not null,
linkDescarga  VARBINARY(8000) not null,
linkPrevio  VARBINARY(8000) not null,
PRIMARY KEY (codConsecutivo_Musica ),
constraint FK_Musica_GeneroM foreign key (genero_Musica ) references Datos.GeneroMusica(codigo_GeneroMusica),
constraint FK_Musica_Tipo foreign key (tipoInterprete_Musica ) references Datos.TipoMusica(codigo_TipoMusica),
constraint FK_Musica_Disquera foreign key (disquera_Musica ) references Datos.Disquera(codigo_Disquera),
constraint FK_Musica_Idioma foreign key (idioma_Musica ) references Datos.Idioma(codigo_Idioma),
constraint FK_Musica_Pais foreign key (pais) references Datos.Pais(codigo_pais)
);
GO

CREATE TABLE Datos.Peliculas(
codConsecutivo VARBINARY(8000) not null,
nombre VARBINARY(8000) not null,
genero INT not null,
idioma INT not null,
actorP VARBINARY(8000) not null,
año  VARBINARY(8000) not null,
linkDescarga  VARBINARY(8000) not null,
linkPrevio  VARBINARY(8000) not null,
PRIMARY KEY (codConsecutivo),
constraint FK_Peliculas_GeneroP foreign key (genero) references Datos.GeneroPelicula(codigo_GeneroPelicula),
constraint FK_Peliculas_Idioma foreign key (idioma) references Datos.Idioma(codigo_Idioma),
);
GO

CREATE  TABLE Ventas.Compra (
CodConsecutivo_Compra INT IDENTITY (1,1) NOT NULL,
cliente_Compra VARBINARY(8000) not null,
PRIMARY KEY (CodConsecutivo_Compra),
constraint FK_Cmpras_Cliente foreign key (cliente_Compra) references Ventas.Clientes(cod_Consecutivo_Cliente)
);
GO

CREATE TABLE Ventas.DetalleCompra(
codigo INT IDENTITY (1,1) NOT NULL,
codCompras INT NOT NULL,
pelicula  VARBINARY(8000) null,
libro VARBINARY(8000)  null,
musica VARBINARY(8000) null,
total  VARBINARY(8000) not null,
constraint FK_Detalle_Compras foreign key (codCompras) references Ventas.Compra(CodConsecutivo_Compra),
constraint FK_Detalle_Peliculas foreign key (pelicula) references Datos.Peliculas(codConsecutivo),
constraint FK_Detalle_Libros foreign key (libro) references Datos.Libros(codConsecutivo_Libros),
constraint FK_Detalle_Musica foreign key (musica) references Datos.Musica(codConsecutivo_Musica)
);
GO

CREATE TABLE Ventas.Transacciones(
codConsecutivo_Transacciones VARBINARY(8000) NOT NULL,
Cod_Compra INT NOT NULL,
Codigo_transaccion INT NOT NULL,
monto VARBINARY (8000)
PRIMARY KEY (codConsecutivo_Transacciones),
constraint FK_Ventas_Transacciones foreign key (Cod_Compra) references Ventas.Compra(CodConsecutivo_Compra)
);
GO;

/***************************************************************************************************************/


/* Procedimientos almacenados*/



Create procedure InsertaConsecutivo
@descripcion varchar(8000),
@consecutivo varchar(8000),
@poseePrefijo varchar(8000),
@prefijo varchar(8000),
@poseeRango varchar(8000),
@rangoInicial varchar(8000),
@rangofinal varchar(8000)
as
BEGIN
Insert into Administracion.Consecutivos
(
descripcion_Consecutivo, consecutivo_Consecutivo, poseePrefijo_Consecutivo, prefijo_Consecutivo, poseeRango_Consecutivo, rangoInicial_Consecutivo, rangoFin_Consecutivo) 
values( 
ENCRYPTBYPASSPHRASE('consecutivo',CONVERT(VARBINARY(8000), @descripcion)),
ENCRYPTBYPASSPHRASE('consecutivo',CONVERT(VARBINARY(8000),@consecutivo)),
ENCRYPTBYPASSPHRASE('consecutivo',CONVERT(VARBINARY(8000),@poseePrefijo)),
ENCRYPTBYPASSPHRASE('consecutivo',CONVERT(VARBINARY(8000),@prefijo)), 
ENCRYPTBYPASSPHRASE('consecutivo',CONVERT(VARBINARY(8000),@poseeRango)),
ENCRYPTBYPASSPHRASE('consecutivo',CONVERT(VARBINARY(8000),@rangoInicial)),
ENCRYPTBYPASSPHRASE('consecutivo',CONVERT(VARBINARY(8000),@rangofinal))
);
END;


--GO
exec InsertaConsecutivo 'Bitacora', '1' , 'SI','BIT-','SI','1', '250' ;
GO
exec InsertaConsecutivo 'Libros', '1' , 'SI','LIB-','SI','1', '250' ;
GO
exec InsertaConsecutivo 'Peliculas', '1' , 'SI','PEL-','SI','1', '250' ;
GO
exec InsertaConsecutivo 'Musica', '1' , 'SI','MUS-','SI','1', '250' ;
GO
exec InsertaConsecutivo 'Cuentas', '1' , 'SI','CUE-','SI','1', '250' ;
GO
exec InsertaConsecutivo 'Compras', '1' , 'SI','COM-','SI','1', '250' ;
GO
exec InsertaConsecutivo 'Clientes', '1' , 'SI','CLI-','SI','1', '250' ;
GO

/*ACTUALIZA NUMERO CONSECUTIVO*/
CREATE PROCEDURE  ActualizaNumConsecutivo
@tabla varchar(8000), 
@numero varchar(8000)
as
BEGIN
UPDATE Administracion.Consecutivos SET consecutivo_Consecutivo	 = ENCRYPTBYPASSPHRASE('consecutivo', CONVERT(VARBINARY(8000), @numero))
WHERE  CONVERT(VARCHAR(8000), DECRYPTBYPASSPHRASE('consecutivo',descripcion_Consecutivo)) like @tabla
END;
GO

/*RETORNA DATOS*/
CREATE PROC TraeConsecutivo
@tabla varchar(8000)
as
BEGIN
select CONVERT(VARCHAR(8000),  decryptbypassphrase('consecutivo', consecutivo_Consecutivo)) as Numero,
CONVERT(VARCHAR(8000), decryptbypassphrase('consecutivo', prefijo_Consecutivo)) as Prefijo
from Administracion.Consecutivos
WHERE CONVERT(VARCHAR(8000), DECRYPTBYPASSPHRASE('consecutivo',descripcion_Consecutivo)) like @tabla
END;
GO

exec TraeConsecutivo 'Bitacora' 

/*MUESTRA TODOS*/


create procedure MuestraConsecutivo
AS
BEGIN
SELECT 
CONVERT(VARCHAR(8000), DECRYPTBYPASSPHRASE('consecutivo', descripcion_Consecutivo )) as Tabla,
CONVERT(VARCHAR(8000), DECRYPTBYPASSPHRASE('consecutivo', consecutivo_Consecutivo )) as Consecutivo,
CONVERT(VARCHAR(8000), DECRYPTBYPASSPHRASE('consecutivo', prefijo_Consecutivo )) as Prefijo,
CONVERT(VARCHAR(8000), DECRYPTBYPASSPHRASE('consecutivo', rangoInicial_Consecutivo ))+ ' - ' +
CONVERT(VARCHAR(8000), DECRYPTBYPASSPHRASE('consecutivo', rangoFin_Consecutivo )) as Rango
 from Administracion.Consecutivos
 END;
 GO
 exec MuestraConsecutivo;

/*BUSCA CONSECUTIVO*/
ALTER PROCEDURE buscaConsecutivo
@nombre varchar(8000)
AS
BEGIN
SELECT 
CONVERT(VARCHAR(8000), DECRYPTBYPASSPHRASE('consecutivo', descripcion_Consecutivo )) as Tabla,
CONVERT(VARCHAR(8000), DECRYPTBYPASSPHRASE('consecutivo', prefijo_Consecutivo )) as Prefijo,
CONVERT(VARCHAR(8000), DECRYPTBYPASSPHRASE('consecutivo', consecutivo_Consecutivo )) as Consecutivo,
CONVERT(VARCHAR(8000), DECRYPTBYPASSPHRASE('consecutivo', rangoInicial_Consecutivo ))+ ' - ' +
CONVERT(VARCHAR(8000), DECRYPTBYPASSPHRASE('consecutivo', rangoFin_Consecutivo )) as Rango
 from Administracion.Consecutivos WHERE CONVERT(VARCHAR(8000), DECRYPTBYPASSPHRASE('consecutivo', descripcion_Consecutivo )) like '%'+ @nombre +'%';
 END;
 GO

 EXEC buscaConsecutivo 'i' ;

 /*EDITA CONSECUTIVO*/

 create proc EditaConsecutivo
@codigo int,
@rangoFin varbinary(8000)
 as
 BEGIN
 UPDATE Administracion.Consecutivos set rangoFin_Consecutivo = ENCRYPTBYPASSPHRASE('consecutivo',CONVERT(VARBINARY(8000),@rangoFin))
WHERE codigo_Consecutivo= @codigo
END;

//roles

alter procedure InsertarRoles
@nombre_roles varchar(8000),
@descripcion_roles varchar(8000)
as
begin 
insert into Administracion.Roles
(
 nombre_Roles, descripcion_Roles
)
values
(
ENCRYPTBYPASSPHRASE('roles',CONVERT(VARBINARY(8000),@nombre_roles)),
ENCRYPTBYPASSPHRASE('roles',CONVERT(VARBINARY(8000),@descripcion_roles))
);
end;

/* AGREGAR LA INFORMACION PARA ROLES */
exec InsertarRoles 'Administrador',' Acceso a todo el sistema';
exec InsertarRoles 'Seguridad','Acceso a solo creacion y visualizacion de usuarios';
exec InsertarRoles 'Consecutivo','Acceso solo a consecutivo';
exec InsertarRoles 'Mantenimiento','Acceso a las 4 acciones';
exec InsertarRoles 'Consulta','Acceso solo a consultas';


/*  Traer Roles */

create procedure TraeRoles
@nombre varchar(8000)
as 
begin
select CONVERT(varchar(8000), DECRYPTBYPASSPHRASE('roles', codigo_roles)) as codigo_roles,
CONVERT (varchar(8000),DECRYPTBYPASSPHRASE('roles', nombre_roles )) as Nombre
from Administracion.Roles where CONVERT(varchar(8000), DECRYPTBYPASSPHRASE('roles', codigo_Roles)) like @nombre
end;
go


create procedure MuestraRoles
@descripcion varchar(8000)
as 
begin
select CONVERT(varchar(8000), DECRYPTBYPASSPHRASE('roles', codigo_roles)) as Codigo,
 CONVERT(varchar(8000),DECRYPTBYPASSPHRASE('roles', nombre_roles)) as Nombres
from Administracion.Roles where CONVERT(varchar(8000),
DECRYPTBYPASSPHRASE('roles',descripcion_Roles)) like @descripcion
end;
alter procedure buscarRoles
@nombre varchar(8000)
as 
begin 
select CONVERT(varchar(8000),DECRYPTBYPASSPHRASE('roles', nombre_roles)) as Nombres,
CONVERT(varchar(8000), DECRYPTBYPASSPHRASE('roles', descripcion_roles)) as Descripcion,
CONVERT(varchar(8000), DECRYPTBYPASSPHRASE('roles',codigo_Roles)) as Codigos
from Administracion.Roles where CONVERT(varchar(8000),
DECRYPTBYPASSPHRASE('roles',nombre_Roles)) like '%'  + @nombre + '%';
end;
go


create procedure EditaRoles
@codigo varchar(8000),
@nombre varchar(8000),
@descripcion varchar(8000)
as
begin
update Administracion.Roles set codigo_Roles =
ENCRYPTBYPASSPHRASE('roles',CONVERT(VARBINARY(8000),@nombre))
where nombre_Roles = @nombre
end;
 

/* usuarios */


alter procedure InsertarUsuario
@username varchar(8000),
@password_username varchar(8000),
@nombre_usuario varchar(8000),
@apellidoUno_usuario varchar(8000),
@apellidoDos_usuario varchar(8000),
@correo_usuariuo varchar(8000),
@rol int
as 
BEGIN 
insert into Administracion.Usuarios
(
usuario,contrasena_usuario,nombre_usuario,apellidoUno_usuario,
apellidoDos_usuario,correo_usuario,rol_usuario
)
values 
(
ENCRYPTBYPASSPHRASE('usuario',CONVERT(varbinary (8000),@username)),
ENCRYPTBYPASSPHRASE('usuario',CONVERT(varbinary(8000),@password_username)),
ENCRYPTBYPASSPHRASE('usuario', CONVERT(varbinary(8000),@nombre_usuario)),
ENCRYPTBYPASSPHRASE('usuario', CONVERT(varbinary(8000),@apellidoUno_usuario)),
ENCRYPTBYPASSPHRASE('usuario', CONVERT(varbinary(8000),@apellidoDOs_usuario)),
ENCRYPTBYPASSPHRASE('usuario', CONVERT(varbinary(8000),@correo_usuariuo)),
@rol
);
end;

exec InsertarUsuario 'admin123','admin123','Gabriel','Murillo','Monge',
'gabrielmurillo@hotmail.com','1';

exec InsertarUsuario 'gabrielcr','admin123','Nacho','Romero','Fuentes',
'nacho@hotmail.com','1';

create procedure ActualizaUsuarios
@usuario varchar(8000),
@password_username varchar(8000),
@nombre_usuario varchar(8000),
@apellidoUno_usuario varchar(8000),
@apellidoDos_usuario varchar(8000),
@correo_usuariuo varchar(8000),
@rol int
as
begin
UPDATE Administracion.Usuarios SET contrasena_usuario = 
ENCRYPTBYPASSPHRASE('usuario',@password_username),
nombre_usuario =ENCRYPTBYPASSPHRASE('usuario',@nombre_usuario),
apellidoUno_usuario = ENCRYPTBYPASSPHRASE('usuario',@apellidoUno_usuario),
apellidoDos_usuario = ENCRYPTBYPASSPHRASE('usuario',@apellidoDos_usuario),
correo_usuario = ENCRYPTBYPASSPHRASE('usuario',@correo_usuariuo) 
where  @usuario = usuario
end;
go


create procedure TraeUsuario
@usuario varchar(8000)
as
begin
select CONVERT(varchar(8000),DECRYPTBYPASSPHRASE('usuario',nombre_usuario)) as Nombre,
CONVERT(varchar(8000),DECRYPTBYPASSPHRASE('usuario',apellidoUno_usuario)) as Apellido
/*rol y apellido
*/
from Administracion.Usuarios where  CONVERT(varchar(8000),DECRYPTBYPASSPHRASE('usuario',usuario)) = @usuario
end; 

exec TraeUsuario 'gabriel';

/* select 
u.nombre + ' ' + u.apellido as Nombre ,
u.correo,
r.nombre_roles
from Administracion.Usuarios u , Administracion.Roles r
where 
u.rol = r.codigo_roles  */


create procedure MuestraUsuario
as
begin 
select 
CONVERT(varchar(8000),DECRYPTBYPASSPHRASE('usuario',nombre_usuario)) +
CONVERT(varchar(8000),DECRYPTBYPASSPHRASE('usuario',apellidoUno_usuario)) as Nombre,
CONVERT(varchar(8000),DECRYPTBYPASSPHRASE('usuario',correo_usuario)),
CONVERT(varchar(8000),DECRYPTBYPASSPHRASE('usuario',r.nombre_Roles))
from Administracion.Usuarios u, Administracion.Roles r
 where u.rol_usuario = r.codigo_roles
end;


/* 

 logearse y cambiar contrasela

create procedure Logearse
@username varchar(8000),
@password varchar(8000),
@valida  varchar(8000)
as
begin
set @valida = select COUNT

*/


create procedure InsertarDatosAutores
@codigo_autor varchar(8000),
@nombre_autor varchar(8000),
@apellidoUno_autor varchar(8000),
@apellidoDos_autor varchar(8000),
@pais varchar(8000)
as
begin
insert into Datos.Autor(codigo_Autor,nombre_Autor,apellidoUno_Autor,apellidoDos_Autor,pais)
values(ENCRYPTBYPASSPHRASE('autor',CONVERT(varbinary(8000),@codigo_autor)),
ENCRYPTBYPASSPHRASE('autor',CONVERT(varbinary(8000),@nombre_autor)),
ENCRYPTBYPASSPHRASE('autor',CONVERT(varbinary(8000),@apellidoUno_autor)),
ENCRYPTBYPASSPHRASE('autor',CONVERT(varbinary(8000),@apellidoDos_autor)),
ENCRYPTBYPASSPHRASE('autor',CONVERT(varbinary(8000),@pais))
);
end;


create procedure TraeAutor
@codigo_autor varchar(8000)
as
begin
select CONVERT(varchar(8000),DECRYPTBYPASSPHRASE('autor',nombre_Autor)) as Nombre,
CONVERT(varchar(8000),DECRYPTBYPASSPHRASE('autor',apellidoUno_Autor)) as Apellido
from Datos.Autor where  CONVERT(varchar(8000),DECRYPTBYPASSPHRASE('autor',codigo_Autor)) = @codigo_autor
end; 


 create procedure actualizarActor
 @codigo_autor varchar(8000),
 @nombre_autor varchar(8000),
 @apellidoUno_autor varchar(8000),
 @apellidoDos_autor varchar(8000),
 @pais varchar(8000)
 as
 begin
 UPDATE Datos.Autor set nombre_Autor = ENCRYPTBYPASSPHRASE('autor',@nombre_autor),
 apellidoUno_Autor = ENCRYPTBYPASSPHRASE('autor',@apellidoUno_autor),
 apellidoDos_Autor = ENCRYPTBYPASSPHRASE('autor',@apellidoDos_autor)
 where @codigo_autor = codigo_Autor
 end;


 create procedure InsertarCategoriaLibros
 @codigo_libro varchar(8000),
 @nombre_libro varchar(8000),
 @descripcion_libro varchar(8000)
 as
 begin 
 insert into Datos.CategoriaLibros 
 (codigo_CategoriaLibros,nombre_CategoriaLibros,descripcion_CategoriaLibros)
 values (ENCRYPTBYPASSPHRASE('Catlibros',CONVERT(varbinary(8000),@codigo_libro)),
ENCRYPTBYPASSPHRASE('Catlibros',CONVERT(varbinary(8000),@nombre_libro)),
ENCRYPTBYPASSPHRASE('Catlibros',CONVERT(varbinary(8000),@descripcion_libro)));
end;

/* Revisar esto */

alter procedure TraerCategoria
@codigo_categoriaLibro varchar(8000)
as 
begin 
select CONVERT(varchar(8000),DECRYPTBYPASSPHRASE('Catlibros',nombre_CategoriaLibros)) as Nombre,
CONVERT(varchar(8000),DECRYPTBYPASSPHRASE('Catlibros',descripcion_CategoriaLibros)) as Descripcion
from Datos.CategoriaLibros where CONVERT(varchar(8000),DECRYPTBYPASSPHRASE('Catlibros',codigo_CategoriaLibros)) = @codigo_categoriaLibro
end;



/* Actualizar Categoria */

create procedure ActualizarCategoriaLibro
@codigo_categoria varchar(8000),
@nombre_categoriaLibro varchar(8000),
@descripcion_categoriaLibro varchar(8000)
as
begin
UPDATE Datos.CategoriaLibros SET nombre_CategoriaLibros = ENCRYPTBYPASSPHRASE('CatLibros',@nombre_categoriaLibro),
descripcion_CategoriaLibros = ENCRYPTBYPASSPHRASE('CatLibros',@descripcion_categoriaLibro) where codigo_CategoriaLibros = @codigo_categoria
end;
go;


create procedure MostrarCategoriasLibros
@codigo_categoria int
as
begin
select 
CONVERT(varchar(8000),DECRYPTBYPASSPHRASE('CatLibros',nombre_CategoriaLibros )) as Nombre,
convert(varchar(8000),DECRYPTBYPASSPHRASE('CatLibros',descripcion_CategoriaLibros)) as Descripcion
from Datos.CategoriaLibros where  DECRYPTBYPASSPHRASE('CatLibros',descripcion_CategoriaLibros) like @codigo_categoria
end;



create procedure InsertarDisqueras
@codigo_Disquera varchar(8000),
@nombre_disquera varchar(8000),
@pais varchar(8000)
as 
begin
insert into Datos.Disquera(codigo_Disquera,nombre_Disquera,pais)
values 
(
ENCRYPTBYPASSPHRASE('diqueras' ,CONVERT(varbinary (8000),@codigo_Disquera)),
ENCRYPTBYPASSPHRASE('disqueras',CONVERT(varbinary(8000),@nombre_disquera)),
@pais
);
end;

/*  TENGO QUE HACER LA TABLA PAIS 
create procedure MostrarDisqueras
@codigo_disquera varchar(8000)
as
begin
select
CONVERT(varchar(8000),DECRYPTBYPASSPHRASE('disqueras',nombre_Disquera)) as Nombre,
CONVERT(varchar(8000),DECRYPTBYPASSPHRASE('disqueras'pais)) from  */



CREATE PROCEDURE ActualizarDisquera
@codigo_disquera varchar(8000),
@nombre_disquera varchar(8000),
@pais varchar(8000)
as
begin
UPDATE Datos.Disquera SET nombre_Disquera = ENCRYPTBYPASSPHRASE('diqueras', @nombre_disquera),
pais = @pais where codigo_Disquera = @codigo_disquera
end;


CREATE PROCEDURE InsertarPais
@codigo_pais int,
@pais varcharm(8000) int

begin 
insert into Datos.Pais(codigo_pasis,pais)
values(
ENCRYPTBYPASSPHRASE('pais' ,CONVERT(varbinary (8000),@codigo_Disquera)),
ENCRYPTBYPASSPHRASE('pais',CONVERT(varbinary(8000),@nombre_disquera))
)end;


create procedure MostarPaises
@codigo_pais int
as
begin
select 
CONVERT(varchar(8000),DECRYPTBYPASSPHRASE('pais',pais )) as Pais
from Datos.CategoriaLibros where  DECRYPTBYPASSPHRASE('pais',codigo_pais) like @codigo_pais
end;


CREATE PROCEDURE ActualizarPais
@codigo_pais varchar(8000),
@pais varchar(8000)
as
begin
UPDATE Datos.Disquera SET pais = ENCRYPTBYPASSPHRASE('pais', @pais)
 where [codigo_pais] = @codigo_pais
end;








