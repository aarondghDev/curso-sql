-- Ver tamaño de las bases de datos
SELECT table_schema "Base de datos", 
       ROUND(SUM(data_length + index_length) / 1024 / 1024, 2) AS "Tamaño en MB" 
FROM information_schema.tables 
where table_schema = "concesionario"
GROUP BY table_schema;-- una base de datos en especifico

SELECT table_schema "Base de datos", 
       ROUND(SUM(data_length + index_length) / 1024 / 1024, 2) AS "Tamaño en MB" 
FROM information_schema.tables 
GROUP BY table_schema;-- todas las bases de datos en myslq

-- ver tamaño de las tablas
SELECT table_schema "Base de datos", 
       ROUND(SUM(data_length + index_length) / 1024 / 1024, 2) AS "Tamaño en MB" 
FROM information_schema.tables 
where table_schema = "concesionario" and table_name = "customer"
GROUP BY table_schema;

-- joins
SELECT employee.name, employee.nif, sale.channel from sale
INNER JOIN employee ON id_employee = employee.id
group by employee.name, employee.nif, sale.channel;

SELECT employee.name, employee.nif, sale.channel, count(sale.channel)from sale
INNER JOIN employee ON id_employee = employee.id
group by employee.name, employee.nif, sale.channel;

SELECT employee.name, count(sale.id) FROM sale
INNER JOIN employee ON id_employee = employee.id
GROUP BY employee.name;

-- Guardar consultas
CREATE VIEW employee AS
SELECT * FROM employee;-- solo sirve con postgress pgadmin

-- EXPLAIN ANALYZE - como bien lo dice el nombre analiza y explica una tabla
EXPLAIN ANALYZE SELECT * FROM employee;
EXPLAIN ANALYZE SELECT * FROM sale;

-- indices
create index idx_order_pk on sale(id);
EXPLAIN ANALYZE SELECT * FROM sale;
EXPLAIN ANALYZE SELECT * FROM sale WHERE id= 3;
EXPLAIN ANALYZE SELECT id FROM customer;

/*
Particionamiento de tablas
Tecnica que permite dividir una misma tabla en multiples particiones con el objetivo
de optimizar las consultas. Hay que añadir como la queremos particionar al crear la tabla

Hay 3 tipos:
- Rango (numeros, fechas, etc)
-Lista (valores en una tabla)
-hash (partirla en x numero de partes)
*/
-- tabla base para particionar
CREATE TABLE users (
    id INT auto_increment,
    nombre VARCHAR(50),
    fecha DATE not null,
    PRIMARY KEY (id, fecha)
)
PARTITION BY RANGE (YEAR(fecha)) (
    PARTITION p0 VALUES LESS THAN (1990),
    PARTITION p1 VALUES LESS THAN (2000),
    PARTITION p2 VALUES LESS THAN (2010),
    PARTITION p3 VALUES LESS THAN MAXVALUE
);
