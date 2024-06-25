select * from employee;
select * from extra;
select * from extra_version;
select * from manufacturer;
select * from model;
select * from sale;
select * from vehicle;
select * from version;

insert into sale (sale_date, channel, id_vehicle, id_employee, id_customer)
VALUES ("2018-11-04", "radio", 2, 3, 1);

-- count ventas por empleado
SELECT employee.name, count(sale.id) FROM sale
INNER JOIN employee ON id_employee = employee.id
GROUP BY employee.name;

SELECT employee.name, count(sale.id) FROM sale
INNER JOIN employee ON id_employee = employee.id where channel = "phone"
GROUP BY employee.name;-- aqui tenemos una con filtro where

-- count compar por cliente
select c.email, count(s.id) from sale s /* le podemos dar apodos para las tablas asi
"sale s" donde "sale" es el nombre de la tabla y "s" es el apodo, tener en 
cuenta que no podemos dar el mismo apodo a diferentes tablas */
inner join customer c on s.id_customer = c.id
group by c.email;

-- fabricante mas vendido
select manufacturer.name, count(sale.id) from sale
inner join vehicle on sale.id_vehicle = vehicle.id
inner join manufacturer on vehicle.id_manufacturer = manufacturer.id
group by manufacturer.name;


-- version mas vendida
select vehicle.id_version, count(sale.id) from sale
inner join vehicle on sale.id_vehicle =vehicle.id
group by vehicle.id_version;

-- extra vendido

-- ventas agrupando por año, mes, dia
SELECT * FROM concesionario.sale;
select year(sale_date) from sale
group by sale_date;