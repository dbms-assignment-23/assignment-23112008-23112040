# assignment-23112008-23112040

INTERCITY ASSIGNMENT
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DESIGNING THE DATABASE

1 - Trains are assumed to be sequence of coaches attached to an engine(the database doesn't include engine information), one coach is assumed to be the part of the same train always.
2 - Just like trains routes are assumed to to sequences of stations in a particular order(the ordering of the staiton matters). Example Goa-Mumbai is one route and Mumbai_Goa is a different route with different route_id.
3 - We keep the data of customers and some customers are agents, so we made another table for agents which is the subset for customers table;
4 - One train can tavel on many routes and one route could be travelled by many trains. A train that travels on a particular route also travels on its reverse route, .i.e if a train travels on Mumbai-Goa route it will also travel on Goa-Mumbai route. 
5 - A train that is scheduled to travel on a day will always travel both the original route and its opposite route, so at the end of the day it will come back to the station it started from.
6 - There are a total of 12 trains made of 60 coahes together, and the remaining 40 coaches are assumed to kepts at different stations(atleat one coach on each station) to be deployed in case of delays. The engines that these coaches will require when they are deployed are assumed to be present at the stations.
7 -  Coaches have a mileage attribute and a last maintence date attribute to track when the next maintence is scheduled.
8 - A ticket is for a train and the process is standardised .i.e if the ticket has a seat number 35 we know that this is seat is in the second coach(since each coach has 30 seating capacity). This eliminates the need for a seperate seat entity.
9 - Tickets table also has passenger_id which is the customer_id of the passenger. If ticket is not booked by an agent agent_id will be null.
10 - Finally, some part of the sample data is assumed to be given to us by some other process and systems. For example the arrival time of a train on a praticular station is asuumed to be known, we are only concerned with the actual arrival and departure time.

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DATABASE CREATE AND INSERT STATEMENTS.

1 - create database intercity;

2 - use intercity;

3 - create table trains(train_no int primary key, name varchar(100) not null);

4 - create table coaches(coach_id varchar(20) primary key, mileage int, last_maintenance_date date, total_maintenances int);

5 - create table routes(route_id varchar(20) primary key, name varchar(100) not null, distance int);

6 - create table stations(station_code varchar(10) primary key, name varchar(50) not null);

7 - create table drivers(driver_id varchar(10) primary key, name varchar(100) not null, age int, city varchar(10) not null, gender varchar(10), phone varchar(13));

8 - create table made_of(train_no int, coach_id varchar(20), position int, primary key(train_no, coach_id, position), foreign key(train_no) references trains(train_no), foreign key(coach_id) references coaches(coach_id));

9 - create table consists_of(route_id varchar(20), station_code varchar(10), position int, primary key(route_id, station_code), foreign key(route_id) references routes(route_id), foreign key(station_code) references stations(station_code));

10 - create table travels_on(train_no int, route_id varchar(10), primary key(train_no, route_id), foreign key(train_no) references trains(train_no), foreign key(route_id) references routes(route_id));

11 - create table customers(customer_id varchar(10), name varchar(100) not null, age int not null, gender varchar(10), phone varchar(13), primary key(customer_id));

12 - create table agents(agent_id varchar(10) primary key,name varchar(100),age int,gender varchar(10),phone bigint);

13 - create table scheduled_for(train_no int, route_id varchar(10), date date, departure_time time, driver_id varchar(10), co_driver_id varchar(10),arrival_time time, primary key(train_no, route_id, date, 14 - departure_time), foreign key(train_no, route_id) references travels_on(train_no, route_id), foreign key(driver_id) refernces drivers(driver_id), foreign key(co_driver_id) references drivers(driver_id));

15 - create table arrives_on(train_no int, station_code varchar(10), date date, arrival_time time, departure_time time, actual_arrival_time time, actual_departure_time time, primary key(train_no, station_code, date, actual_departure_time), foreign key(train_no) references trains(train_no), foreign key(station_code) references stations(station_code));

16 - create table tickets(ticket_no varchar(20) primary key,train_no int,start varchar(20),end varchar(20),date date,departure_time time,seat_no int,passenger_id varchar(10),agent_id varchar(10),status varchar(20),route_id varchar(10),price int,foreign key (train_no) references trains(train_no),foreign key (start) references stations(station_code),foreign key (end) references stations(station_code),foreign key (passenger_id) references customers(customer_id),foreign key (route_id) references routes(route_id));

17 - load data local infile 'D:/Downloads/intercity_sample_data/trains.csv' into table trains fields terminated by ',' lines terminated by '\r\n' ignore 1 lines;

18 - load data local infile 'D:/Downloads/intercity_sample_data/routes.csv' into table routes fields terminated by ',' lines terminated by '\r\n' ignore 1 lines;

19 - load data local infile 'D:/Downloads/intercity_sample_data/coaches.csv' into table coaches fields terminated by ',' lines terminated by '\r\n' ignore 1 lines;

20 - load data local infile 'D:/Downloads/intercity_sample_data/drivers.csv' into table drivers fields terminated by ',' lines terminated by '\r\n' ignore 1 lines;

21 - load data local infile 'D:/Downloads/intercity_sample_data/stations.csv' into table stations fields terminated by ',' lines terminated by '\r\n' ignore 1 lines;

22 - load data local infile 'D:/Downloads/intercity_sample_data/travels_on.csv' into table travels_on fields terminated by ',' lines terminated by '\r\n' ignore 1 lines;

23 - load data local infile 'D:/Downloads/intercity_sample_data/scheduled_for.csv' into table scheduled_for fields terminated by ',' lines terminated by '\r\n' ignore 1 lines;

24 - load data local infile 'D:/Downloads/intercity_sample_data/made_of.csv' into table made_of fields terminated by ',' lines terminated by '\r\n' ignore 1 lines;

25 - load data local infile 'D:/Downloads/intercity_sample_data/customers.csv' into table customers fields terminated by ',' lines terminated by '\r\n' ignore 1 lines;

26 - load data local infile 'D:/Downloads/intercity_sample_data/consists_of.csv' into table consists_of fields terminated by ',' lines terminated by '\r\n' ignore 1 lines;

27 - load data local infile 'D:/Downloads/intercity_sample_data/arrives_on.csv' into table ariives_on fields terminated by ',' lines terminated by '\r\n' ignore 1 lines;

28 - load data local infile 'D:/Downloads/intercity_sample_data/agents.csv' into table agents fields terminated by ',' lines terminated by '\r\n' ignore 1 lines;

29 - load data local infile 'D:/Downloads/intercity_sample_data/tickets.csv' into table tickets fields terminated by ',' lines terminated by '\r\n' ignore 1 lines;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

ASHWIN TIRPUDE 23112040 QUERIES 
SET B
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

1. Show schedule of all trips including main driver information for 10th October this year.

Query : 
select * from drivers d natural join (select * from scheduled_for where date='2023-10-10') r1;

Output : 
+-----------+----------------+-----+------------+--------+------------+----------+----------+------------+----------------+--------------+
| driver_id | name           | age | city       | gender | phone      | train_no | route_id | date       | departure_time | co_driver_id |
+-----------+----------------+-----+------------+--------+------------+----------+----------+------------+----------------+--------------+
| D019      | Meena Singh    |  35 | Nagpur     | F      | 7654321098 |      101 | R005     | 2023-10-10 | 08:00:00       | D018         |
| D007      | Neha Gupta     |  30 | Kolkata    | F      | 6456789012 |      101 | R015     | 2023-10-10 | 16:00:00       | D006         |
| D012      | Vijay Shah     |  45 | Patna      | M      | 8901234567 |      102 | R001     | 2023-10-10 | 10:00:00       | D012         |
| D013      | Shalini Kapoor |  38 | Kochi      | F      | 9012345678 |      102 | R011     | 2023-10-10 | 17:00:00       | D012         |
| D047      | Kavita Yadav   |  36 | Varanasi   | F      | 3456789012 |      103 | R010     | 2023-10-10 | 08:00:00       | D048         |
| D048      | Alok Tiwari    |  42 | Nagpur     | M      | 4567890123 |      103 | R020     | 2023-10-10 | 16:00:00       | D047         |
| D003      | Deepika Patel  |  28 | Mumbai     | F      | 8765432109 |      104 | R009     | 2023-10-10 | 10:00:00       | D015         |
| D003      | Deepika Patel  |  28 | Mumbai     | F      | 8765432109 |      104 | R019     | 2023-10-10 | 15:00:00       | D015         |
| D005      | Priya Sharma   |  32 | Chennai    | F      | 8234567891 |      105 | R006     | 2023-10-10 | 05:00:00       | D004         |
| D016      | Alok Tiwari    |  36 | Surat      | M      | 8765432109 |      105 | R016     | 2023-10-10 | 15:00:00       | D017         |
| D011      | Anita Yadav    |  32 | Chandigarh | F      | 7890123456 |      106 | R002     | 2023-10-10 | 08:00:00       | D010         |
| D023      | Anita Yadav    |  37 | Bengaluru  | F      | 3210987654 |      106 | R012     | 2023-10-10 | 17:00:00       | D022         |
| D031      | Anita Yadav    |  39 | Delhi      | F      | 7890123456 |      110 | R007     | 2023-10-10 | 04:00:00       | D032         |
| D028      | Sanjay Verma   |  30 | Jaipur     | M      | 4567890123 |      110 | R017     | 2023-10-10 | 17:00:00       | D027         |
+-----------+----------------+-----+------------+--------+------------+----------+----------+------------+----------------+--------------+


2. List all coaches with mileage between 4000 and 4999 km covered for September this year; include information on the coach, its last service date and total number of scheduled trips. 

Query :
select c.*,sum(r.distance) as distance,count(r1.train_no) as trips from coaches c join made_of m join routes r join (select train_no,route_id from scheduled_for where date < '2023-09-30') r1 where c.coach_id = m.coach_id and m.train_no = r1.train_no and r1.route_id = r.route_id group by c.coach_id having distance between 4000 and 4999;

Output : 
+----------+---------+-----------------------+--------------------+----------+-------+
| coach_id | mileage | last_maintenance_date | total_maintenances | distance | trips |
+----------+---------+-----------------------+--------------------+----------+-------+
| WX340    |    4800 | 2023-05-30            |                  2 |     4704 |     8 |
| WX341    |    5100 | NULL                  |                  0 |     4704 |     8 |
| WX342    |    4500 | 2023-03-20            |                  1 |     4704 |     8 |
| WX343    |    4800 | NULL                  |                  0 |     4704 |     8 |
| WX326    |    5200 | NULL                  |                  0 |     4944 |    12 |
| WX327    |    5000 | 2023-05-02            |                  2 |     4944 |    12 |
| WX328    |    4700 | 2023-04-15            |                  1 |     4944 |    12 |
| WX329    |    4800 | NULL                  |                  0 |     4944 |    12 |
| WX330    |    5100 | 2023-06-10            |                  3 |     4944 |    12 |
+----------+---------+-----------------------+--------------------+----------+-------+


3. List all agents, in descending order of percentage of confirmed booking each trip in the month of October this year. Include agent and route information in your result.

Query :
select a.*,r.*,r4.perc_of_cnf_tickets_sold from agents a join routes r join (select r3.agent_id,r3.route_id,((r3.confirmed_tickets_sold/r3.total_tickets_sold)*100) as perc_of_cnf_tickets_sold from (select * from (select a.agent_id,r.route_id,count(tk.ticket_no) as confirmed_tickets_sold from agents a join tickets tk on a.agent_id=tk.agent_id join travels_on tv on tk.train_no=tv.train_no join routes r on tv.route_id=r.route_id and tk.status='confirmed' and month(tk.date)=10 and year(tk.date)=2023 group by a.agent_id, r.route_id) r1 natural join (select r.route_id,count(tk.ticket_no) as total_tickets_sold from routes r join travels_on tv on r.route_id=tv.route_id join tickets tk on tv.train_no=tk.train_no join agents a on tk.agent_id=a.agent_id and tk.status='confirmed' and month(tk.date)=10 and year(tk.date)=2023 group by r.route_id) r2) r3 ) r4 where r4.agent_id=a.agent_id and r4.route_id=r.route_id order by r4.perc_of_cnf_tickets_sold desc;

Output : 
+----------+--------------+------+--------+------------+----------+----------------------------+----------+--------------------------+
| agent_id | name         | age  | gender | phone      | route_id | name                       | distance | perc_of_cnf_tickets_sold |
+----------+--------------+------+--------+------------+----------+----------------------------+----------+--------------------------+
| a_143    | Pranay Verma |   33 | Male   | 9876543210 | R007     | Lonavala-Ajmer             |     1062 |                 100.0000 |
| a_143    | Pranay Verma |   33 | Male   | 9876543210 | R017     | Ajmer-Lonavala             |     1062 |                 100.0000 |
| a_118    | Poonam Yadav |   27 | Female | 7654321098 | R008     | Dharwad-Bengaluru          |      432 |                 100.0000 |
| a_118    | Poonam Yadav |   27 | Female | 7654321098 | R018     | Bengaluru-Dharwad          |      432 |                 100.0000 |
| a_118    | Poonam Yadav |   27 | Female | 7654321098 | R004     | Mumbai-Sainagar Shirdi     |      248 |                 100.0000 |
| a_118    | Poonam Yadav |   27 | Female | 7654321098 | R014     | Sainagar Shirdi-Mumbai     |      248 |                 100.0000 |
| a_143    | Pranay Verma |   33 | Male   | 9876543210 | R001     | Mumbai Central-Gandhinagar |      548 |                  75.0000 |
| a_143    | Pranay Verma |   33 | Male   | 9876543210 | R011     | Gandhinagar-Mumbai Central |      548 |                  75.0000 |
| a_118    | Poonam Yadav |   27 | Female | 7654321098 | R003     | Secunderabad-Visakhapatnam |      500 |                  66.6667 |
| a_118    | Poonam Yadav |   27 | Female | 7654321098 | R013     | Visakhapatnam-Secunderabad |      500 |                  66.6667 |
| a_143    | Pranay Verma |   33 | Male   | 9876543210 | R010     | Mumbai-Goa                 |      588 |                  50.0000 |
| a_143    | Pranay Verma |   33 | Male   | 9876543210 | R020     | Goa-Mumbai                 |      588 |                  50.0000 |
| a_118    | Poonam Yadav |   27 | Female | 7654321098 | R010     | Mumbai-Goa                 |      588 |                  50.0000 |
| a_118    | Poonam Yadav |   27 | Female | 7654321098 | R020     | Goa-Mumbai                 |      588 |                  50.0000 |
| a_143    | Pranay Verma |   33 | Male   | 9876543210 | R003     | Secunderabad-Visakhapatnam |      500 |                  33.3333 |
| a_143    | Pranay Verma |   33 | Male   | 9876543210 | R013     | Visakhapatnam-Secunderabad |      500 |                  33.3333 |
| a_118    | Poonam Yadav |   27 | Female | 7654321098 | R001     | Mumbai Central-Gandhinagar |      548 |                  25.0000 |
| a_118    | Poonam Yadav |   27 | Female | 7654321098 | R011     | Gandhinagar-Mumbai Central |      548 |                  25.0000 |
+----------+--------------+------+--------+------------+----------+----------------------------+----------+--------------------------+


4. Display the details of the routes where majority of bookings are not made by agents. 

Query :
select r.* from routes r natural join ((select r.route_id,count(tk.ticket_no) as bookings_by_customers from tickets tk join travels_on tv on tk.train_no=tv.train_no join routes r on tv.route_id=r.route_id and tk.agent_id is null group by r.route_id) r1 natural join (select r.route_id,count(tk.ticket_no) as total_bookings from tickets tk join travels_on tv on tk.train_no=tv.train_no join routes r on tv.route_id=r.route_id group by r.route_id) r2) where (r1.bookings_by_customers > ((r2.total_bookings*50)/100) );

Output : 
+----------+------------------------+----------+
| route_id | name                   | distance |
+----------+------------------------+----------+
| R004     | Mumbai-Sainagar Shirdi |      248 |
| R005     | Mumbai-Solapur         |      400 |
| R010     | Mumbai-Goa             |      588 |
| R014     | Sainagar Shirdi-Mumbai |      248 |
| R015     | Solapur-Mumbai         |      400 |
| R020     | Goa-Mumbai             |      588 |
+----------+------------------------+----------+


5. Display the details of the agents who have made maximum commission in the Month of September. 

Query:
select a.* from agents a natural join (select t.agent_id, sum(t.price) as total_earning from tickets t where t.agent_id is not null and month(t.date) = 9 group by agent_id) as agent_earnings where total_earning > (select avg(total_earning) from (select agent_id, sum(price) as total_earning from tickets where agent_id is not null and month(date) = 9 group by agent_id) as avg_earnings);

Output:
+----------+--------------+------+--------+------------+
| agent_id | name         | age  | gender | phone      |
+----------+--------------+------+--------+------------+
| a_101    | Sahil Sharma |   20 | Male   | 7890123456 |
+----------+--------------+------+--------+------------+


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

SHREYASH GADUTE 23112008 QUERIES
SET C
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



1. List all trains not scheduled on 10th October this year.
-- select * from trains t where t.train_no not in (select distinct train_no from scheduled_for sf where sf.date='2023-10-10');
+----------+-----------------------------+
| train_no | name                        |
+----------+-----------------------------+
|      107 | Goa-Mumbai Superfast        |
|      108 | Lonavala-Ajmer Express      |
|      109 | Bengaluru-Dharwad Fast      |
|      111 | Goa-Mumbai Express          |
|      112 | Mumbai-Indore Superfast     |
+----------+-----------------------------+

2. List all fleets from Dharwad to Bengaluru, in ascending order of their monthly seats sold for the month of October this year.
-- select train_no, count(ticket_no) total_tickets from tickets t where t.status!='Cancelled' and train_no in (select train_no from travels_on where route_id = (select route_id from routes where name = 'Bengaluru-Dharwad')) group by train_no order by total_tickets;
+----------+---------------+
| train_no | total_tickets |
+----------+---------------+
|      108 |             2 |
|      112 |             2 |
+----------+---------------+

3. List the details of most popular route of InterCity Express Trains.
--select ssq.route_id, ssq.total_travels, routes.name from (select route_id, count(route_id) total_travels from (select tickets.train_no, scheduled_for.route_id from tickets inner join scheduled_for on scheduled_for.train_no = tickets.train_no and tickets.departure_time >= scheduled_for.departure_time and tickets.date = scheduled_for.date and tickets.departure_time < scheduled_for.arrival_time) sq group by route_id order by total_travels desc limit 0,1) ssq inner join routes on routes.route_id = ssq.route_id;
+----------+---------------+------------+
| route_id | total_travels | name       |
+----------+---------------+------------+
| R010     |            16 | Mumbai-Goa |
+----------+---------------+------------+

4. Display the details of the passengers who are frequent travellers with InterCity Express Trains. [Frequent traveller can be defined as the one who has travelled at least three times, irrespective of the route]
-- select * from customers c where c.customer_id in (select passenger_id from tickets group by passenger_id having count(passenger_id) >= 3);
+-------------+------------------+-----+--------+------------+
| customer_id | name             | age | gender | phone      |
+-------------+------------------+-----+--------+------------+
| C101        | Sahil Sharma     |  20 | Male   | 7890123456 |
| C111        | Siddharth Tiwari |  29 | Male   | 5432109876 |
+-------------+------------------+-----+--------+------------+

5.Display the details of trains which arrived late at their destination, more than once in this year; Include the driver and co-driver information in the output. 
--select sq.train_no, sq.date, sf.driver_id, sf.co_driver_id from (select train_no, arrival_time, date from arrives_on where train_no in (select train_no from arrives_on where actual_arrival_time > arrival_time group by train_no having count(train_no) > 1)) sq inner join scheduled_for sf on sq.train_no=sf.train_no and sq.date = sf.date and sq.arrival_time >= sf.departure_time;
+----------+------------+-----------+--------------+
| train_no | date       | driver_id | co_driver_id |
+----------+------------+-----------+--------------+
|      101 | 2023-09-01 | d001      | d002         |
|      101 | 2023-09-02 | d001      | d002         |
|      101 | 2023-09-09 | d101      | d102         |
|      102 | 2023-09-08 | d112      | d113         |
|      102 | 2023-09-12 | d112      | d113         |
|      104 | 2023-10-10 | d003      | d015         |
|      104 | 2023-10-17 | d003      | d015         |
|      104 | 2023-10-24 | d003      | d015         |
+----------+------------+-----------+--------------+

