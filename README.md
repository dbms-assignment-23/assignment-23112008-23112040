# assignment-23112008-23112040

INTERCITY ASSIGNMENT
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DESIGNING THE DATABASE

1 - Trains are assumed to be sequence of coaches attached to an engine(the database doesn't include engine information), one coach is assumed to be the part of the same train always.
2 - Just like trains routes are assumed to to sequences of stations in a particular order(the ordering of the staiton matters). Example Goa-Mumbai is one route and Mumbai_Goa is a      different route with different route_id.
3 - We keep the data of customers and some customers are agents, so we make another table for agents which is the subset for customers table;
4 - One train can tavel on many routes and one many route could be travelled by many trains. A train that travels on a particular route also travels on its reverse route, .i.e if a train travels on Mumbai-Goa route it will also travel on Goa-Mumbai route. 
5 - A train that is scheduled to travel on a day will always travel both the original route and its opposite route, so at the end of the day it will come back to the station it started from.
6 - There are a total of 12 trains made of 60 coahes together, and the remaining 40 coaches are assumed to kepts at different stations(atleat one coach on each station) to be deployed in case of delays. The engines that these coaches will require when they are deployed are assumed to be present at the stations.
7 -  Coaches have a mileage attribute and a last maintence date attribute to track when the next maintence is scheduled.
8 - A ticket is for a train and the process is standardised .i.e if the ticket has a seat number 35 we know that this is seat is in the second coach(since each coach has 30 seating capacity). This eliminates the need for a seperate seat entity.
9 - Tickets table also has passenger_id which is the customer_id of the passenger, a booking_id the id of the customer who bookded a ticket(example a single man can book the ticket for his entire family) and an agent_id. If ticket is not booked by an agent agent_id is null.
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

11 - create table customers(customer_id varchar(10), name varchar(100) not null, age int not null, gender varchar(10), phone varchar(13), total_travels int, primary key(customer_id));

12 - creat table agents(agent_id varchar(10), primary key(agent_id), foreign key(agent_id) references customers(customer_id));

13 - create table scheduled_for(train_no int, route_id varchar(10), date date, departure_time time, driver_id varchar(10), co_driver_id varchar(10), primary key(train_no, route_id, date, 14 - departure_time), foreign key(train_no, route_id) references travels_on(train_no, route_id), foreign key(driver_id) refernces drivers(driver_id), foreign key(co_driver_id) references drivers(driver_id));

15 - create table arrives_on(train_no int, station_code varchar(10), date date, arrival_time time, departure_time time, actual_arrival_time time, actual_departure_time time, primary key(train_no, station_code, date, actual_departure_time), foreign key(train_no) references trains(train_no), foreign key(station_code) references stations(station_code));

16 - create table tickets(ticket_no varchar(20) primary key,train_no int,start varchar(20),end varchar(20),date date,departure_time time,seat_no int,passenger_id varchar(10),booking_id varchar(10),agent_id varchar(10),status varchar(20),route_id varchar(10),price int,foreign key (train_no) references trains(train_no),foreign key (start) references stations(station_code),foreign key (end) references stations(station_code),foreign key (passenger_id) references customers(customer_id),foreign key (booking_id) references customers(customer_id),foreign key (agent_id) references customers(customer_id),foreign key (route_id) references routes(route_id));

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
-- select d.*,r1.train_no,r1.route_id,r1.date,r1.departure_time,r1.co_driver_id from drivers d join (select * from scheduled_for where date='2023-10-10') r1 on r1.driver_id=d.driver_id;
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
-- select c.*,r1.total_trips from coaches c join (select c.coach_id,count(sf.train_no) as total_trips from coaches c join made_of mo join trains t join scheduled_for sf where c.coach_id=mo.coach_id and mo.train_no=t.train_no and t.train_no=sf.train_no group by coach_id) r1 on r1.coach_id=c.coach_id and c.mileage between 4000 and 4999;
+----------+---------+-----------------------+--------------------+-------------+
| coach_id | mileage | last_maintenance_date | total_maintenances | total_trips |
+----------+---------+-----------------------+--------------------+-------------+
| WX301    |    4800 | 2023-01-20            |                  3 |          60 |
| WX303    |    4500 | 2023-05-15            |                  2 |          30 |
| WX305    |    4900 | 2023-04-10            |                  1 |          30 |
| WX306    |    4800 | NULL                  |                  0 |          14 |
| WX310    |    4800 | 2023-03-05            |                  1 |          14 |
| WX312    |    4700 | 2023-01-18            |                  3 |          30 |
| WX314    |    4900 | 2023-05-10            |                  2 |          30 |
| WX318    |    4800 | 2023-03-15            |                  2 |          34 |
| WX322    |    4900 | 2023-01-30            |                  1 |          24 |
| WX323    |    4800 | 2023-02-28            |                  2 |          24 |
| WX328    |    4700 | 2023-04-15            |                  1 |          14 |
| WX329    |    4800 | NULL                  |                  0 |          14 |
| WX333    |    4800 | 2023-03-10            |                  2 |           8 |
| WX336    |    4800 | 2023-04-20            |                  2 |           8 |
| WX338    |    4900 | 2023-02-15            |                  3 |           8 |
| WX340    |    4800 | 2023-05-30            |                  2 |           8 |
| WX342    |    4500 | 2023-03-20            |                  1 |           8 |
| WX343    |    4800 | NULL                  |                  0 |           8 |
| WX345    |    4700 | 2023-04-28            |                  2 |          10 |
| WX349    |    4900 | 2023-05-18            |                  2 |          10 |
| WX351    |    4800 | 2023-04-02            |                  3 |          12 |
| WX354    |    4800 | 2023-03-25            |                  2 |          12 |
| WX359    |    4900 | 2023-04-05            |                  1 |          20 |
+----------+---------+-----------------------+--------------------+-------------+

3. List all agents, in descending order of percentage of confirmed booking each trip in the month of October this year. Include agent and route information in your result.
-- select a.agent_id,count(t.ticket_no) as total_confirmed_tickets from agents a join tickets t where t.agent_id = a.agent_id and t.agent_id is not null and t.status='confirmed' and month(t.date)=10 group by agent_id order by total_confirmed_tickets desc;
+----------+-------------------------+
| agent_id | total_confirmed_tickets |
+----------+-------------------------+
| C143     |                       7 |
| C118     |                       4 |
+----------+-------------------------+

4. Display the details of the routes where majority of bookings are not made by agents. 
-- select r.* from routes r join (select route_id,count(route_id) as ticket_count from tickets t where t.agent_id is null group by route_id order by ticket_count desc limit 1) r1 on r.route_id=r1.route_id;
+----------+------------+----------+
| route_id | name       | distance |
+----------+------------+----------+
| R010     | Mumbai-Goa |      588 |
+----------+------------+----------+

5. Display the details of the agents who have made maximum commission in the Month of September. 
-- select agent_id, total_earning from (select t.agent_id, sum(t.price) as total_earning from tickets t where t.agent_id is not null and month(t.date) = 9 group by agent_id) as agent_earnings where total_earning > (select avg(total_earning) from (select agent_id, sum(price) as total_earning from tickets where agent_id is not null and month(date) = 9 group by agent_id) as avg_earnings);
+----------+---------------+
| agent_id | total_earning |
+----------+---------------+
| C101     |          3900 |
+----------+---------------+

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
-- select train_no,count(ticket_no) total_tickets from tickets t where t.train_no in (select train_no from travels_on tt join (select route_id from routes r where r.name='Dharwad-Bengaluru') r1 on tt.route_id = r1.route_id) and month(t.date) = 10 and t.status!='cancelled' group by train_no order by total_tickets asc;
+----------+---------------+
| train_no | total_tickets |
+----------+---------------+
|      108 |             2 |
|      112 |             3 |
+----------+---------------+

3. List the details of most popular route of InterCity Express Trains.
--  select r.route_id,count(r.route_id) from routes r join tickets t where r.route_id=t.route_id group by r.route_id order by count(r.route_id) desc limit 1;
+----------+-------------------+
| route_id | count(r.route_id) |
+----------+-------------------+
| R010     |                20 |
+----------+-------------------+

4. Display the details of the passengers who are frequent travellers with InterCity Express Trains. [Frequent traveller can be defined as the one who has travelled at least three times, irrespective of the route]
-- select * from customers c where c.customer_id in (select passenger_id from tickets group by passenger_id having count(passenger_id) >= 3);
+-------------+------------------+-----+--------+------------+
| customer_id | name             | age | gender | phone      |
+-------------+------------------+-----+--------+------------+
| C101        | Sahil Sharma     |  20 | M      | 7890123456 |
| C111        | Siddharth Tiwari |  29 | M      | 5432109876 |
| C147        | Pramod Verma     |  36 | M      | 5432109876 |
+-------------+------------------+-----+--------+------------+

5. Display the details of trains which arrived late at their destination, more than once in this year; Include the driver and co-driver information in the output. 
-- select sf.train_no,sf.route_id,sf.date,sf.driver_id,sf.co_driver_id from scheduled_for sf join (select * from arrives_on ao where year(ao.date) = '2023' and ao.actual_arrival_time > ao.arrival_time) r1 on r1.train_no=sf.train_no and r1.date=sf.date and sf.departure_time!=r1.departure_time;
+----------+----------+------------+-----------+--------------+
| train_no | route_id | date       | driver_id | co_driver_id |
+----------+----------+------------+-----------+--------------+
|      101 | R010     | 2023-09-01 | D001      | D002         |
|      101 | R004     | 2023-09-02 | D001      | D002         |
|      101 | R004     | 2023-09-09 | D101      | D102         |
|      102 | R001     | 2023-09-08 | D112      | D113         |
|      102 | R001     | 2023-09-12 | D112      | D113         |
|      104 | R009     | 2023-10-10 | D003      | D015         |
|      104 | R009     | 2023-10-17 | D003      | D015         |
|      104 | R009     | 2023-10-24 | D003      | D015         |
+----------+----------+------------+-----------+--------------+

