-- 1 Exercise
/*
Difference between DML and DDL
DDL helps us to work with data bases and tables by creating,deleting and rename them
ALSO ALTER is to change already created table
DROP CREATE RENAME ALTER
DML can interact with arguments in tables by inserting deleting selecting and Updating
INSERT DELETE SELECT UPDATE
*/


-- 2 Exercise
CREATE TABLE products(
    id VARCHAR PRIMARY KEY NOT NULL,
    name varchar NOT NULL,
    description TEXT NOT NULL,
    price DOUBLE PRECISION NOT NULL
);
CREATE TABLE customers(
    id INTEGER PRIMARY KEY NOT NULL,
    full_name varchar(50) NOT NULL,
    timestamp TIMESTAMP NOT NULL ,
    delivery_adress TEXT NOT NULL
);
CREATE TABLE orders(
    code INTEGER PRIMARY KEY NOT NULL,
    total_sum DOUBLE PRECISION NOT NULL CHECK ( total_sum > 0 ),
    is_paid BOOLEAN NOT NULL,
    customer_id INTEGER NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);
CREATE TABLE order_items(
    quantity INTEGER NOT NULL CHECK (quantity > 0 ),
    order_code INTEGER NOT NULL,
    FOREIGN KEY (order_code) REFERENCES orders(code),
    product_id varchar NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(id)

);


-- 3 Exercise
--a
CREATE TABLE students(
    full_name VARCHAR PRIMARY KEY NOT NULL,
    birth_date varchar NOT NULL,
    age INTEGER NOT NULL CHECK ( age > 0 ),
    average_grade DOUBLE PRECISION NOT NULL,
    some_info TEXT NOT NULL,
    need_for_dormitory BOOLEAN NOT NULL ,
    additional_info text NOT NULL
);
--b
CREATE TABLE instructors(
    full_name VARCHAR PRIMARY KEY NOT NULL,
    speaking_lang varchar NOT NULL,
    work_exp INTEGER NOT NULL CHECK ( instructors.work_exp > 0 ),
    poss_of_remote_less BOOLEAN NOT NULL
);
--c
CREATE TABLE lesson_parts(
    lesson_title VARCHAR NOT NULL,
    teach_instructor varchar,
    FOREIGN KEY (teach_instructor) REFERENCES instructors(full_name),
    study_student varchar,
    FOREIGN KEY (study_student) references students(full_name),
    room_number INTEGER NOT NULL
);








--4 Exercise
INSERT INTO products (id, name, description, price)
    VALUES ('11B','John','FRAGILE',1500);
INSERT INTO products (id, name, description, price)
    VALUES ('12B','John','HARDMAN',2999);
UPDATE products SET name = 'Jenya' WHERE id = '11B';
DELETE FROM products WHERE name = 'John'

