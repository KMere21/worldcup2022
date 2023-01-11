## UPDATED DATA TO REFLECT WORLD CUP RESULTS ## 

#### Exploring each table ####
SELECT *
FROM player_defense;

SELECT *
FROM player_gca;

SELECT * 
FROM player_keepers;

SELECT *
FROM player_keepersadv;

SELECT * 
FROM player_misc;

SELECT * 
FROM player_passing;

SELECT * 
FROM player_passing_types;

SELECT * 
FROM player_playingtime;

SELECT * 
FROM player_possession;

SELECT * 
FROM player_shooting;

SELECT * 
FROM player_stats;

#### EXPLORING TEAM INFORMATION ####

# Which teams are represented in player_stats? Sort alphabetically.
SELECT DISTINCT(team)
FROM player_stats
ORDER BY team ASC;

# How many teams are in player_stats?
	## There are 32 teams in the set (as expected, 32 make it to the world cup).
SELECT COUNT(DISTINCT team)
FROM player_stats;

#### EXPLORING PLAYER COUNTS ####

# How many players are in the datset?
	## There are 675 playes in player_stats
SELECT COUNT(DISTINCT player)
FROM player_stats;

# Do all teams have the same number of players? If not, which has the most? The fewest?
	## Brazil has the most players in player_stats, Ecuador has the fewest.
SELECT COUNT(player) AS team_count, team
FROM player_stats
GROUP BY team
ORDER BY team_count DESC;

#### EXPLORING GOALS ####

# Which player has scored the most goals so far? Which team does he play for?
	# Kylian Mbappe playing for France scored the most with 8 total goals
SELECT goals, player, team
FROM player_shooting
ORDER BY goals DESC;

#### EXPLORING PLAYER AGE ####

#view player name and ages, years only, sorted oldest to youngest
	# Atiba Hutchinson, Dani Alves, and Pepe are the oldest players at 39
SELECT player, LEFT(age, 2) AS age_year
FROM player_stats
ORDER BY age_year DESC;

#view player name and ages, years only, sorted youngest to oldest
	# The youngest players are 18 (perhaps requirement?)
    # The youngest players are Khannous, Moukoko, Kuoi, Gavi, Bennette, and Issahaku
SELECT player, LEFT(age, 2) AS age_year
FROM player_stats
ORDER BY age_year ASC;

#another way to see oldest and youngest ages using min and max
SELECT  MAX(age)
FROM player_stats;

SELECT MIN(age)
FROM player_stats;

# what is the average player age?
	# average player age is 27
SELECT AVG(age) 
FROM player_stats;

# group players by age in years to get sense of distribution
	# have to alias age so that it doesn't group using the age with days
SELECT LEFT(age, 2) AS age_years, COUNT(age)
FROM player_stats
GROUP BY age_years
ORDER BY age_years ASC;

#change order by to see which age group has the most players
	# Most players are 25 (72 total players), followed by 30 (59 total players)
SELECT LEFT(age, 2) AS age_years, COUNT(age) AS number_players
FROM player_stats
GROUP BY age_years
ORDER BY number_players DESC;

#### YELLOW AND RED CARDS #### 

# Which players had the most red and yellow cards? Which team were they from?
	# Only 4 players drew red cards
SELECT player, team, cards_red, cards_yellow
FROM player_stats
ORDER BY cards_red DESC, cards_yellow DESC;

# How many total yellow cards were issued?
	# This shows 224 yellow cards, BBC counted 227 (looked up to verify accuracy)
SELECT SUM(cards_yellow)
FROM player_stats;

#### PLAYING TIME ####

# playing time is set as text so updating to INT (otherwise ORDER BY function does not work properly)
# first updating blank values to 0 (making assumption these players had no playing time, not missing data)

#checking how missing values appear (IS NULL didn't work)
SELECT player, minutes
FROM player_playingtime
WHERE minutes = '';

#changed missing values to 0
UPDATE player_playingtime
SET minutes = 0
WHERE minutes = '';

#verifying update
SELECT player, team, minutes
FROM player_playingtime
ORDER BY minutes DESC;

# modified data using table tool

#Which player had the most playing time?
	# D. Livakovic, E. Martinez, J. Gvardiol, L. Messi, N. Otamendi all played the most with 690 total minutes
SELECT player, team, minutes
FROM player_playingtime
ORDER BY minutes DESC;



