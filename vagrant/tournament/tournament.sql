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
