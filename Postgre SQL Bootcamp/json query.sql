CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    metadata JSONB 
);


INSERT INTO users (name, metadata)
VALUES 
('Alice', '{"age": 30, "location": "New York", "interests": ["music", "travel"]}'),
('Bob', '{"age": 25, "location": "London", "verified": true}');


select * from users 
where metadata ->> 'age' = '30'



UPDATE users
SET metadata = jsonb_set(metadata, '{verified}', 'true')
WHERE name = 'Alice';


-- Add "membership": "gold" to metadata
UPDATE users
SET metadata = jsonb_set(metadata, '{location}', '"mumbai"')
WHERE name = 'Bob';

select * from users


DELETE FROM users
WHERE metadata ->> 'verified' = 'false';


select * from directors

select row_to_json(directors) from directors;



SELECT 
  director_id,
  first_name,
  last_name,
  (
    SELECT json_agg(x) 
    FROM (
      SELECT movie_name 
      FROM movies	
      WHERE movies.director_id = directors.director_id
    ) AS x
  ) AS all_movies
FROM directors;



SELECT
  *,
  json_array_length(movies -> 'all_movies') AS "total_movies"
FROM diretors;

CREATE TABLE directors_docs (
  id SERIAL PRIMARY KEY,
  body JSONB  
);

SELECT * FROM directors_docs
WHERE body ? 'John Woo';


INSERT INTO directors_docs (body)
VALUES 
  ('{"first_name": "John", "last_name": "Woo", "movies": ["Hard Boiled", "Face/Off"]}'),
  ('{"first_name": "Quentin", "last_name": "Tarantino", "movies": ["Pulp Fiction"]}');

SELECT *
FROM directors_docs
WHERE body @> '{"first_name": "John"}';



select * from contacts_docs


SELECT *
FROM contacts_docs
WHERE body @> '{"first_name": "Candice"}';


EXPLAIN ANALYZE SELECT *
FROM contacts_docs
WHERE body @> '{"first_name": "Candice"}';


CREATE INDEX idx_gin_CONTACTS_DOCS_body_cool ON contacts_docs
USING GIN (body jsonb_path_ops);

select pg_size_pretty(	pg_relation_size('idx_gin_CONTACTS_DOCS_body_cool'::regclass)) as index_name;


