/*1.retrieve all film wit their duration and their director names*/
select name as Film_name ,duration ,director_name
from film;

/*2.Retrieve Guests who attended Films for Day 3 or more*/
SELECT g.fname, g.lname
FROM guest g,
INNER JOIN shows s ON g.Id_invitation = s.Guest_Id_invitation
WHERE s.no_of_days >= 3;

/*3.find halls with a capacity greater than the average capacity of all halls*/ 
select hall_name ,capacity
 from halls
 where capacity>(
 select avg(capacity)
 from halls);

/*4.retrieve names of films shown in the hall with maximum capacity */ 
select distinct Film_Name 
 from shows
 where Halls_Hall_number=(
 select Hall_number
 from halls 
 where capacity =(
 select  max(capacity) 
 from halls
 ));
 
 /*5.find staff members earning more than the average salary of staff*/
select s.fname,s.lname,s.salary,m.role
from staff s,media m
where s.salary >(
select avg(salary)
from staff,media
where s.id=m.staff_id
);

/*6.find total number of filmes shown in each hall */
SELECT h.hall_name , count(distinct s.film_name)
FROM shows s , halls h
WHERE h.hall_number=s.Halls_Hall_number
group by h.hall_name;

/*7.Get Name of Guests Who Received Awards */
SELECT g.fname , g.lname , a.Award_name
FROM guest g ,recieve r , award a
WHERE g.Id_invitation=r.Guest_Id_invitation and r.Award_Award_id=a.Award_id ;

/*8.Retrieve award and their sponsors */
SELECT award_name, sponsor
FROM award;

/*9.Get the details of all competitions along with their classification */
SELECT classfication , Header , member1 , member2 , member3
FROM compitations ;

/*10.List all events with their start and end dates  */
SELECT Name as event_name , start_date ,end_date 
FROM eventss ;

/*11.Get a combined of all award names and copetition classifications  */
SELECT  Award_Name as title , 'award' as type
FROM award 
union
select classfication as title , 'competiton' as type
from compitations;

/*12.list all people (guests or staff) who have phone numbers , along with their jop
roles or salaries   */
SELECT  fname  as name , lname as surname , phone , job as detail
FROM guest
union
select  fname as name , lname as surname , phone , salary as detail
from staff;

/*13.All events and films has been shown in the whole festival */
SELECT  name  , 'film' as type
FROM film
union
select  name ,'event' as type
from eventss;

/*14.list all films being shown in each hall with the number of guests attending */
SELECT s.film_name,s.halls_hall_number,count(a.Guest_Id_invitation)   
FROM shows s
left join attend a on s.halls_hall_number=a.halls_hall_number
group by s.film_name,s.halls_hall_number;

/*15.find all films that have won awards sponsored by CIB*/
select name as film_name 
from film 
where name in(
select film_name 
from get 
where Award_Award_id in(
select award_id
from award
where sponsor='CIB'
));

/*16.find all films that does not won awards */
select f.name as film_name
from film f
left join get g on f.name=g.film_name 
where g.award_award_id is null
;

/*17.find all details of guests don not share in afilm */
select *
from guest g
left join share s on 
g.Id_invitation=s.Guest_Id_invitation
where s.Film_Name is null
;
/*18.retrieve all staff working on events start in 2024-10-26*/
select s.fname as first_name ,s.lname as surname 
from staff s ,work w,eventss e
where s.id=w.Staff_Id and w.Event_Name=e.name and e.start_date='2024-10-26';

/*19.retrieve the supervisor of the organizers working on the event "CLOSING Ceremony" 
and use ORDER BY and HAVING*/
SELECT O.Supervisor,s.id as staff_id,S.Fname ,S.Lname , e.Name 
,COUNT(w.Event_Name) as count_event
FROM Organizor O,staff s,work w,eventss e
WHERE O.Staff_Id = S.Id and S.Id = w.Staff_Id and w.Event_Name = e.Name
and e.Name = 'closing Ceremony'
GROUP BY O.Supervisor, S.Id, e.Name
HAVING COUNT(w.Event_Name)> 0
ORDER BY O.Supervisor ASC, w.event_name DESC;

/*20.retrieve all film that classified as'documentry'*/
select f.name as film_name
from film f,compitations c
where f.Compitations_number=c.number and c.classfication='documentry';

