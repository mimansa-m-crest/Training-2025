select cast ('10' as integer);

select cast ('2025-01-01' as date);

select cast ('T' as boolean);

select 
substr('123456',4) as "implicit",
substr (cast('123456' as text), 4) as "explicit";


create table ratings(
id serial primary key,
rating varchar(1) not null
);

insert into ratings (rating) values
('1'),
('2'),
('3'),
('4');

SELECT * FROM RATINGS

SELECT
  id,
  CASE
    WHEN rating ~ '^\d+$' THEN CAST(rating AS integer)
    ELSE 0
  END AS rating
FROM 
  ratings;


select to_number(
'$1240.64', 
'L9G999D99'
)


SELECT 
TO_TIMESTAMP ('2020   MAY', 'YYYY  MON');
