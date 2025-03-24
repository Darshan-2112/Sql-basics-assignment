# sql assignment 1
use ds_mar_2025;

select * from fifa;

# 1. how many players are there in the dataset
select count(*) from fifa; # 16643

# 2. how many nationalities do these players belong to
select count(distinct nationality) as dist_nationality from fifa; #161

# 3. which nationality has the highest number of players, what are the top 3 nationality by of players
select nationality, count(*) as player_count
from fifa
group by nationality
order by player_count desc limit 3;  # england = 1475,germany=1151,spain=974

# 4 what is the total wage given to all players? whats the average and standard deviation
 select 
 sum(wage) as total_wage, # 160073000
 Avg(wage) as average_wage,# 9618.0376
 stddev(wage) as std_wage # 22262.850062...
 from fifa;
 
 
 # 5. which player has the highest wage and lowest wage
 select
 max(wage) as highest_wage, # 565000
 min(wage) as lowest_wage # 1000
 from fifa;
 
 
 # 6 the player having the best overall rating and worst overall rating
 select name, overall, count(*) as cnt,
 min(overall) as worst_overall,
 max(overall) as best_overall
 from fifa
 group by name,overall;
 

 
 # 7  club having the highest total of overall rating? highest average of overall rating
 select club,
 sum(overall) as total_overall
 from fifa
 group by club
 order by total_overall desc limit 1; # highet total of overall rating is real madrid= 2582
 
 select club,
 avg(overall) as avg_overall
 from fifa
 group by club
 order by avg_overall desc limit 1; # highest average of overall rating is juventus = 82.2800
 
 
 # 8. what are the top 5 clubs based on the average rating of their players
 select club,
 avg(overall) as avg_overall
 from fifa
 group by club
 order by avg_overall asc limit 5;
 # bray wanderers= 53.6522
 # limierick fc + 54.5263
 # bohemain fc= 55.0000
 # derry city = 55.5882
 # sligo rovers= 56.6316
 
 
use ds_mar_2025; 
# what is the distrubution of players whose name prefferd foot is left vs right
select preferred_foot, count(*) as frequency
from fifa
where preferred_foot in("left","right")
group by preferred_foot; # left= 3820, right= 12823

# which jersey number is the luckiest
select jersey_number,count(*) as frequency
from fifa
group by jersey_number
order by frequency desc limit 1; # 7   565

# what is the frequenvy distribution of nationalities among players whose club name starts with M (****)
select nationality,count(*) as frequency
from fifa 
where club like "M%"
group by nationality
order by nationality;





# how many players have joined their respective clubs in the date range 20 may 2018 to 10 april 2019
select count(*) as joined
from fifa
where joined between "20-05-2018" and "10-04-2019"; # 0

# how many players joined the club datewise
select joined,  count(*) as players_joined
from fifa
group by joined
order by joined;

# how many players have joined their resprective clubs yearly
SELECT 
    EXTRACT(YEAR FROM joined) AS year,
    club, 
    COUNT(*) AS players_joined
FROM fifa
GROUP BY year, club
ORDER BY year, club;
