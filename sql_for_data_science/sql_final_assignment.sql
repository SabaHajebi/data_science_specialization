Data Scientist Role Play: Profiling and Analyzing the Yelp Dataset Coursera Worksheet

This is a 2-part assignment. In the first part, you are asked a series of questions that will help you profile and understand the data just like a data scientist would. For this first part of the assignment, you will be assessed both on the correctness of your findings, as well as the code you used to arrive at your answer. You will be graded on how easy your code is to read, so remember to use proper formatting and comments where necessary.

In the second part of the assignment, you are asked to come up with your own inferences and analysis of the data for a particular research question you want to answer. You will be required to prepare the dataset for the analysis you choose to do. As with the first part, you will be graded, in part, on how easy your code is to read, so use proper formatting and comments to illustrate and communicate your intent as required.

For both parts of this assignment, use this "worksheet." It provides all the questions you are being asked, and your job will be to transfer your answers and SQL coding where indicated into this worksheet so that your peers can review your work. You should be able to use any Text Editor (Windows Notepad, Apple TextEdit, Notepad ++, Sublime Text, etc.) to copy and paste your answers. If you are going to use Word or some other page layout application, just be careful to make sure your answers and code are lined appropriately.
In this case, you may want to save as a PDF to ensure your formatting remains intact for you reviewer.



Part 1: Yelp Dataset Profiling and Understanding

1. Profile the data by finding the total number of records for each of the tables below:
	
i. 	    Attribute table = 10000
ii. 	Business table = 10000
iii. 	Category table = 10000
iv. 	Checkin table = 10000
v. 	    elite_years table = 10000
vi. 	friend table =  10000
vii. 	hours table =  10000
viii. 	photo table = 10000
ix. 	review table = 10000
x. 	    tip table =  10000
xi. 	user table =  10000
	  	


2. Find the total distinct records by either the foreign key or primary key for each table. If two foreign keys are listed in the table, please specify which foreign key.

1.	Business = 10,000
2.	Hours = 1562
3.	Category = 2643
4.	Attribute = 1115
5.	Review = 10,000
6.	Checkin = 493
7.	Photo = 10,000
8.	Tip = 537
9.	User = 10,000
10.	Friend = 11
11.	Elite_years = 2780

      SELECT COUNT (distinct id ) from business
	  SELECT COUNT (distinct business_id ) from hours
	  SELECT COUNT (distinct business_id ) from Category
	  SELECT COUNT (distinct business_id ) from Attribute
	  SELECT COUNT (distinct id), 
	         COUNT(distinct business_id), 
			 COUNT(distinct user_id) from review
	  SELECT COUNT (distinct business_id ) from Checkin
	  SELECT COUNT (distinct id ), 
	         COUNT(distinct business_id ) from photo
	  SELECT COUNT (distinct business_id ),
	         COUNT ( distinct user_id) from tip
	  SELECT COUNT (distinct id ) from User
	  SELECT COUNT (distinct user_id ) from Friend
	  SELECT COUNT (distinct user_id ) from Elite_yers


Note: Primary Keys are denoted in the ER-Diagram with a yellow key icon.	



3. Are there any columns with null values in the Users table? Indicate "yes," or "no."

	Answer: No
	
	SQL code used to arrive at answer:
	
	SELECT COUNT(* ) from User
	where id is NULL OR
		  name is NULL OR
		  review_count IS NULL OR
		  yelping_since IS NULL OR
		  useful IS NULL OR 
		  funny IS NULL OR 
		  cool IS NULL OR 
		  fans IS NULL OR 
		  average_stars IS NULL OR 
		  compliment_hot IS NULL OR 
		  compliment_more IS NULL OR 
		  compliment_profile IS NULL OR 
		  compliment_cute IS NULL OR 
		  compliment_list IS NULL OR 
		  compliment_note IS NULL OR 
		  compliment_plain IS NULL OR 
		  compliment_cool IS NULL OR 
		  compliment_funny IS NULL OR 
		  compliment_writer IS NULL OR 
		  compliment_photos IS NULL
	
	

	
4. For each table and column listed below, display the smallest (minimum), largest (maximum), and average (mean) value for the following fields:

	ii. Table: Business, Column: Stars
	
		min:1.0		max: 5.0		avg: 3.6549
		
	
	iii. Table: Tip, Column: Likes
	
		min:0		max:2		avg:0.0144
		
	
	iv. Table: Checkin, Column: Count
	
		min:1		max:53		avg:1.9414
		
	
	v. Table: User, Column: Review_count
	
		min:0		max:2000 	avg:24.2995 
		
		


