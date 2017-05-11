-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.
CREATE DATABASE tournament;
\c tournament;

-- Create a table of players
CREATE TABLE players (
  player_id serial PRIMARY KEY,
  name text
);

-- Create a table of matches
CREATE TABLE matches (
  match_id serial,
  winner integer REFERENCES players (player_id),
  loser integer REFERENCES players (player_id)
);

-- Create a view to compute # of wins per player
CREATE VIEW wins as
  SELECT players.player_id, players.name, count(matches.winner) as num_wins
    FROM players LEFT JOIN matches
    ON players.player_id = matches.winner
    GROUP BY players.player_id;

-- Create a view to compute # of games played by player
CREATE VIEW games as
  SELECT players.player_id, count(matches.match_id) as num_games
    FROM players LEFT JOIN matches
    ON players.player_id = matches.winner or players.player_id = matches.loser
    GROUP BY players.player_id;

-- Create a view of all opponents for each player
CREATE VIEW opponents as
  (SELECT winner as player, loser as opponent FROM matches) UNION
  (SELECT loser as player, winner as opponent FROM matches)
  ORDER by player;

-- Create a view of opponent score totals by player to use as tie breaker
CREATE VIEW tie_breaker as
  SELECT opponents.player, SUM(wins.num) as opp_sum
    FROM opponents JOIN wins
    ON opponents.opponent = wins.player_id
    GROUP BY opponents.player
    ORDER BY opponents.player;

-- Create a view to rankings by player
CREATE VIEW rankings as
  SELECT wins.player_id, wins.name, wins.num_wins, subq.opp_sum, subq.num_games
    FROM wins LEFT JOIN
      (SELECT games.player_id, tie_breaker.opp_sum, games.num_games
        FROM games LEFT JOIN tie_breaker
        ON games.player_id = tie_breaker.player) as subq
    ON wins.player_id = subq.player_id
    ORDER BY num_games DESC, num_wins DESC, opp_sum DESC;
