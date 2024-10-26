-- DROP DATABASE IF EXISTS ventas_aki; 
-- lo escribi como mensaje porque me elimina las bases de datos insertadas, mensaje "no existe la tabla"
CREATE DATABASE IF NOT EXISTS ventas_aki;
USE ventas_aki;

-- tablas solo con PK
CREATE TABLE IF NOT EXISTS vendedor (
    id_vendedor INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre_completo VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    telefono VARCHAR(15) DEFAULT NULL,
    estado_civil VARCHAR(30) DEFAULT NULL,
    contrato VARCHAR(50) DEFAULT NULL,
    cod_suc INT UNSIGNED,
    nombre_suc VARCHAR(10) DEFAULT NULL,
    genero VARCHAR(10) DEFAULT NULL,
    tamano VARCHAR(10) DEFAULT NULL,
    zona VARCHAR(20) DEFAULT NULL
);
SELECT * FROM vendedor;

CREATE TABLE IF NOT EXISTS medios_de_pago (
    cod_pago INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
    descripcion VARCHAR(50) NOT NULL,
    descripcion_abreviada VARCHAR(20) NOT NULL,
    categoria_de_pago VARCHAR(10) NOT NULL,
    descuento_por_metodo_de_pago VARCHAR(10) NOT NULL
);
SELECT * FROM medios_de_pago;

CREATE TABLE IF NOT EXISTS producto (
    id_prod INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    descripcion_abreviada VARCHAR(100) NOT NULL,
    tamano VARCHAR(100) NOT NULL,
    paquete VARCHAR(100) NOT NULL,
    embalaje VARCHAR(100) NOT NULL,
    garantia VARCHAR(100) NOT NULL,
    peso_lb INT UNSIGNED,
    dimensiones_cm VARCHAR(100) NOT NULL
);
SELECT * FROM producto;

CREATE TABLE IF NOT EXISTS clientes (
    id_cliente INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    dni INT UNSIGNED NOT NULL,
    nombre_completo VARCHAR(100),
    numero_de_contacto VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    genero VARCHAR(100) NOT NULL,
    ocupacion VARCHAR(100) NOT NULL,
    educacion VARCHAR(100) NOT NULL,
    descuento INT UNSIGNED NOT NULL,
    codigo_cliente_frecuente INT UNSIGNED
);
SELECT * FROM clientes;

CREATE TABLE IF NOT EXISTS territorio (
    id_territorio INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    pais VARCHAR(30) NOT NULL,
    continente VARCHAR(30) NOT NULL,
    ciudad VARCHAR(30) NOT NULL,
    latitud DECIMAL(10,5) NOT NULL,
    longitud DECIMAL(10,5) NOT NULL
);SELECT * FROM territorio;
		

CREATE TABLE IF NOT EXISTS ventas (
   id_venta INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
   id_prod INT UNSIGNED NOT NULL,
   id_cliente INT UNSIGNED NOT NULL,
   id_territorio INT UNSIGNED NOT NULL,
   id_vendedor INT UNSIGNED NOT NULL,
   cod_pago INT UNSIGNED NOT NULL,
   fecha_venta DATE,
   fecha_entrega DATE,
   fecha_pago DATE,
   valor_unidad INT UNSIGNED NOT NULL,
   cantidad INT UNSIGNED NOT NULL,
   costos_directos DECIMAL(10,2),
   costos_indirectos DECIMAL(10,2),
FOREIGN KEY(id_prod) REFERENCES producto(id_prod),
FOREIGN KEY(id_cliente) REFERENCES clientes(id_cliente),
FOREIGN KEY(cod_pago) REFERENCES medios_de_pago(cod_pago),
FOREIGN KEY(id_vendedor) REFERENCES vendedor(id_vendedor),
FOREIGN KEY(id_territorio) REFERENCES territorio(id_territorio)
);
SELECT * FROM ventas;



