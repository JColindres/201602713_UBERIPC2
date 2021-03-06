CREATE TABLE CLIENTE(
ID_CLIENTE INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
NOMBRE VARCHAR(50) NOT NULL,
APELLIDO VARCHAR(50) NOT NULL,
NACIMIENTO DATE NOT NULL
);

CREATE TABLE PROPIETARIO(
ID_PROPIETARIO INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
NOMBRE VARCHAR(50) NOT NULL,
APELLIDO VARCHAR(50) NOT NULL
);

CREATE TABLE SERVICIO(
ID_SERVICIO INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
TIPO_SERVICIO VARCHAR(50) NOT NULL
);

CREATE TABLE CARACTERISTICA(
ID_CLIENTE INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
DESCRIPCION VARCHAR(50),
ID_SERVICIO INT NOT NULL,
FOREIGN KEY (ID_SERVICIO) REFERENCES SERVICIO(ID_SERVICIO)
ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE PROPIETARIO_SERVICIO(
ID_PS INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
ID_PROPIETARIO INT NOT NULL,
FOREIGN KEY (ID_PROPIETARIO) REFERENCES PROPIETARIO(ID_PROPIETARIO)
ON DELETE CASCADE ON UPDATE CASCADE,
ID_SERVICIO INT NOT NULL,
FOREIGN KEY (ID_SERVICIO) REFERENCES SERVICIO(ID_SERVICIO)
ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE CLIENTE_SERVICIO(
ID_CS INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
COSTO INT NOT NULL,
UBICACION VARCHAR(50) NOT NULL,
DESTINO VARCHAR(50) NOT NULL,
TIEMPO TIME NOT NULL,
ID_SERVICIO INT NOT NULL,
FOREIGN KEY (ID_SERVICIO) REFERENCES SERVICIO(ID_SERVICIO)
ON DELETE CASCADE ON UPDATE CASCADE
);

ALTER TABLE PROPIETARIO
ADD COLUMN NACIMIENTO DATE;

ALTER TABLE CLIENTE_SERVICIO
MODIFY UBICACION INT NOT NULL;

ALTER TABLE CLIENTE_SERVICIO
ADD CONSTRAINT ID_CLIENTE INT FOREIGN KEY REFERENCES CLIENTE(ID_CLIENTE);