-- drop database MARNET;
create database MARNET;

use MARNET;

drop table if exists clientes;
create table clientes ( 
id_cliente int not null primary key auto_increment,
tipo_identificacion varchar(50),
identificacion bigint,
nombres varchar(200),
Primer_Apellido         varchar(100),
Segundo_Apellido     varchar(100),
fecha_nacimiento      varchar(10),
genero                       varchar(50),
numero_celular          bigint,
Email                          varchar(200),
tipo_cliente                 varchar(50),
password         varchar(100)
); 



CREATE UNIQUE INDEX ID_UNICO_CLIENTES ON clientes 
(
tipo_identificacion,identificacion
);

create unique index idx_email_unico on clientes (Email);

drop table if exists Direcciones;
create table Direcciones(
Id_direccion  int not null primary key auto_increment,
tipo_direccion varchar(30),
direccion    varchar(200),
barrio          varchar(100),
ciudad         varchar(100),
pais             varchar(100),
Indicacion  varchar(500)
);


DROP TABLE IF EXISTS ClientesXDireccion;
create table ClientesXDireccion (
id_ClientesXDireccion int not null primary key auto_increment,
id_cliente int,
Id_direccion int,
foreign key(id_cliente) references clientes (id_cliente),
foreign key(ID_direccion) references Direcciones(ID_direccion),
unique(id_cliente,Id_direccion)
);


DROP TABLE IF EXISTS FACTURAS;

CREATE TABLE FACTURAS (
Id_factura int not null primary key auto_increment,
id_cliente INT,
cantidad_articulos  INT,
valor_factura          bigint,
fecha_venta           datetime,
fecha_aplicacion    datetime,
foreign key(id_cliente) references clientes (id_cliente)
);


DROP TABLE IF EXISTS DETALLE_FACTURA;

CREATE TABLE DETALLE_FACTURA (
id_detalle_factura Int not null primary key auto_increment,
id_factura INT,
id_producto INT,
nombre_producto varchar(200),
valor            BIGINT,
fecha           DATETIME,
catagoria     VARCHAR(200),
foreign key(Id_factura) references FACTURAS (Id_factura)
);


DROP TABLE IF EXISTS Inventario;
create table Inventario (
id_producto_inven int not null primary key auto_increment,
descripcion varchar(200),
cantidad_existencias int,
precio_venta int
);

DROP TABLE IF EXISTS InventarioXVenta;
create table InventarioXVenta (
Id_InventarioXVenta int not null primary key auto_increment,
id_producto_inven int,
id_factura int,
foreign key(Id_factura) references FACTURAS (Id_factura),
foreign key(id_producto_inven) references Inventario (id_producto_inven),
UNIQUE (id_producto_inven,id_factura)
);

DROP TABLE IF EXISTS Proveedores;
create table Proveedores(
Nit_proveedor BIGINT not null primary key auto_increment,
nombre_proveedor varchar(200),
tipo varchar(100),
regimen varchar(100),
direccion varchar(100),
telefono varchar(100),
dias_visita varchar(200)
);



DROP TABLE IF EXISTS Compras;
create table Compras(
Id_compra  int not null primary key auto_increment,
id_factura_compra int,
id_producto_compra int,
cantidad_compra int,
precio_compra int,
fecha_compra datetime,
nit_proveedor bigint,
foreign key(nit_proveedor) references Proveedores (nit_proveedor)
);


DROP TABLE IF EXISTS  CompraxInventario;

CREATE TABLE CompraxInventario(
ID_CompraxInventario int not null primary key auto_increment,
Id_compra INT,
id_producto_inven INT,
foreign key(Id_compra) references Compras (Id_compra),
foreign key(id_producto_inven) references Inventario (id_producto_inven),
UNIQUE (id_producto_inven,Id_compra)
);


DROP TABLE IF EXISTS  AUDITORIA;

CREATE TABLE AUDITORIA(
id_auditoria int not null primary key auto_increment,
tabla VARCHAR(200),
fecha_hora_accion DATETIME,
tipo_accion VARCHAR(200),
usuario VARCHAR(200),
CAMBIOS_REALIZADOS VARCHAR(2000)
);

-- ========================================================================================
--  TRIGGERS ================================================================================
-- ========================================================================================
DROP TRIGGER if exists INSERT_CompraxInventario ;
CREATE TRIGGER INSERT_CompraxInventario BEFORE INSERT ON CompraxInventario
FOR EACH ROW 
INSERT INTO AUDITORIA (tabla,fecha_hora_accion, tipo_accion)
VALUES (
'CompraxInventario' ,(SELECT now()),'INSERT'
);

DROP TRIGGER if exists INSERT_clientes;

CREATE TRIGGER INSERT_clientes BEFORE INSERT ON clientes
FOR EACH ROW 
INSERT INTO AUDITORIA (tabla,fecha_hora_accion, tipo_accion)
VALUES (
'clientes' ,(SELECT now()),'INSERT'
);

