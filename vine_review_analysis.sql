-- convert vine table into a cleaned vine table
Select * 
Into cleaned_vine_table
from vine_table 
Where (total_votes >= 20) 
And CAST(helpful_votes AS FLOAT)/CAST(total_votes AS FLOAT) >=0.5;
-- create a y_vine table
Select * 
Into y_vine_table
from cleaned_vine_table 
Where vine = 'Y';
-- create n_vine table
Select * 
Into n_vine_table
from cleaned_vine_table 
Where vine = 'N';


-- Y total votes
Select sum(total_votes) from y_vine_table;

-- Y 5 star votes
Select sum(total_votes) from y_vine_table Where star_rating = 5;

-- Y percent
Select 
(select Cast(sum(total_votes) As Float) from y_vine_table Where star_rating = 5)
/(Select Cast(sum(total_votes) As Float) from y_vine_table) As "5_star_percentage";

-- N total votes
Select sum(total_votes) from n_vine_table;

-- N 5 star votes
Select sum(total_votes) from n_vine_table Where star_rating = 5;

-- N percent
Select 
(select Cast(sum(total_votes) As Float) from n_vine_table Where star_rating = 5)
/(Select Cast(sum(total_votes) As Float) from n_vine_table) As "5_star_percentage";