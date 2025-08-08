SELECT ARRAY[1, 2, 3, 4] AS int_array;
SELECT ARRAY['apple', 'banana', 'cherry'] AS text_array;


SELECT array_append(ARRAY[1, 2, 3], 4) AS result;  


SELECT array_prepend(0, ARRAY[1, 2, 3]) AS result;  


SELECT array_cat(ARRAY[1, 2], ARRAY[3, 4]) AS result;  

SELECT array_replace(ARRAY['a', 'b', 'c'], 'b', 'z') AS result;  

SELECT array_remove(ARRAY[1, 2, 2, 3], 2) AS result;  



SELECT 5 = ANY(ARRAY[2, 4, 5, 6]) AS found; 


SELECT 10 = ALL(ARRAY[10, 10, 10]) AS all_match;  

SELECT 10 = ALL(ARRAY[10, 9, 10]) AS all_match;   



-- temporary table
CREATE TEMP TABLE TEACHERS (
    id SERIAL PRIMARY KEY,
    name TEXT,
    PHONES TEXT ARRAY
);


INSERT INTO TEACHERS (name, PHONES)
VALUES
    ('Alice', ARRAY['(111)-222-3333', '(555)-666-7777']);
	

SELECT
    name,
    PHONES
FROM TEACHERS;

SELECT
    name,
    PHONES [1]
FROM TEACHERS;

SELECT
    ID,
    name,
    UNNEST(PHONES)
FROM TEACHERS;



CREATE TEMP TABLE STUDENTS (
    id SERIAL PRIMARY KEY,
    name TEXT,
    GRADE INT [][]
);

INSERT INTO STUDENTS (name, GRADE)
VALUES
    ('Alice', '{90,2020}');


SELECT * FROM STUDENTS

SELECT GRADE[1] FROM STUDENTS


