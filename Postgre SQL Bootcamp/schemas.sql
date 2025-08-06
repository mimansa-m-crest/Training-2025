SELECT * FROM public.employees;

SELECT * 
FROM humanresources.employees;

create schema humanresources

alter table public.countries set schema public


select current_schema();

show search_path;

set search_path to humanresources,public;

create database test_schema;

create table public.songs(
song_id serial primary key,
song_title varchar(50)
);

insert into public.songs(song_title) values 
('counting star');


select * from public.songs



SELECT
    COALESCE(c1.table_name, c2.table_name) AS table_name,
    COALESCE(c1.column_name, c2.column_name) AS table_column,
    c1.column_name AS schema1_column,
    c2.column_name AS schema2_column
FROM (
    SELECT table_name, column_name
    FROM information_schema.columns c
    WHERE c.table_schema = 'public'
) c1
FULL JOIN (
    SELECT table_name, column_name
    FROM information_schema.columns c
    WHERE c.table_schema = 'humanresources'
) c2
ON c1.table_name = c2.table_name
AND c1.column_name = c2.column_name
ORDER BY table_name, table_column;



