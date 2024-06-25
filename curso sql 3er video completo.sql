CREATE DATABASE concesionario;
CREATE TABLE manufacturer(
id int AUTO_INCREMENT,/* usamos el "auto_increment" para que coincida los
tipos de datos de esta columna con los de la otra columna 
de la otra tabla que queremos vincular */
name VARCHAR(50) NOT NULL,
num_employees INT,
constraint pk_manufacturer PRIMARY KEY (id)-- esto seria otra forma de poner resticciones, al final ponemos la reesticcion y entre los parentsisi podemos poner varios campos
);
 select * from manufacturer;
 drop table manufacturer;
 
insert into manufacturer (id, name, num_employees)
 values(1, "ford", 29000);
insert into manufacturer (id, name, num_employees)
 values(2,"Toyota", 4000);
 
 CREATE TABLE model(
id INT auto_increment,
name VARCHAR(50) NOT NULL,
id_manufacturer int,
constraint pk_manufacturer PRIMARY KEY (id),
constraint fk_model_manufacturer FOREIGN KEY(id_manufacturer) 
REFERENCES manufacturer(id)-- y esta seria la manera de relacionar las tablas con una constrait y el resto de la sintaxis
);
SELECT * FROM model;

INSERT INTO model (name, id_manufacturer)
VALUES ("Prius", 1);/* y al insertar los datos le pasamos el id de la fila que nos
interese de la tabla manufacturer*/
INSERT INTO model (name, id_manufacturer)
VALUES ("Mondeo", 1);
INSERT INTO model (name, id_manufacturer)
VALUES ("Fiesta", 2);

INSERT INTO model (name, id_manufacturer)
VALUES ("Prius", 4);/* esta nos dara error ya que no hay una fila con el id 4 
(tiene que estar creada la fila en la otra tabla vinculada para poder 
usar el id en esta*/

-- VERSION

CREATE TABLE version(
id INT AUTO_INCREMENT,
name varchar (50) NOT NULL,
engine VARCHAR(50),
price NUMERIC,
cc NUMERIC(2,1),
id_model INT,
constraint pk_version PRIMARY KEY (id),
constraint fk_version_model FOREIGN KEY(id_model) REFERENCES model(id)
);
SELECT * FROM version;
INSERT INTO version(name, engine, price, cc, id_model) 
VALUES ("Basic", "diesel 4c", 30000, 2.2, 2);
INSERT INTO version(name, engine, price, cc, id_model) 
VALUES ("medium", "gasoil 2c", 20000, 2.5, 2);
INSERT INTO version(name, engine, price, cc, id_model) 
VALUES ("avnazado", "diesel 3c", 25000, 1.9, 2);

INSERT INTO version(name, engine, price, cc, id_model) 
VALUES ("sport", "diesel 6c", 80000, 4.1, 3);
INSERT INTO version(name, engine, price, cc, id_model) 
VALUES ("sport advanced", "diesel 5c", 50000, 3, 3);

-- Extra
CREATE TABLE extra(
id INT AUTO_INCREMENT,
name varchar (50) NOT NULL,
description VARCHAR(300),
CONSTRAINT pk_extra PRIMARY KEY(id)
);
SELECT * FROM extra;
INSERT INTO extra(name, description)
VALUES("Climatizador", "climatizador integrado gradual a conveniencia...");
INSERT INTO extra(name, description)
VALUES("Levas", "Lorem ipsus...");

CREATE TABLE extra_version(-- tabla para relacionar los extras conlos modelos
id_version INT,
id_extra INT,
price NUMERIC NOT NULL CHECK (price >= 0),
CONSTRAINT pk_extra_version PRIMARY KEY(id_version, id_extra),
CONSTRAINT fk_extra_version FOREIGN KEY (id_version) REFERENCES version(id),
CONSTRAINT fk_version_extra FOREIGN KEY (id_extra) REFERENCES extra(id)/*aqui estamos 
vinculando esta tabla(que la hemos creado para vincular las otras dos extra y version)
con la de extra y la de version*/
);
SELECT * FROM extra_version;
INSERT INTO extra_version VALUES(4, 3, 2000);

-- employee
CREATE TABLE employee(
id INT AUTO_INCREMENT,
name VARCHAR (30),
nif VARCHAR(9) NOT NULL UNIQUE,
phone VARCHAR(9),
CONSTRAINT pk_employee_id PRIMARY KEY (id)
);
SELECT * FROM employee;
INSERT INTO employee(name, nif, phone)
VALUES ("luis", "F9345022U", "455897865");
-- customer
CREATE TABLE customer(
id INT AUTO_INCREMENT,
name VARCHAR (30),
emai VARCHAR(30) NOT NULL UNIQUE,
CONSTRAINT pk_customer_id PRIMARY KEY (id)
);
SELECT * FROM customer;
INSERT INTO customer(name, email)
VALUES ("pepe", "ppgmail.com" );

-- vehicle
CREATE TABLE vehicle(
id INT AUTO_INCREMENT,
license_num VARCHAR(10),
creation_date DATE,
price_grooss NUMERIC,
price_net NUMERIC,
type VARCHAR(30),

id_manufacturer INT,
id_model INT,
id_version INT,
id_extra INT,

CONSTRAINT pk_vehicle_id PRIMARY KEY (id),
CONSTRAINT fk_vehicle_manufacturer FOREIGN KEY (id_manufacturer)
REFERENCES manufacturer(id),
CONSTRAINT fk_vehicle_model FOREIGN KEY (id_model)
REFERENCES model(id),
CONSTRAINT fk_vehicle_extra_version FOREIGN KEY (id_version, id_extra)
REFERENCES extra_version(id_version, id_extra)/* ok aqui hemos relacionado las dos columnas
(id_extra y id_version) con la tabla extra_version y sus respectivas columnas(id_extra y id_version)
podemos vincular dos columnas o mas con otras dos columnas de otra tabla(o mas) */
);
SELECT * FROM vehicle;
INSERT INTO vehicle (license_num, price_grooss, id_manufacturer, id_model, id_version, id_extra)
VALUES("2456LL", 60000, 1, 2, 3, 2);

-- sale
CREATE TABLE sale(
id INT AUTO_INCREMENT,
sale_date DATE,
channel VARCHAR(300),

id_vehicle INT,
id_employee INT,
id_customer INT,

CONSTRAINT pk_sale PRIMARY KEY (id),
CONSTRAINT fk_sale_vehicle FOREIGN KEY (id_vehicle) REFERENCES vehicle(id),
CONSTRAINT fk_sale_employee FOREIGN KEY (id_employee) REFERENCES employee(id),
CONSTRAINT fk_sale_customer FOREIGN KEY (id_customer) REFERENCES customer(id)
);
SELECT * FROM sale; 
INSERT INTO sale(sale_date, channel, id_vehicle, id_employee, id_customer)
VALUES("2023-01-12", "phone", 1, 1, 1);