CREATE TRIGGER UPDATE_clientes BEFORE UPDATE ON clientes
FOR EACH ROW 
INSERT INTO AUDITORIA (tabla,fecha_hora_accion, tipo_accion)
VALUES ('clientes' ,(SELECT now()),'UPDATE');

CREATE TRIGGER DELETE_clientes BEFORE DELETE ON clientes
FOR EACH ROW 
INSERT INTO AUDITORIA
    SET tipo_accion = 'DELETE',
     tabla = 'clientes' ,
     fecha_hora_accion = NOW(),
     CAMBIOS_REALIZADOS = 
OLD.tipo_identificacion || OLD.identificacion ||
OLD.nombres ||
OLD.Primer_Apellido ||
OLD.Email || OLD.numero_celular;       

CREATE TRIGGER DELETE_CompraxInventario BEFORE DELETE ON CompraxInventario
FOR EACH ROW 
INSERT INTO AUDITORIA
    SET tipo_accion = 'DELETE',
     tabla = 'CompraxInventario' ,
     fecha_hora_accion = NOW(),
     CAMBIOS_REALIZADOS =  OLD.id_CompraxInventario;

CREATE TRIGGER UPDATE_CompraxInventario BEFORE UPDATE ON CompraxInventario
FOR EACH ROW 
INSERT INTO AUDITORIA (tabla,fecha_hora_accion, tipo_accion)
VALUES ('CompraxInventario' ,(SELECT now()),'UPDATE');


-- ===================================================
CREATE TRIGGER INSERT_Direcciones BEFORE INSERT ON Direcciones
FOR EACH ROW 
INSERT INTO AUDITORIA (tabla,fecha_hora_accion, tipo_accion)
VALUES ('Direcciones' ,(SELECT now()),'INSERT');


CREATE TRIGGER UPDATE_Direcciones BEFORE UPDATE ON Direcciones
FOR EACH ROW 
INSERT INTO AUDITORIA (tabla,fecha_hora_accion, tipo_accion)
VALUES ('Direcciones' ,(SELECT now()),'UPDATE');

CREATE TRIGGER DELETE_Direcciones BEFORE DELETE ON Direcciones
FOR EACH ROW 
INSERT INTO AUDITORIA
    SET tipo_accion = 'DELETE',
     tabla = 'Direcciones' ,
     fecha_hora_accion = NOW(),
     CAMBIOS_REALIZADOS = OLD.Id_Direccion;  
-- ===================================================
-- ClientesXDireccion
-- ===================================================
CREATE TRIGGER INSERT_ClientesXDireccion BEFORE INSERT ON ClientesXDireccion
FOR EACH ROW 
INSERT INTO AUDITORIA (tabla,fecha_hora_accion, tipo_accion)
VALUES ('ClientesXDireccion' ,(SELECT now()),'INSERT');


CREATE TRIGGER UPDATE_ClientesXDireccion BEFORE UPDATE ON ClientesXDireccion
FOR EACH ROW 
INSERT INTO AUDITORIA (tabla,fecha_hora_accion, tipo_accion)
VALUES ('ClientesXDireccion' ,(SELECT now()),'UPDATE');

CREATE TRIGGER DELETE_ClientesXDireccion BEFORE DELETE ON ClientesXDireccion
FOR EACH ROW 
INSERT INTO AUDITORIA
    SET tipo_accion = 'DELETE',
     tabla = 'ClientesXDireccion' ,
     fecha_hora_accion = NOW(),
     CAMBIOS_REALIZADOS = OLD.Id_ClientesXDireccion;  
-- ===================================================
-- FACTURAS
-- ===================================================
CREATE TRIGGER INSERT_FACTURAS BEFORE INSERT ON FACTURAS
FOR EACH ROW 
INSERT INTO AUDITORIA (tabla,fecha_hora_accion, tipo_accion)
VALUES ('FACTURAS' ,(SELECT now()),'INSERT');


CREATE TRIGGER UPDATE_FACTURAS BEFORE UPDATE ON FACTURAS
FOR EACH ROW 
INSERT INTO AUDITORIA (tabla,fecha_hora_accion, tipo_accion)
VALUES ('FACTURAS' ,(SELECT now()),'UPDATE');

CREATE TRIGGER DELETE_FACTURAS BEFORE DELETE ON FACTURAS
FOR EACH ROW 
INSERT INTO AUDITORIA
    SET tipo_accion = 'DELETE',
     tabla = 'FACTURAS' ,
     fecha_hora_accion = NOW(),
     CAMBIOS_REALIZADOS = OLD.Id_FACTURA;  
-- ===================================================
-- DETALLE_FACTURA
-- ===================================================
CREATE TRIGGER INSERT_DETALLE_FACTURA BEFORE INSERT ON DETALLE_FACTURA
FOR EACH ROW 
INSERT INTO AUDITORIA (tabla,fecha_hora_accion, tipo_accion)
VALUES ('DETALLE_FACTURA' ,(SELECT now()),'INSERT');


