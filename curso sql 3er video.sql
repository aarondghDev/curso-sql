SELECT * FROM employees;
-- filtrar filas usando LIKE, nos buscara todas aquellas que tengan el valor que le digamos, puede ser una letra un numero pero sin nesecidad que sea el valor entero de el campo
SELECT * FROM employees
WHERE email LIKE "%@%";
SELECT * FROM employees
WHERE name LIKE "%p%";
SELECT * FROM employees
WHERE married LIKE "%1%";
SELECT * FROM employees
WHERE salary LIKE "%0%";-- el valor que queremos que filter debe estar entre %, esto es para que busque solo el valor que le digamos, indiferentemente de que este en el inicio de el campo, el medio o donde este, si el campo tiene ese valor tiene qeu filtrarlo, sin los % tendriamos que decirle todo lo que hay en el campo para que lo filtre

SELECT * FROM employees
WHERE email LIKE "@";-- ej de que no filtrar solo con el valor si no esta entre %
