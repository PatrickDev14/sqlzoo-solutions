/* SUM and COUNT section of sqlzoo
    Aggregate functions such as COUNT, SUM, AVG, MIN, MAX take many values and deliver just one value.
nobel(yr, subject, winner)
*/

--1
--Show the total number of prizes awarded.

SELECT COUNT(winner)
FROM nobel

--2
--List each subject - just once

SELECT DISTINCT subject
FROM nobel

--3
--Show the total number of prizes awarded for Physics.

SELECT COUNT(subject)
FROM nobel
WHERE subject = 'Physics'

--4
--For each subject show the subject and the number of prizes. Using GROUP BY and HAVING.

SELECT subject, COUNT(subject)
FROM nobel
GROUP BY subject

--5
--For each subject show the first year that the prize was awarded.

SELECT subject, MIN(yr)
FROM nobel
GROUP BY subject

--6
--For each subject show the number of prizes awarded in the year 2000.

SELECT subject, COUNT(subject)
WHERE yr = 2000
GROUP BY subject

--7
--Show the number of different winners for each subject.

SELECT subject, COUNT(DISTINCT winner)
FROM nobel
GROUP BY subject

--8
--For each subject show how many years have had prizes awarded.

SELECT subject, COUNT(DISTINCT yr)
FROM nobel
GROUP BY subject

--9
--Show the years in which three prizes were given for Physics.

SELECT yr
FROM nobel
WHERE subject = 'Physics'
GROUP BY yr
HAVING COUNT(winner) = 3

--10
--Show winners who have won more than once.

SELECT winner
FROM nobel
GROUP BY winner
HAVING COUNT(winner) > 1

--11
--Show winners who have won more than one subject.

SELECT winner
FROM nobel
GROUP BY winner
HAVING COUNT(DISTINCT subject) > 1

--12
--Show the year and subject where 3 prizes were given. Show only years 2000 onwards.

SELECT yr, subject
FROM nobel
WHERE yr >= 2000
GROUP BY yr, subject
HAVING COUNT(winner) = 3