5. List the cities with the most reviews in descending order:

	SQL code used to arrive at answer:
	SELECT city, 
	       COUNT(review_count) as reviews
    FROM business
    GROUP BY city
    ORDER BY reviews DESC
	
	
	Copy and Paste the Result Below:
+-----------------+---------+
| city            | reviews |
+-----------------+---------+
| Las Vegas       |    1561 |
| Phoenix         |    1001 |
| Toronto         |     985 |
| Scottsdale      |     497 |
| Charlotte       |     468 |
| Pittsburgh      |     353 |
| Montréal        |     337 |
| Mesa            |     304 |
| Henderson       |     274 |
| Tempe           |     261 |
| Edinburgh       |     239 |
| Chandler        |     232 |
| Cleveland       |     189 |
| Gilbert         |     188 |
| Glendale        |     188 |
| Madison         |     176 |
| Mississauga     |     150 |
| Stuttgart       |     141 |
| Peoria          |     105 |
| Markham         |      80 |
| Champaign       |      71 |
| North Las Vegas |      70 |
| North York      |      64 |
| Surprise        |      60 |
| Richmond Hill   |      54 |
+-----------------+---------+
	

	
6. Find the distribution of star ratings to the business in the following cities:

i. Avon

SQL code used to arrive at answer:

SELECT stars, 
       review_count as count
FROM business
WHERE city = 'Avon'
Group by stars


Copy and Paste the Resulting Table Below (2 columns â€“ star rating and count):
+-------+-------+
| stars | count |
+-------+-------+
|   1.5 |    10 |
|   2.5 |     3 |
|   3.5 |    50 |
|   4.0 |    17 |
|   4.5 |    31 |
|   5.0 |     3 |
+-------+-------+


ii. Beachwood

SQL code used to arrive at answer:
SELECT stars, 
	   review_count as count
FROM business
WHERE city = 'Beachwood'
Group by stars


Copy and Paste the Resulting Table Below (2 columns â€“ star rating and count):
+-------+-------+
| stars | count |
+-------+-------+
|   2.0 |     8 |
|   2.5 |     3 |
|   3.0 |     3 |
|   3.5 |     3 |
|   4.0 |    69 |
|   4.5 |     3 |
|   5.0 |     4 |
+-------+-------+		



7. Find the top 3 users based on their total number of reviews:
		
	SQL code used to arrive at answer:
	SELECT
        name,
        id,
        review_count
    FROM user
        ORDER BY review_count DESC
        LIMIT 3;
		
	
		
	Copy and Paste the Result Below:
+--------+------------------------+--------------+
| name   | id                     | review_count |
+--------+------------------------+--------------+
| Gerald | -G7Zkl1wIWBBmD0KRy_sCw |         2000 |
| Sara   | -3s52C4zL_DHRK0ULG6qtg |         1629 |
| Yuri   | -8lbUNlXVSoXqaRRiHiSNg |         1339 |
+--------+------------------------+--------------+		

		


8. Does posing more reviews correlate with more fans?

	Please explain your findings and interpretation of the results:
	Not necessarily correlated. Amy, who has the most
	fans, only has 609 reviews. Yuri has only 76 fans, but has the
	third most reviews. Some other factors should also be
	considered.
	
    SELECT
        name,
        id,
        fans,
        review_count
    FROM user
    ORDER BY fans DESC

