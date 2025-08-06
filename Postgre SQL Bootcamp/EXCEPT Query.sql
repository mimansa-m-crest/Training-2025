SELECT * FROM L_PROD
EXCEPT
SELECT* FROM R_PROD


select first_name, last_name from directors
except
select first_name, last_name from actors
where gender = 'f'


