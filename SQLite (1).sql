 --Is a small percentage of Hacker News submitters taking the majority of the points?

--First, find the total score of all the stories.
 
 SELECT user, SUM(score)
 FROM hacker_news
 GROUP BY user
 HAVING SUM(score) > 200
 ORDER BY 2 DESC;
--Find the individual users who have gotten combined scores of more than 200, and their combined scores.
 SELECT (517 + 309 + 304 + 282) / 6366.0;

--How many times has each offending user posted this link?
SELECT user,count (*)
FROM hacker_news
WHERE url= "https://www.youtube.com/watch?v=dQw4w9WgXcQ"
GROUP BY 1
ORDER BY 2 DESC;
-- Use CASE statement and count Source and GROUP By users

SELECT CASE
WHEN url LIKE '%github%' THEN
'Github'
WHEN url LIKE '%medium.com%' THEN 'Medium'
WHEN url LIKE '%nytimes%' THEN 'New York Times'
ELSE 'other'
END AS 'Source',
COUNT(*)
FROM hacker_news
GROUP BY 1;

--Best time to post a story--

SELECT strftime('%H', timestamp),
ROUND (AVG(score), 1), COUNT(*)
FROM hacker_news
WHERE timestamp IS NOT NULL
GROUP BY 1
ORDER BY 2 DESC;