+-----------+------------------------+------+--------------+
| name      | id                     | fans | review_count |
+-----------+------------------------+------+--------------+
| Amy       | -9I98YbNQnLdAmcYfb324Q |  503 |          609 |
| Mimi      | -8EnCioUmDygAbsYZmTeRQ |  497 |          968 |
| Harald    | --2vR0DIsmQ6WfcSzKWigw |  311 |         1153 |
| Gerald    | -G7Zkl1wIWBBmD0KRy_sCw |  253 |         2000 |
| Christine | -0IiMAZI2SsQ7VmyzJjokQ |  173 |          930 |
| Lisa      | -g3XIcCb2b-BD0QBCcq2Sw |  159 |          813 |
| Cat       | -9bbDysuiWeo2VShFJJtcw |  133 |          377 |
| William   | -FZBTkAZEXoP7CYvRV2ZwQ |  126 |         1215 |
| Fran      | -9da1xk7zgnnfO1uTVYGkA |  124 |          862 |
| Lissa     | -lh59ko3dxChBSZ9U7LfUw |  120 |          834 |
| Mark      | -B-QEUESGWHPE_889WJaeg |  115 |          861 |
| Tiffany   | -DmqnhW4Omr3YhmnigaqHg |  111 |          408 |
| bernice   | -cv9PPT7IHux7XUc9dOpkg |  105 |          255 |
| Roanna    | -DFCC64NXgqrxlO8aLU5rg |  104 |         1039 |
| Angela    | -IgKkE8JvYNWeGu8ze4P8Q |  101 |          694 |
| .Hon      | -K2Tcgh2EKX6e6HqqIrBIQ |  101 |         1246 |
| Ben       | -4viTt9UC44lWCFJwleMNQ |   96 |          307 |
| Linda     | -3i9bhfvrM3F1wsC9XIB8g |   89 |          584 |
| Christina | -kLVfaJytOJY2-QdQoCcNQ |   85 |          842 |
| Jessica   | -ePh4Prox7ZXnEBNGKyUEA |   84 |          220 |
| Greg      | -4BEUkLvHQntN6qPfKJP2w |   81 |          408 |
| Nieves    | -C-l8EHSLXtZZVfUAUhsPA |   80 |          178 |
| Sui       | -dw8f7FLaUmWR7bfJ_Yf0w |   78 |          754 |
| Yuri      | -8lbUNlXVSoXqaRRiHiSNg |   76 |         1339 |
| Nicole    | -0zEEaDFIjABtPQni0XlHA |   73 |          161 |
+-----------+------------------------+------+--------------+
	

	
9. Are there more reviews with the word "love" or with the word "hate" in them?

	Answer: Answer: Yes. There are 1780 reviews with “love” and 232
	reviews with “hate”

	
	SQL code used to arrive at answer:
    SELECT COUNT(*)
    FROM review
    WHERE text LIKE "%love%"
    
    SELECT COUNT(*)
    FROM review
    WHERE text LIKE “%hate%” 

	
	
10. Find the top 10 users with the most fans:

	SQL code used to arrive at answer:
	SELECT
        name,
        fans
    FROM user
        ORDER BY fans DESC
        LIMIT 10;
	
	
	
	Copy and Paste the Result Below:
+-----------+------+
| name      | fans |
+-----------+------+
| Amy       |  503 |
| Mimi      |  497 |
| Harald    |  311 |
| Gerald    |  253 |
| Christine |  173 |
| Lisa      |  159 |
| Cat       |  133 |
| William   |  126 |
| Fran      |  124 |
| Lissa     |  120 |
+-----------+------+
	
	
		

Part 2: Inferences and Analysis

1. Pick one city and category of your choice and group the businesses in that city or category by their overall star rating. 
Compare the businesses with 2-3 stars to the businesses with 4-5 stars and answer the following questions. Include your code.
	
i. Do the two groups you chose to analyze have a different distribution of hours?
yes


ii. Do the two groups you chose to analyze have a different number of reviews?
yes
         
         
iii. Are you able to infer anything from the location data provided between these two groups? Explain.
There seems to be a correlation between the location and rating.

SQL code used for analysis:
SELECT b.city, c.category, b.stars
FROM business b
INNER JOIN category c on
b.id = c.business_id
GROUP BY stars
+-------------+-----------------------+-------+
| city        | category              | stars |
+-------------+-----------------------+-------+
| Mentor      | Restaurants           |   1.0 |
| Toronto     | Banks & Credit Unions |   1.5 |
| Scottsdale  | Real Estate           |   2.0 |
| Pittsburgh  | Pizza                 |   2.5 |
| Peoria      | Doctors               |   3.0 |
| Mississauga | Shopping              |   3.5 |
| Toronto     | Restaurants           |   4.0 |
| Las Vegas   | Japanese              |   4.5 |
| Chandler    | Bakeries              |   5.0 |
+-------------+-----------------------+-------+

SELECT
	  b.name ,
      c.category,
      b.city,
      b.postal_code AS zipcode,
      hours,
	  CASE
          WHEN stars BETWEEN 2 AND 3 THEN '2-3 stars'
          WHEN stars BETWEEN 4 AND 5 THEN '4-5 stars'
          END  AS rating,
           b.review_count AS reviews
FROM business B
INNER JOIN hours H
ON b.id = h.business_id
INNER JOIN category C
ON c.business_id = b.id
WHERE city = 'Phoenix' AND category = 'Restaurants' AND rating NOT null
GROUP BY name
ORDER BY stars DESC

