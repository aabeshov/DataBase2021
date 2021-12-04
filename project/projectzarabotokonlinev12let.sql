--
--tables
create table customer(
    id serial primary key,
    name varchar(100) not null,
    surname varchar(100) not null,
    passportnumber varchar(9) not null,
    package_id integer,
    payment_id integer,
    FOREIGN key (package_id) references package(id),
    FOREIGN key (payment_id) references payment(id)

);
create table order1(
    id serial primary key,
    time_order date not null,
    time_delivery date,
    price numeric not null ,
    status_id integer,
    package_id integer,
    FOREIGN key (status_id) references status(id),
    FOREIGN key (package_id) references package(id)
);
create table driver(
    id serial primary key,
    name varchar(100) not null,
    surname varchar(100) not null,
    vehicle_id integer,
    foreign key (vehicle_id) references vehicle(id)

);
create table vehicle(
  id serial primary key,
  model varchar(100),
  is_crashed boolean not null
);
create table package(
    id serial primary key,
    weight numeric not null,
    is_hasardous boolean not null,
    is_international boolean not null,
    size varchar(1),
    interpack_id integer,
    foreign key (interpack_id) references interpack(id)

);
create table interpack(
    id serial primary key,
    declartional_number numeric,
    is_confirmed boolean not null

);
create table payment(
    id serial primary key,
    is_usual boolean not null,
    usual_id varchar,
    nonusual_id varchar,
    foreign key (usual_id) references payment_usual(id),
    foreign key (nonusual_id) references payment_nonusual(id)
);
create table payment_usual(
    id varchar(100) primary key,
    is_paid boolean not null,
    month_payment numeric not null
);
create table payment_nonusual(
    id varchar(100) primary key,
    creditcard numeric(16) not null,
    price numeric not null

);
create table status(
    id serial primary key,
    is_delivered boolean not null,
    is_taken boolean not null,
    place_id integer,
    foreign key (place_id) references place(id)
);
create table place(
    id serial primary key,
    longitude numeric not null,
    latitude numeric not null

);
create table order_details(
    customer_id integer references customer(id),
    order_id integer references order1(id),
    driver_id integer references driver(id)
);


