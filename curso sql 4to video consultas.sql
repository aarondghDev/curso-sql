-- Consultas avanzadas ( con filtros)
/*distinct" sirve para filtrar ls resultados de una columna
sin que se repitan valores (o que sean distintos)*/
SELECT distinct name FROM customer;-- aqui nos devolver sin valores repetidos
SELECT name FROM customer;-- y aqui vemos que hay valores repetidos

-- filtros= and, or, not
SELECT * FROM customer WHERE name != "juan";-- not -> !=
SELECT name FROM customer WHERE NOT name = "juan";-- tambien se puede expresar de esta manera

SELECT * FROM customer WHERE name = "aaron" or email = "jjgmail.com";-- or
SELECT * FROM customer WHERE name = "aaron" or name = "juan";-- or
SELECT email FROM customer WHERE name = "aaron" or email = "jjgmail.com";-- or
SELECT * FROM customer WHERE name = "aaron" or id = 1 order by name;

SELECT * FROM customer WHERE name = "aaron" and id = 5 order by name;-- and
SELECT * FROM customer WHERE name = "aaron" and id = 3 order by name;-- and

-- podemos filtar por aqullas columnas que tengan valor nulo
select * from customer where name is not null;
select * from customer where name is null;

/*group by - existe una funcion "count" que nos contara si un valor se repite 
en alguna fila de alguna columna y las agrupara con el group by en una sola 
fila y nos devolvera el numero que se repite en varias filas de esa columna*/
select name, email from customer group by name, email;
select name from customer group by name;

select count(name) from customer;-- count simple, las de abajo son mas visuales para ver los datos
select name, count(name) from customer group by name;-- count
select email, name, count(name and email) from customer group by name, email;-- count
select email, name, count(name) from customer group by name, email;-- count
SELECT channel, count(channel) from sale
group by channel;-- count
select * from customer;

SELECT film.tittle, count (inventory.inventory_id) FROM film
inner join inventory ON inventory.film_id = film.film_id WHERE tittle="spiderman"
GROUP BY tittle; /* supongamos que tenemos dos tablas una film y otra 
inventory, en la de inventory tenemos cuantas tenemos de cada pelicula
entonces queremos sacar cuantas peliculas tenemos de un titulo en concreto, 
lo hacemos asi*/
/* HAVING - clausula para filtar los group by , ya que la de where no se 7
puede usar en este caso*/
SELECT name, count(name) FROM customer GROUP BY name
HAVING count(name)>1;

select name, count(name) as num from customer group by name;/* el "count nos 
genera una columna nueva llamada por defecto count, con el "as" podemos cambiar
el nombre en este caso a "num"*/

/* le podemos decir que nos ordene cierta columna con la clausula
 "order by", y tambien con la clausula DESC le decimos que la ordene
 de manera descendente ej=*/
SELECT * FROM customer order by name ;
SELECT * FROM customer order by name DESC;

-- joins: consulta a 2 tablas (Sale y vehicle) tienen que estar relacionadas
SELECT * FROM customer;
SELECT * FROM manufacturer;
SELECT * FROM sale;-- idvehicle idemployee idcustomer
SELECT * FROM vehicle;
SELECT * FROM employee;

select sale.id, sale_date, channel, vehicle.id, license_num, price_grooss from sale 
inner join vehicle on sale.id_vehicle = vehicle.id; /* la sintaxis seria el inner join( tambien
 hay otros tipos de join pero el mas usado es el inner join*/
 
select manufacturer.id, name, vehicle.id, license_num from vehicle 
inner join manufacturer on vehicle.id_manufacturer = manufacturer.id;

select * from sale 
inner join vehicle on sale.id_vehicle = vehicle.id;

-- Consulta a 3 tablas
SELECT * FROM customer; 
SELECT * FROM manufacturer; 
SELECT * FROM sale;-- idvehicle idemployee idcustomer
SELECT * FROM vehicle;
SELECT * FROM employee;
SELECT * FROM model;

select employee.id, name, sale.id, sale_date, channel, vehicle.id, license_num, price_grooss from sale 
inner join vehicle on sale.id_vehicle = vehicle.id
inner join employee on sale.id_employee = employee.id;

 select model.id, model.name, manufacturer.id, manufacturer.name, vehicle.id, license_num from vehicle 
inner join manufacturer on vehicle.id_manufacturer = manufacturer.id
inner join model on vehicle.id_model = model.id
;

-- concat - otra funcion que nos permite concatenar columnas
select concat (name, " ", email)  from customer;-- el " " es para dejar un espacio, es opcional

/* like - nos sirve para filtar todo aquello que tenga cierto valor sin 
necesidad de poner todo el contenido de lo que buscamos*/
SELECT * FROM customer WHERE name like "%n"; /*si le ponemos un solo % empezando
esto le dice que solo busque aquellas que terminen con el valor n (en este caso)*/
SELECT * FROM customer WHERE name like "j%"; -- aqui lo mismo que arriba pero al reves
SELECT * FROM customer WHERE name like "%a%";
SELECT * FROM customer WHERE name like "%f%";

/* IN - nos permite buscar varios valores de una misma columna en diferentes 
filas de manera optimizada mas facil y rapida que estar usando or*/
SELECT * FROM customer WHERE name IN ("aaron", "juan");

SELECT * FROM customer WHERE name = "aaron" or name = "juan";-- esta seria la manera lenta 

-- SUM - funcion para sumar, es parecida la sintaxis a la de count
select sum(id) from customer;-- sum simple, las de abajo son mas visuales para ver los datos
select name, sum(id) from customer group by name;-- sum
select email, name, sum(id) from customer group by name, email;-- sum
select * from customer;

SELECT film.tittle, sum (inventory.inventory_id) FROM film
inner join inventory ON inventory.film_id = film.film_id WHERE tittle="spiderman"
GROUP BY tittle;

-- SUM entre tablas 
SELECT sale.channel, sum(sale.id_employee) from sale
inner join employee on sale.id_employee = employee.id
group by sale.channel;


/* select dentro de un select, puede servir si queremos recuperar una dato
de otra tabla pero solo tenemos el nombre y necesitamos el id que es el que 
tenemos en la tabla que queremos recuperar*/
select channel from sale where id_employee =(select id from employee
where phone ='655769089');

SELECT tittle FROM film
WHERE language_id = (SELECT language_id FROM language WHERE name="spiderman");