+----------------------------------------+-------------+---------+---------+----------------------+-----------+---------+
| name                                   | category    | city    | zipcode | hours                | rating    | reviews |
+----------------------------------------+-------------+---------+---------+----------------------+-----------+---------+
| Charlie D's Catfish & Chicken          | Restaurants | Phoenix | 85034   | Saturday|11:00-18:00 | 4-5 stars |       7 |
| Bootleggers Modern American Smokehouse | Restaurants | Phoenix | 85028   | Saturday|11:00-22:00 | 4-5 stars |     431 |
| Gallagher's                            | Restaurants | Phoenix | 85024   | Saturday|9:00-2:00   | 2-3 stars |      60 |
| McDonald's                             | Restaurants | Phoenix | 85004   | Saturday|5:00-0:00   | 2-3 stars |       8 |
+----------------------------------------+-------------+---------+---------+----------------------+-----------+---------+
	  

		
		
2. Group business based on the ones that are open and the ones that are closed. What differences can you find between the ones that are still open and the ones that are closed? List at least two differences and the SQL code you used to arrive at your answer.
		
i. Difference 1:
the one that is open has more reviews
         
         
ii. Difference 2:
the one that is closed has fewer stars
         
         
         
SQL code used for analysis:

SELECT
  COUNT(DISTINCT id),
  COUNT(DISTINCT city),
  AVG(stars),
  AVG(review_count),
  is_open
FROM business
GROUP BY is_open

+-----------------------------+---------+--------------------------+-------+----------------------+--------------+-------------+
| name                        | is_open | category                 | stars | hours                | review_count | postal_code |
+-----------------------------+---------+--------------------------+-------+----------------------+--------------+-------------+
| Ghost Armor SS Springs      |       0 | Mobile Phone Accessories |   2.0 | Saturday|10:00-21:00 |            3 | 85206       |
| Health For Life: North Mesa |       1 | Cannabis Clinics         |   4.5 | Saturday|9:00-20:00  |           16 | 85215       |
+-----------------------------+---------+--------------------------+-------+----------------------+--------------+-------------+

	
	
3. For this last part of your analysis, you are going to choose the type of analysis you want to conduct on the Yelp dataset and are going to prepare the data for analysis.

Ideas for analysis include: Parsing out keywords and business attributes for sentiment analysis, clustering businesses to find commonalities or anomalies between them, predicting the overall star rating for a business, predicting the number of fans a user will have, and so on. These are just a few examples to get you started, so feel free to be creative and come up with your own problem you want to solve. Provide answers, in-line, to all of the following:
	
i. Indicate the type of analysis you chose to do:
I wanted to assess if there was a correlation between how long a user has been active on Yelp and the number of fans they have, and to also assess if the number of reviews they have 
placed has any correlation to the number of fans they have.
         
         
ii. Write 1-2 brief paragraphs on the type of data you will need for your analysis and why you chose that data:
I used 2 sources of data, the user table and the reviews table. I joined these tables together using the user id I extracted names of users, the number of reviews a user has given, and the number of fans they have. I 
then calculated how long they have been active on Yelp by subtracting their the date of their last review with the date they first joined Yelp. I then 
ordered the users by the largest number of fans to then find out that there isn't a strong correlation between how long a user has been on Yelp and the number
of fans they have, and that the number of fans seems indictive to the quality of reviews.
                           
                  
iii. Output of your finished dataset:
+------------+--------------+---------------+------+
| name       | review_count | years_yelping | fans |
+------------+--------------+---------------+------+
| Nieves     |          178 |             2 |   80 |
| Dottsy     |          196 |             1 |   49 |
| Dixie      |          503 |             6 |   41 |
| Ed         |          904 |             4 |   38 |
| Pinky      |          449 |             1 |   32 |
| Annie      |          279 |             3 |   29 |
| Christina  |           86 |             2 |   27 |
| Crissy     |          676 |             3 |   25 |
| Kyle       |          240 |             6 |   18 |
| AJA        |          257 |             1 |   16 |
| Jean       |          259 |             8 |   15 |
| Dave       |          345 |             3 |   14 |
| Mark       |          418 |             1 |   12 |
| Danny      |          564 |             2 |   11 |
| Andrea     |          174 |             4 |   10 |
| Christophe |           90 |             0 |   10 |
| Alaina     |           44 |             0 |    6 |
| Char       |          122 |             0 |    6 |
| Jade       |          109 |             2 |    6 |
| James      |           10 |             3 |    5 |
| LA         |           92 |             6 |    5 |
| Isabelle   |          167 |             4 |    4 |
| W          |          198 |             8 |    4 |
| Bob        |           96 |             3 |    3 |
| Just       |           62 |             9 |    3 |
+------------+--------------+---------------+------+
         
         
iv. Provide the SQL code you used to create your final dataset:

SELECT user.name ,
       user.review_count ,
       (review.date) - (user.yelping_since) AS years_yelping ,
       user.fans
FROM review
INNER JOIN USER ON review.user_id = user.id
GROUP BY name
ORDER BY fans DESC
LIMIT 25;