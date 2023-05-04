/* Easy SQL queries practice */


SELECT * FROM products;

/* Show the category_name and description from the categories table sorted by category_name.*/

SELECT 
	category_name,
    description
FROM categories
ORDER BY category_name;

/* Show all the contact_name, address, city of all 
customers which are not from 'Germany', 'Mexico', 'Spain' */

select 
	contact_name,
	address,
    city
FROM customers
WHERE country NOT IN ('Germany', 'Mexico', 'Spain');

/* Show order_date, shipped_date, customer_id, 
Freight of all orders placed on 2018 Feb 26 */

SELECT 
	order_date,
    shipped_date,
    customer_id,
    freight
from orders
WHERE order_date = '2018-02-26';

/* Show the employee_id, order_id, customer_id,
required_date, shipped_date 
from all orders shipped later than the required date */

SELECT 
	employee_id,
    order_id,
    customer_id,
    required_date,
    shipped_date
FROM orders
WHERE shipped_date > required_date;

/* Show all the even numbered Order_id from the orders table */

SELECT 
	order_id
FROM orders
	where mod(order_id,2)=0;
    
/* Show the city, company_name, contact_name of 
all customers from cities which contains 
the letter 'L' in the city name, sorted by contact_name */

SELECT 
	city,
    company_name,
    contact_name
FROM customers
WHERE city LIKE '%L%' 
ORDER BY contact_name;

/* Show the company_name, contact_name,
fax number of all customers that has a fax number. (not null)*/

SELECT 
	company_name,
    contact_name,
    fax
FROM customers
WHERE fax is not NULL;

/* Show the first_name, 
last_name of the most recently hired employee.*/

SELECT
	first_name,
    last_name,
    MAX(hire_date) AS hire_date
from employees;

/* Show the average unit price rounded to 2 decimal places, 
the total units in stock, 
total discontinued products from the products table.*/

SELECT
	ROUND(AVG(unit_price), 2) AS avg_unit_price,
    SUM(units_in_stock) AS total_units,
    SUM(discontinued) as total_discontinued
FROM products;