CREATE TRIGGER UPDATE_DETALLE_FACTURA BEFORE UPDATE ON DETALLE_FACTURA
FOR EACH ROW 
INSERT INTO AUDITORIA (tabla,fecha_hora_accion, tipo_accion)
VALUES ('DETALLE_FACTURA' ,(SELECT now()),'UPDATE');

CREATE TRIGGER DELETE_DETALLE_FACTURA BEFORE DELETE ON DETALLE_FACTURA
FOR EACH ROW 
INSERT INTO AUDITORIA
    SET tipo_accion = 'DELETE',
     tabla = 'DETALLE_FACTURA' ,
     fecha_hora_accion = NOW(),
     CAMBIOS_REALIZADOS = OLD.Id_DETALLE_FACTURA;  
-- ===================================================
-- Inventario
-- ===================================================
CREATE TRIGGER INSERT_Inventario BEFORE INSERT ON Inventario
FOR EACH ROW 
INSERT INTO AUDITORIA (tabla,fecha_hora_accion, tipo_accion)
VALUES ('Inventario' ,(SELECT now()),'INSERT');


CREATE TRIGGER UPDATE_Inventario BEFORE UPDATE ON Inventario
FOR EACH ROW 
INSERT INTO AUDITORIA (tabla,fecha_hora_accion, tipo_accion)
VALUES ('Inventario' ,(SELECT now()),'UPDATE');

CREATE TRIGGER DELETE_Inventario BEFORE DELETE ON Inventario
FOR EACH ROW 
INSERT INTO AUDITORIA
    SET tipo_accion = 'DELETE',
     tabla = 'Inventario' ,
     fecha_hora_accion = NOW(),
     CAMBIOS_REALIZADOS = OLD.id_producto_inven;  
-- ===================================================
-- InventarioXVenta
-- ===================================================
CREATE TRIGGER INSERT_InventarioXVenta BEFORE INSERT ON InventarioXVenta
FOR EACH ROW 
INSERT INTO AUDITORIA (tabla,fecha_hora_accion, tipo_accion)
VALUES ('InventarioXVenta' ,(SELECT now()),'INSERT');


CREATE TRIGGER UPDATE_InventarioXVenta BEFORE UPDATE ON InventarioXVenta
FOR EACH ROW 
INSERT INTO AUDITORIA (tabla,fecha_hora_accion, tipo_accion)
VALUES ('InventarioXVenta' ,(SELECT now()),'UPDATE');

CREATE TRIGGER DELETE_InventarioXVenta BEFORE DELETE ON InventarioXVenta
FOR EACH ROW 
INSERT INTO AUDITORIA
    SET tipo_accion = 'DELETE',
     tabla = 'InventarioXVenta' ,
     fecha_hora_accion = NOW(),
     CAMBIOS_REALIZADOS = OLD.id_InventarioXVenta;  
-- ===================================================
-- Proveedores
-- ===================================================
CREATE TRIGGER INSERT_Proveedores BEFORE INSERT ON Proveedores
FOR EACH ROW 
INSERT INTO AUDITORIA (tabla,fecha_hora_accion, tipo_accion)
VALUES ('Proveedores' ,(SELECT now()),'INSERT');


CREATE TRIGGER UPDATE_Proveedores BEFORE UPDATE ON Proveedores
FOR EACH ROW 
INSERT INTO AUDITORIA (tabla,fecha_hora_accion, tipo_accion)
VALUES ('Proveedores' ,(SELECT now()),'UPDATE');

CREATE TRIGGER DELETE_Proveedores BEFORE DELETE ON Proveedores
FOR EACH ROW 
INSERT INTO AUDITORIA
    SET tipo_accion = 'DELETE',
     tabla = 'Proveedores' ,
     fecha_hora_accion = NOW(),
     CAMBIOS_REALIZADOS = OLD.Nit_proveedor;  
-- ===================================================
-- Compras
-- ===================================================
CREATE TRIGGER INSERT_Compras BEFORE INSERT ON Compras
FOR EACH ROW 
INSERT INTO AUDITORIA (tabla,fecha_hora_accion, tipo_accion)
VALUES ('Compras' ,(SELECT now()),'INSERT');


CREATE TRIGGER UPDATE_Compras BEFORE UPDATE ON Compras
FOR EACH ROW 
INSERT INTO AUDITORIA (tabla,fecha_hora_accion, tipo_accion)
VALUES ('Compras' ,(SELECT now()),'UPDATE');

CREATE TRIGGER DELETE_Compras BEFORE DELETE ON Compras
FOR EACH ROW 
INSERT INTO AUDITORIA
    SET tipo_accion = 'DELETE',
     tabla = 'Compras' ,
     fecha_hora_accion = NOW(),
     CAMBIOS_REALIZADOS = OLD.id_Compra;  
-- ===================================================
