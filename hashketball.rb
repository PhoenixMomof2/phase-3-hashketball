require 'pry'

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

# helper method for accessing an array of all the players 
def all_players()
  game_hash[:home][:players] + game_hash[:away][:players]
end

def num_points_scored(player_name)
  player = player_stats(player_name)
  player[:points]
end

# helper method for accessing a hash of a player's stats
def player_stats(player_name)
  all_players.find {|player| player[:player_name] == player_name }
end

def shoe_size (player_name)
  player = player_stats(player_name)
  player[:shoe]
end

# helper method to find a team by their team name
def which_team(team_name)
  team_info = game_hash.find do |location, team_data|
    team_data[:team_name] == team_name
  end
  team_info[1]
  # index 0 returns :home
  # indices 2 and 3 return nil
end

def team_names
  game_hash.map do |location, team_data|
    team_data[:team_name]
  end
end

def team_colors(team_name)
  team = which_team(team_name)
  team[:colors]
end

def player_numbers(team_name)
  team = which_team(team_name)
  team[:players].map {|player| player[:number] }
end

# helper method to find the player with the biggest shoe
def big_shoe_player
  all_players.max_by do |player|
    player[:shoe]
  end
end

def big_shoe_rebounds
  big_shoe_player[:rebounds]
end

# Bonus Questions:

# If you would like to take on a few more challenges, there are a few more things you can do. There are not tests for this content - these are provide for additional practice working with hash data.

# Define methods to return the answer to the following questions:

# Which player has the most points? Call the method most_points_scored.

# Which team has the most points? Call the method winning_team.

# Which player has the longest name? Call the method player_with_longest_name.

# Super Bonus:

# Write a method that returns true if the player with the longest name had the most steals. Call the method long_name_steals_a_ton?.