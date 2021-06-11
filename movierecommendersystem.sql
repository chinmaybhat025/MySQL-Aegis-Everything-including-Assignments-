#create a database and set it as default
create database movie_recommender;
use movie_recommender;

/*this table will be loaded with the data from the file "data"; it stores the details of the ratings, 
ie the userid, the item id of the movie, the rating the 
user gave to the movie, and a timestamp*/
create table ratingsdata ( 
   userid int, 
   itemid int, 
   rating int, 
   timestamp int, 
   primary key (userid, itemid)); 
 
 /*this tablewill be loaded with data from the file 'item'; it will store the movie id, its name, details of when it was released, idmb url and
 will have 1 for the genre of the movie, and o in other fields; for eg: toy story is an animation movie and so it has 1 in animation and comedy 
 fields and 0 in all other fields
 */
create table items ( 
   itemid int primary key, 
   title text, 
   date text, 
   videodate text, 
   imdb text, 
   unknown boolean, 
   action boolean, 
   adventure boolean, 
   animation boolean, 
   childrens boolean, 
   comedy boolean, 
   crime boolean, 
   documentary boolean, 
   drama boolean, 
   fantasy boolean, 
   noir boolean, 
   horror boolean, 
   musical boolean, 
   mystery boolean, 
   romance boolean, 
   scifi boolean, 
   thriller boolean, 
   war boolean, 
   western boolean); 
 
/*this table contains the user details; it will be loaded with data from the file "user". it stores the user id, his/her name, age, gender
occupation and address zip code*/
create table users ( 
   userid int primary key, 
   age int, 
   gender char, 
   occupation text, 
   zip varchar(10)); 
   desc users;
   drop table users;
 
 /*after the above mentioned 3 tables are created, load them with data from the respective files, stored in the given location*/
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/u.data' into table ratingsdata;
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/u.item' into table items CHARACTER SET latin1 fields 
   terminated by '|'; 
load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/u.user' into table users CHARACTER SET latin1 fields terminated by '|';

/*view the content in all the 3 table for a better understanding of the data stored*/
SELECT * FROM ratingsdata;
SELECT * FROM items;


SELECT * FROM USERS;

/*next we will execute a few queries to get some insight into the data*/




/*this query is used to get the number of distinct users who have given one or more ratings, 
the number of distinct movies that have been 
rated and the total number of all the ratings that are available in the table*/
select count(distinct userid) as nbusers, 
count(distinct itemid) as nbitems, count(*) as nbratings 
from ratingsdata;


#distribution of the number of ratings by user (histogram rounded to a precision of 10 ratings)
/*how many users have rated these many movies?
the inner query calculates how many movies each user has rated, rounded to closest 10, ie 55 and 
above is rounded to 60 and 54 and below is rounded
to 50. this data is used to calculate the number of users who have rated a given number of movies, 
ie the data would be read as only 1 user has 
rated 740 movies, whereas there are 2 distinct users who have rated 490 movies
 */
select count(userid) as nbusers, nbratings 
from (select round(count(itemid)/10,0)*10 as nbratings, userid 
      from ratingsdata 
      group by userid 
     ) as nbratingsbyusers 
group by nbratings 
order by nbratings desc;


#distribution of the number of ratings by movies (histogram rounded to 10 ratings).
/*how many movies have been rated these many times.?
the inner query calculates how many times each movie was rated (the number of ratings), rounded to closest 10, ie 55 and above is rounded to 60 
and 54 and below is rounded to 50. this data is used to calculate the number of movies that were rated a given number of times, 
ie the data would be read as only 1 movie was rated 580 times, whereas there are 3 distinct movies were rated 510 times
 */
select count(itemid) as nbitems, nbratings 
from (select round(count(userid)/10,0)*10 as nbratings, itemid 
      from ratingsdata 
      group by itemid 
     ) as nbratingsbyitems 
group by nbratings 
order by nbratings desc;  


#average rating
/*this query calculates the average of all the ratings in the table*/
select avg(rating) as avgrating 
from ratingsdata;

#ratings distribution
/*this query returns the number of 5, 4, 3, 2 and 1 ratings in the table*/
select count(*) as nbratings, rating #how many 5 star ratings r there
from ratingsdata 
group by rating 
order by rating desc;


#distribution of the average ratings by users (histogram rounded to 0.1)
/*the inner query finds the average of all the ratings that a user has given, rounded to 1 decimal. 
this data is then used to determine, how many users have the same average rating, for a given avg rating 
calculated by the inner query
*/
select count(userid) as nbusers, avgrating 
from (select round(avg(rating),1) as avgrating, userid 
      from ratingsdata 
      group by userid 
     ) as avgratingbyusers 
group by avgrating 
order by avgrating desc;


#distribution of the average ratings by movies (histogram rounded to 0.1)
/*the inner query finds the average of all the ratings that a movie has received, rounded to 1 decimal. 
this data is then used to determine, how many movies have received the same average rating, for 
a given avg rating calculated by the inner query
*/
select count(itemid) as nbitems, avgrating 
from (select round(avg(rating),1) as avgrating, itemid 
      from ratingsdata 
      group by itemid 
     ) as avgratingbyitems 
group by avgrating 
order by avgrating desc;


 /*create a new table called ratings*/
create table ratings ( 
   userid int, 
   itemid int, 
   rating int, 
   timestamp int, 
   primary key (userid, itemid)); 
   
   
 /*the ratings table is similar to the ratingsdata table used above, except that the ratings 
 that a user has given for a movie is a scaled value.
 the scaling is done by subtracting the users's avg rating from the actual rating given by the user 
 for a movie
 this step of scaling is done to ensur that there are no biases involved in the avg rating of a movie.*/  
insert into ratings (userid,itemid,rating,timestamp) 
   (select ratingsdata.userid, ratingsdata.itemid, 
        ratingsdata.rating-avgratingbyusers.avgrating, 
        ratingsdata.timestamp 
    from ratingsdata, 
       (select userid, avg(rating) as avgrating
        from ratingsdata 
        group by userid 
       ) as avgratingbyusers 
    where ratingsdata.userid=avgratingbyusers.userid 
   );

#get the top 10 highest rated movies  
/*the inner query calculates the avg of all the ratings (scaled) that a movie has received and 
the number of ratings it has received
this is combined with the movie name, ordered by highest avg scaled rating and displayed*/
select title, avgrating, nbratings 
from items, 
   (select round(avg(rating),1) as avgrating, 
       count(userid) as nbratings, itemid 
    from ratings 
    group by itemid 
    order by avgrating desc 
    limit 10 
   ) as avgratingbyitems 
where items.itemid = avgratingbyitems.itemid 
order by avgrating desc;


#get the top 40 movies with the highest number of ratings, ie movies that have been rated by more users
/*the inner query calculates the avg of all the ratings(scaled) that a movie has received and the number of ratings it has received
this is combined with the movie name, ordered with highest number of ratings and displayed */
select title, items.itemid, avgrating, nbratings 
from items, 
   (select round(avg(rating),1) as avgrating, 
       count(userid) as nbratings, itemid 
    from ratings 
    group by itemid 
    order by nbratings desc 
    limit 40 
   ) as avgratingbyitems 
where items.itemid = avgratingbyitems.itemid 
order by nbratings desc;


use sakila;

select * from film where film_id between 0 and 100;


select * from film where length=(select max(length) from film);

select * from film where film_id=100;

select * from film;







create index idx_len on film(Length);
drop index idx_len on film;



