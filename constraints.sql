
CREATE TYPE address AS (
  city VARCHAR(50),
  country VARCHAR(20)
);


CREATE TABLE companies (
  comp_id SERIAL PRIMARY KEY,
  address address
);


INSERT INTO companies (address)
VALUES (ROW("NEW YORK", "US"));


CREATE TYPE mycolors AS ENUM ('red', 'green', 'blue');


ALTER TYPE MYCOLORS RENAME VALUE 'red' TO 'orange'

SELECT ENUM_RANGE(NULL::MYCOLORS)

alter type mycolors add value 'purple' after 'green'



alter table tablename
drop constraint cname;

alter table table_items
drop constraint table_items_pkey;

alter table table_items
add primary key(item_id, item_name)



create table staff (
staff_id serial primary key,
full_name varchar(50),
birthdate date check (birthdate > '1900-01-01'),
joined_date date check (joined_date > birthdate),
salary numeric check (salary > 0)
);


select * from staff


add constraint price_check
check (
price > 0
and discount > 10
and price > discount
);

alter table prices
rename constraint price_check to price_discount_check

-- use drop to drop constraint

