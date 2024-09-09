-- DROP DATABASE IF EXISTS ventas_aki; 
-- lo escribi como mensaje porque me elimina las bases de datos insertadas, mensaje "no existe la tabla"
CREATE DATABASE  IF NOT EXISTS ventas_aki ;
USE ventas_aki;
-- tablas que contienen PK/FK
CREATE TABLE IF NOT EXISTS ventas (
id_venta INT UNSIGNED AUTO_INCREMENT PRIMARY KEY ,
id_producto INT NOT NULL,
id_cliente INT NOT NULL,
id_territorio INT NOT NULL,
id_vendedor INT NOT NULL,
cod_pago INT NOT NULL,

fecha_venta DATE,
fecha_entrega DATE,
fecha_pago DATE,
valor_unidad INT NOT NULL,
cantidad INT NOT NULL,
costos_directos DECIMAL(10,2),
costos_indirectos DECIMAL(10,2),
FOREIGN KEY(id_producto) REFERENCES producto (id_producto),
FOREIGN KEY(id_cliente) REFERENCES clientes (id_cliente),
FOREIGN KEY(cod_pago) REFERENCES medios_de_pago (cod_pago),
FOREIGN KEY(id_vendedor) REFERENCES vendedor (id_vendedor),
FOREIGN KEY(id_territorio) REFERENCES territorio (id_territorio)
);
SELECT * FROM ventas;

-- tablas solo con PK
CREATE TABLE IF NOT EXISTS vendedor (
id_vendedor INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre varchar(50) NOT NULL,
apellido varchar(50) NOT NULL,
telefono VARCHAR(15) DEFAULT NULL,
estado_civil varchar(30) DEFAULT NULL,
contrato varchar(50) DEFAULT NULL,
cod_Suc int(5) DEFAULT NULL,
nombre_suc varchar(10) DEFAULT NULL,
genero varchar(10) DEFAULT NULL,
tamano varchar(10) DEFAULT NULL,
zona varchar(20) DEFAULT NULL,
FOREIGN KEY(id_vendedor) REFERENCES ventas(id_vendedor)
);
SELECT * FROM vendedor;
-- tengo un error por cod_pago. 
CREATE TABLE IF NOT EXISTS medios_de_pago (
cod_pago INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
descripcion VARCHAR (50) NOT NULL,
descripcion_abreviada VARCHAR (20) NOT NULL,
categoria_de_pago VARCHAR (10) NOT NULL,
descuento_por_metodo_de_pago VARCHAR (10) NOT NULL,
FOREIGN KEY(cod_pago) REFERENCES ventas(cod_pago)
);
SELECT * FROM medios_de_pago;

CREATE TABLE IF NOT EXISTS producto (
id_producto INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
descripcion_abreviada varchar(100) NOT NULL,
tamano varchar(100) NOT NULL,
paquete varchar(100) NOT NULL,
embalaje varchar(100) NOT NULL,
garantia varchar(100) NOT NULL,
peso_lb int (100) NOT NULL,
dimensiones_cm varchar(100) NOT NULL,
FOREIGN KEY(id_producto) REFERENCES ventas (id_producto)
);
SELECT * FROM producto;

CREATE TABLE IF NOT EXISTS clientes (
id_cliente INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
dni int (100) NOT NULL,
nombre_completo varchar(100) NOT NULL,
numero_de_contacto varchar(100) NOT NULL,
email varchar(100) NOT NULL,
genero varchar(100) NOT NULL,
ocupacion varchar(100) NOT NULL,
educacion varchar(100) NOT NULL,
descuento int (100) NOT NULL,
codigo_cliente_frecuente int (100) NOT NULL,
FOREIGN KEY(id_cliente) REFERENCES ventas (id_cliente)
);
SELECT * FROM clientes;

CREATE TABLE IF NOT EXISTS territorio (
id_territorio INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
pais varchar(30) NOT NULL,
continente varchar(30) NOT NULL,
ciudad varchar(30) NOT NULL,
latitud DECIMAL(10,5) NOT NULL,
longitud DECIMAL(10,5) NOT NULL,
FOREIGN KEY(id_territorio) REFERENCES ventas (id_territorio)
);
SELECT * FROM territorio;

# cree esta tabla puente pero no se si esta bien
-- CREATE TABLE ventasVARIAS (
-- id_producto INT NOT NULL,
-- id_cliente INT NOT NULL,
-- id_territorio INT NOT NULL,
-- cod_pago INT NOT NULL,
-- id_vendedor INT NOT NULL,
-- PRIMARY KEY (id_producto, id_cliente, id_territorio, cod_pago, id_vendedor),
-- FOREIGN KEY(id_producto) REFERENCES producto (id_producto),
-- FOREIGN KEY(id_cliente) REFERENCES clientes (id_cliente),
-- FOREIGN KEY(cod_pago) REFERENCES medios_depago (cod_pago),
-- FOREIGN KEY(id_vendedor) REFERENCES vendedor (id_vendedor),
-- FOREIGN KEY(id_territorio) REFERENCES territorio (id_territorio)
-- );

