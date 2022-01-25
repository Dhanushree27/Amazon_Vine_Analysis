-- Vine Analysis Summary
SELECT vine,COUNT(*) AS total_reviews, 
	   COUNT(*) FILTER (WHERE star_rating=5) AS toppositive_reviews,
	   ROUND(COUNT(*) FILTER (WHERE star_rating=5)*100.0/COUNT(*),2) AS percent_reviews
FROM vine_table
WHERE total_votes>=20
AND CAST(helpful_votes AS FLOAT)/
CAST(total_votes AS FLOAT) >=0.5
GROUP BY vine

-- Paid vine
SELECT * FROM vine_table
WHERE total_votes>=20
AND CAST(helpful_votes AS FLOAT)/CAST(total_votes AS FLOAT) >=0.5
AND vine='Y'

-- Unpaid non-vine
SELECT * FROM vine_table
WHERE total_votes>=20
AND CAST(helpful_votes AS FLOAT)/CAST(total_votes AS FLOAT) >=0.5
AND vine='N'