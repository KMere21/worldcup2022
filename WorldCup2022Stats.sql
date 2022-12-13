## This data was pulled mid world cup on Dec 12, 2022 so stats won't match final world cup results

# Exploring each table
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

#############################

# Which teams are represented in player_stats? Sort alphabetically.
SELECT DISTINCT(team)
FROM player_stats
ORDER BY team ASC;

# How many teams are in player_stats?
	## There are 32 teams in the set (as expected, 32 make it to the world cup).
SELECT COUNT(DISTINCT team)
FROM player_stats;

# How many players are in the datset?
	## There are 666 playes in player_stats
SELECT COUNT(DISTINCT player)
FROM player_stats;

# Do all teams have the same number of players? If not, which has the most? The fewest?
	## Brazil has the most players in player_stats, Ecuador has the fewest.
SELECT COUNT(player) AS team_count, team
FROM player_stats
GROUP BY team
ORDER BY team_count DESC;

# Which player has scored the most goals so far? Which team does he play for?
	# Kylian Mbappe scored the most so far
    # Plays for France
SELECT goals, player, team
FROM player_shooting
ORDER BY goals DESC;

SELECT LEFT(age, 2) AS age_year
FROM player_stats;