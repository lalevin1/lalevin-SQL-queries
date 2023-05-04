/**MEDIUM**/
    
/* Show the ProductName, CompanyName,
CategoryName from the products, 
suppliers, and categories table */

SELECT
	 p.product_name, s.company_name, c.category_name
from products p 
JOIN suppliers s ON s.supplier_id = p.supplier_id
JOIN categories c ON c.category_id = p.category_id;

/* Show the category_name and the average product
unit price for each category rounded to 2 decimal places. */ 

SELECT
	category_name,
    ROUND(AVG(unit_price), 2) AS avg_unit_price
FROM categories c 
JOIN products p ON c.category_id = p.category_id
GROUP BY category_name;

/* Show the city, company_name, contact_name 
from the customers and suppliers table merged together.
Create a column which contains 'customers' or 'suppliers'
depending on the table it came from. */

SELECT
	city, company_name, contact_name, 'customers' AS relationship
FROM customers
uNION
SELECT city, company_name, contact_name, 'suppliers' AS relationship
from suppliers;

/**HARD**/
	
/* Show the employee's first_name 
and last_name, a "num_orders" column with a count of the orders
taken, and a column called "Shipped" that displays "On Time" 
if the order shipped on time and "Late" 
if the order shipped late.

Order by employee last_name, 
then by first_name, and then descending by number of orders. */

SELECT
	e.first_name,
    e.last_name,
    COUNT(o.order_id) AS num_orders,
  	(
      CASE
      	WHEN o.shipped_date < o.required_date THEN 'On Time'
      	ELSE 'Late'
      END
     ) AS shipped 
from orders o 
	JOIN employees e ON o.employee_id = e.employee_id
GROUP BY 
	e.last_name,
    e.first_name,
    shipped 
ORDER BY
	e.last_name,
    e.first_name,
    num_orders DESC;