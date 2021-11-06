--1
--a
SELECT * FROM dealer inner join client on dealer.id = client.dealer_id;
--b
SELECT dealer.name,client.name,city,sell.id,date,amount FROM dealer INNER JOIN client ON client.dealer_id=dealer.id INNER JOIN sell ON client.id = sell.client_id;
--c
SELECT * from dealer inner join client on dealer.id = client.dealer_id where dealer.location = client.city;
--d
select sell.id,sell.amount,client.name,client.city from client inner join sell on client.id = sell.client_id and amount between 100 and 500;
--e
SELECT * from dealer left join client on dealer.id = client.dealer_id;
--f
select client.name,client.city, dealer.name , dealer.charge from dealer inner join client on dealer.id = client.dealer_id;
--g
select client.name,client.city, dealer.name , dealer.charge from dealer inner join client on dealer.id = client.dealer_id where dealer.charge > 0.12;
--h
select client.name,client.city,sell.id ,sell.date,sell.amount, dealer.name , dealer.charge from dealer inner join client on dealer.id = client.dealer_id inner join sell on client.id = sell.client_id;
--i
select client.name,dealer.name, sell.id ,sell.amount from dealer inner join client on dealer.id = client.dealer_id inner join sell on client.id = sell.client_id where amount > 2000;

--2
--a
CREATE VIEW a_unique(number) AS
    SELECT COUNT(DISTINCT client.id)
    FROM client;
CREATE VIEW a_purchases(date,average_amount,total_amount) AS
    SELECT date,AVG(amount),SUM(amount)
    FROM sell
    GROUP BY date
    ORDER BY date;
--b)
CREATE VIEW b AS
    SELECT *
    FROM (SELECT * FROM a_purchases ORDER BY total_amount DESC ) as s
    LIMIT 5;
--c)
CREATE VIEW c(dealer_name,number_of_sales,average_amount,total_amount) AS
    SELECT dealer.name,COUNT(sell.id),AVG(amount),SUM(amount)
    FROM dealer
        INNER JOIN sell ON dealer.id=sell.dealer_id
    GROUP BY dealer.id;
--d)
CREATE VIEW d(location,dealers_earn) AS
    SELECT location,SUM(charge*amount)
    FROM dealer
        INNER JOIN sell ON dealer.id=sell.dealer_id
    GROUP BY location;
--e)
CREATE VIEW e(location,sal_number_of_sales,sal_average_amount,sal_total_amount) AS
    SELECT location,COUNT(sell.id),AVG(amount),SUM(amount)
    FROM dealer
        INNER JOIN sell ON dealer.id=sell.dealer_id
    GROUP BY location;
--f)
CREATE VIEW f(city,exp_number_of_sales,exp_average_amount,exp_total_amount) AS
    SELECT city,COUNT(sell.id),AVG(amount),SUM(amount)
    FROM client
        INNER JOIN sell ON client.id=sell.client_id
    GROUP BY city;
--g)
CREATE VIEW g AS
    SELECT *
    FROM e
        INNER JOIN f on e.location = f.city
    WHERE f.exp_total_amount>e.sal_total_amount;