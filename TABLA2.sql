
-- Creacion de tablas
CREATE TABLE employees(
name VARCHAR(10),
id int,
married BOOLEAN,
genre CHAR(1)
);

-- Ver datos de una table
SELECT * FROM employees_2023;

-- borrar tablas
DROP TABLE employees;
    
-- insertar datos
INSERT INTO employees(name, id, married, genre) VALUES(1, "aaron", TRUE, "m");
INSERT INTO employees(id, married) VALUES(2, FALSE);

-- Tipo de dato: NUMERIC
CREATE TABLE employees(
id int,
name VARCHAR(10),
married BOOLEAN,
genre CHAR(1),
salary NUMERIC(9,2)
);

INSERT INTO employees(id, name, married, genre, salary) VALUES(1, "aaron", TRUE, "m", 2300.33);

-- Tipo de dato: DATE
CREATE TABLE employees(
id int,
name VARCHAR(10),
married BOOLEAN,
genre CHAR(1),
salary NUMERIC(9,2),
birth_date DATE
);

INSERT INTO employees(id, name, married, genre, salary, birth_date) VALUES(1, "aaron", TRUE, "m", 2300.33, "1998-04-15");

-- Tipo de dato: TIME
CREATE TABLE employees(
id int,
name VARCHAR(10),
married BOOLEAN,
genre CHAR(1),
salary NUMERIC(9,2),
birth_date DATE,
start_at TIME
);

INSERT INTO employees(id, name, married, genre, salary, birth_date, start_at)
 VALUES(1, "aaron",TRUE, "m", 2300.33, "1998-04-15", "08:30:00");

-- renombrar tabla: podemos realizar diferentes acciones sobre las tablas ya creadas, como remonbrarlas sin la necesidad de borrarla y volverla a crear
ALTER TABLE employees2 RENAME TO employees_2022;

-- agregar columnas
ALTER TABLE employees ADD COLUMN email VARCHAR(100);

-- borrar columnas
ALTER TABLE employees DROP COLUMN email;

-- Primary key; nos permite añadir esta palabra reservada que no dejara que se dupliquen valores de la fila en diferentes columnas( diferentes usuarios por ejemplo, EN ESTE CASO SE LO AÑADIMOS A LA COLUMNA ID
CREATE TABLE employees(
id SERIAL PRIMARY KEY,
name VARCHAR(10),
married BOOLEAN,
genre CHAR(1),
salary NUMERIC(9,2),
birth_date DATE,
start_at TIME
);

INSERT INTO employees(name, married, genre, salary, birth_date, start_at)
 VALUES("SIMON",TRUE, "m", 2300.33, "1998-04-15", "08:30:00");
 -- VERIFICAR QUE NO SE PUEDEN DUPLICAR VALORES EN LA COLUNMA ID
 INSERT INTO employees(id, name, married, genre, salary, birth_date, start_at)
 VALUES(1, "SIMON",TRUE, "m", 2300.33, "1998-04-15", "08:30:00");
DROP TABLE employees;
SELECT * FROM employees;

-- Podemos decirle que un campo sea obligatorio con NOT NULL
CREATE TABLE employees(
id SERIAL PRIMARY KEY,
name VARCHAR(100) NOT NULL,
married BOOLEAN,
genre CHAR(1),
salary NUMERIC(9,2),
birth_date DATE,
start_at TIME
);

-- podemos decirle a un campo que sea unico con "UNIQUE"
CREATE TABLE employees(
id SERIAL PRIMARY KEY,
name VARCHAR(100) NOT NULL,
email VARCHAR(100) UNIQUE,
married BOOLEAN,
genre CHAR(1),
salary NUMERIC(9,2),
birth_date DATE,
start_at TIME
);
INSERT INTO employees(name, email, married, genre, salary, birth_date, start_at)
 VALUES("aaron", "adg@gmail.com", TRUE, "m", 2300.33, "1998-04-15", "08:30:00");

-- Tambien le podemos decir a un campo que compruebe y limite el rango de los datos, como un cumpleaños despues de cierta fecha o un salario a partir de cierto monto
CREATE TABLE employees(
id SERIAL PRIMARY KEY,
name VARCHAR(100) NOT NULL,
email VARCHAR(100) UNIQUE,
married BOOLEAN,
genre CHAR(1),
salary NUMERIC(9,2) CHECK (salary > 0),
birth_date DATE,
start_at TIME
);
INSERT INTO employees(name, email, married, genre, salary, birth_date, start_at)
 VALUES("aaron", "adg@gmail.com", TRUE, "m", 1, "1998-04-15", "08:30:00");