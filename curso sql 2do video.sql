CREATE TABLE aaron4.employees(-- con el aaron4. le estamos diciendo en que base de datos creara la tabla
id SERIAL PRIMARY KEY,
name VARCHAR(100) NOT NULL,
email VARCHAR(100) UNIQUE,
married BOOLEAN,
genre CHAR(1),
salary NUMERIC(9,2) CHECK (salary > 0),
birth_date DATE,
start_at TIME
);

DROP TABLE aaron4.employees;



-- Sentencia DML: Data manipulation language

-- 1 Consultas o recuperacion de datos

SELECT * FROM employees; -- el * es para ver todos los datos en la tabla
SELECT * FROM aaron4.employees;-- aqui le estamos especificando la ruta en la que esta la tabla
SELECT id FROM employees;-- si en vez de * le especificamos la columna nos dara esa informacion

SELECT id, name FROM employees;-- y asi especificamos multiples columnas

-- Filtrar por filas
SELECT * FROM employees WHERE id =1;
SELECT * FROM employees WHERE name = "aaron";
SELECT * FROM employees WHERE married = "true";
SELECT * FROM employees WHERE married = TRUE;
SELECT * FROM employees WHERE birth_date = "1998-04-15";
-- filtrar por varias filas con el AND que se tienen que cumplir todas las filas y con el OR que se tiene que cumplir una de las dos
SELECT * FROM aaron4.employees WHERE name = "aaron" AND salary >0;-- tambien podemos filtar solo una columna SELECT id FROM aaron4.employees;
SELECT * FROM employees WHERE married = "true" OR salary < 0;

-- 2 Insercion de datos
INSERT INTO aaron4.employees(name, email) VALUES("jujan", "jfh@gmail.com"); 
INSERT INTO aaron4.employees(name, email, married, genre, salary)
VALUES("pedro", "jfphb@gmail.com", TRUE, "M", 22.33); 
SELECT * FROM aaron4.employees;-- podemos cambiar dos columnas de una fila a la vez

-- 3 actualizar o editar datos
UPDATE aaron4.employees SET salary = 1200;-- asi actualizaria todas las filas de salary(sin el WHERE que es el que indica la fila que queremos que modifique
UPDATE aaron4.employees SET salary = 1200
WHERE id = 2;
UPDATE aaron4.employees SET genre = "F"
WHERE id = 1;
UPDATE aaron4.employees SET genre = "F", birth_date = "1998-05-15"
WHERE id = 1;-- podemos cambiar dos columnas de una fila a la vez
UPDATE aaron4.employees SET genre = NULL
WHERE id = 7;

-- 4 Borrar datos
SELECT * FROM aaron4.employees;

DELETE FROM aaron4.employees; -- asi borraria todos los datos de la tabla
DELETE FROM aaron4.employees WHERE id =6;
DELETE FROM aaron4.employees WHERE genre = "F";
DELETE FROM aaron4.employees WHERE salary < 1000;
DELETE FROM aaron4.employees WHERE salary IS NULL;