# Pewlett-Hackard-Analysis
Using Postgress and pgAdmin
# Overview of the analysis
The main idea for this analysis is determine the number of retiring employees per title, and identify employees who are eligible to participate in a mentorship program.

Throught the use of  some tables of information in csv type,  this analysis was made. Exploring these tables in PgAdmin and creating queries in order to get the necessary columns which will determine the scope fot the requested info.
The idea is to know the way this Company will be affected in their different departments if we filter by title field for each employee, so we can have an idea that there could be many retired people due there are many people in the Company and all of them have a title name, on the other hand there would certain people who can be eligible if they accomplish with certain criteria age.

The idea in this analysis is also, filter data in order to know the people who is working in their latest title field, due many people have changed of title.

# Results:
1. Using DISTINCT ON is one of the most useful command in SQL  because it will filter our columns where we want to know non repited rows, so in this case as we wanted to know the employee that is working now, the data base provided a date to know which employees are active at this moment, this date can be weird but it was established as (9999-01-01), so all people who have the column "to_date" into that date means is an active worker.
2. Another result with a lot of meaning is to know the number of employees who are practically retired due their title, this value could define the situation of the Company if they dont have those workers. Previously, we need to know how many of these are no employees anymore, throught filtering the mentioned before, those who are active workers.
3. Other command tool with a hight relevance is the use of JOIN, wen we join our tables, we are making our analysis more explicit, so we can create new tables and discover value info. For example whe we join Employes table and Dept_emp table we create a bridge with Departments at the same time, let me explain: Dept_emp has one column with a PK so if we join Employees and Dept_name we wiil get the info for both tables, and as Departments has also a PK with the same name than Dept_emp, we can join this third table (Departments) with Employees and Dept_emp. There are differet ways to use join like: right, left, and inner join principally.
4. Another command used in this analysis where "WHERE", "GROPU BY", "ORDER BY", "AND", "IN", basically, there are some more, but for this analysis these we nornally used. These commands help us to make queries with specific data requested, so if we use WHERE for example we are saying that we need values where the condition is true, and we can create many condiction usind AND, or OR, etc. At the same time it is important to order our query results, we have GROUP BY which order the info for each group of different rows, and ORDER BY will order our info in DESC or ASC order, this makes an easy understanding for people.

# SUMMARY

* How many roles will need to be filled as the "silver tsunami" begins to make an impact?
According with the query, there are about 72,000 people that is candidate to retire in the Company, because they are people who have the to_date = '9999-01-01',so, those means that they are active in the Company. The ones that remain in the Company are about : 134,000, when we filter them saying that those who have theto_date = '9999-01-01' are about almost the same number of those who are not in the Company.

The query which says there the amount of people is in the Company  is:

`SELECT` count (title) AS count

`FROM` unique_titles; --> 72,458

* Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees?
I consider there are, or also about the queries is says that there are many people who is working in the different titles areas, for example the total amount of active people is about 73,000 , from those just 1549 will be in the mentor ship program. So Icould say there are enought people to mentor the new generation of Pewlett Hackard.

The next query tells the amount of people consider for mentoring: resulting in 1549.

`SELECT` count (title) AS count

`FROM` unique_titles;