--data
--vehicle
insert into vehicle(model, is_crashed) VALUES ('minivan',false);
insert into vehicle(model, is_crashed) VALUES ('maybach',false);
insert into vehicle(model, is_crashed) VALUES ('lada',true);
insert into vehicle(model, is_crashed) VALUES ('gruzovik',false);
insert into vehicle(model, is_crashed) VALUES ('telejka',true);
--driver
insert into driver(name, surname, vehicle_id) VALUES ('Stepan','Wumaxer',1);
insert into driver(name, surname, vehicle_id) VALUES ('Vova','Gonwik',2);
insert into driver(name, surname, vehicle_id) VALUES ('Alexander','Drift',3);
insert into driver(name, surname, vehicle_id) VALUES ('John','Malamut',4);
insert into driver(name, surname, vehicle_id) VALUES ('Jimmy','Roller',5);
--place
insert into place(longitude, latitude) VALUES (455,213);
insert into place(longitude, latitude) VALUES (415,523);
insert into place(longitude, latitude) VALUES (155,612);
insert into place(longitude, latitude) VALUES (58,333);
insert into place(longitude, latitude) VALUES (100,100); -- sklad
--status
insert into status(is_delivered, is_taken,place_id) values (false,true,1);
insert into status(is_delivered, is_taken,place_id) values (true,true,2);
insert into status(is_delivered, is_taken,place_id) values (false,false,5);
insert into status(is_delivered, is_taken,place_id) values (false,true,4);
insert into status(is_delivered, is_taken,place_id) values (false,false,5);
--interpack
insert into interpack(declartional_number, is_confirmed) values ('1111111',false);
insert into interpack(declartional_number, is_confirmed) values ('2222222',true);
insert into interpack(declartional_number, is_confirmed) values ('3333333',false);
insert into interpack(declartional_number, is_confirmed) values ('4444444',true);
insert into interpack(declartional_number, is_confirmed) values ('5555555',true);
--package
insert into package(weight, is_hasardous, is_international, size) values ('100',false,false,'L');
insert into package(weight, is_hasardous, is_international, size) values ('30',false,true,'M');
insert into package(weight, is_hasardous, is_international, size) values ('150',false,false,'L');
insert into package(weight, is_hasardous, is_international, size) values ('10',false,false,'S');
insert into package(weight, is_hasardous, is_international, size) values ('15',false,true,'S');
--payment_usual
insert into payment_nonusual(id,creditcard, price) values ('B201',4444555566661111,15000);
insert into payment_nonusual(id,creditcard, price) values ('B202',333511566221221,35000);
insert into payment_nonusual(id,creditcard, price) values ('B203',1313151516161111,10000);
--payment_nonusual
insert into payment_usual(id,is_paid, month_payment) values ('B204',true,22500);
insert into payment_usual(id,is_paid, month_payment) values ('B205',false,22500);
--payment
insert into payment(is_usual) values (false);
insert into payment(is_usual) values (false);
insert into payment(is_usual) values (false);
insert into payment(is_usual) values (true);
insert into payment(is_usual) values (true);
--order
insert into order1(time_order,price, status_id, package_id) values ('1999-01-03',15000,1,1);
insert into order1(time_order,price, status_id, package_id) values ('2010-02-04',35000,2,2);
insert into order1(time_order,price, status_id, package_id) values ('2015-03-05',10000,3,3);
insert into order1(time_order,price, status_id, package_id) values ('1945-04-06',15000,4,4);
insert into order1(time_order,price, status_id, package_id) values ('2021-05-08',15000,5,5);
--customer
insert into customer(name, surname, passportnumber, package_id, payment_id) values ('Alen','Abeshov','ABC123456',1,1);
insert into customer(name, surname, passportnumber, package_id, payment_id) values ('Rofl','Folr','ABE123456',2,2);
insert into customer(name, surname, passportnumber, package_id, payment_id) values ('Patrick','Beverly','ABG123456',3,3);
insert into customer(name, surname, passportnumber, package_id, payment_id) values ('Arkogon','Fidgi','ABJ123456',4,4);
insert into customer(name, surname, passportnumber, package_id, payment_id) values ('Geralt','FromRivia','ABA123456',5,5);
--order_details
insert into order_details(customer_id, order_id,driver_id) VALUES (1,1,1);
insert into order_details(customer_id, order_id,driver_id) VALUES (2,2,2);
insert into order_details(customer_id, order_id,driver_id) VALUES (3,3,3);
insert into order_details(customer_id, order_id,driver_id) VALUES (4,4,4);
insert into order_details(customer_id, order_id,driver_id) VALUES (5,5,5);



create or replace function linkinginternational()
    returns trigger
    language plpgsql
    as
$$
    begin
        update package
            set interpack_id = id
            where is_international = true;



        return new;
    end;
$$;
create trigger international before insert or update on package
    for each row execute procedure linkinginternational();


create or replace function check_usual()
    returns trigger
    language plpgsql
    as
$$
    begin
        update payment
            set nonusual_id = id
            where is_usual = false;
        update payment
            set usual_id = id
            where is_usual = true;





        return new;
    end;
$$;
create trigger usual_acc before insert or update on payment
    for each row execute procedure check_usual();

--1
--for example 3 instead of 1171
select customer.id,order1.id,driver.id,customer.name,driver.name  from customer,order1,driver,order_details
    where driver.vehicle_id = 3 and order_details.driver_id = driver.id and order_details.customer_id = customer.id and order_details.order_id = order1.id;
--2
create view total_order as
    select customer.id, name, count(order1.id) as Total from customer, order1, order_details
    where order_details.customer_id = customer.id and order_details.order_id = order1.id
    group by customer.id, name,price;

    select customer.id, name, total from
    total_order as customer, order1, order_details
    where total = (select max(total) from total_order) and order_details.customer_id = customer.id and order_details.order_id = order1.id
    group by customer.id, name, total
    limit 1;
;
--4
    create view max_sum as
    select customer.id, customer.name , customer.surname, sum(price) as s from customer, order1, order_details
    where order_details.customer_id = customer.id and order_details.order_id = order1.id
    group by customer.id, name
    order by s desc
    limit 1;
--5
--6

