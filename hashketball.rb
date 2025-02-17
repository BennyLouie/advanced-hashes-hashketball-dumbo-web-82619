require 'pry'

def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"] ,
      :players => [
          { "Alan Anderson" => 
            {
            :number => 0, 
            :shoe => 16,
            :points => 22,
            :rebounds => 12,
            :assists => 12,
            :steals => 3,
            :blocks => 1,
            :slam_dunks => 1
          }},
          { "Reggie Evans" => 
           {
            :number => 30, 
            :shoe => 14,
            :points => 12,
            :rebounds => 12,
            :assists => 12,
            :steals => 12,
            :blocks => 12,
            :slam_dunks => 7
          }},
          { "Brook Lopez" =>
          {
            :number => 11, 
            :shoe => 17,
            :points => 17,
            :rebounds => 19,
            :assists => 10,
            :steals => 3,
            :blocks => 1,
            :slam_dunks => 15
          }},
          { "Mason Plumlee" =>
          {
            :number => 1, 
            :shoe => 19,
            :points => 26,
            :rebounds => 11,
            :assists => 6,
            :steals => 3,
            :blocks => 8,
            :slam_dunks => 5
          }},
          { "Jason Terry" => 
          {
            :number => 31, 
            :shoe => 15,
            :points => 19,
            :rebounds => 2,
            :assists => 2,
            :steals => 4,
            :blocks => 11,
            :slam_dunks => 1
          }}
          ]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
          { "Jeff Adrien" =>
          {
            :number => 4, 
            :shoe => 18,
            :points => 10,
            :rebounds => 1,
            :assists => 1,
            :steals => 2,
            :blocks => 7,
            :slam_dunks => 2
          }},
          { "Bismack Biyombo" =>
          {
            :number => 0, 
            :shoe => 16,
            :points => 12,
            :rebounds => 4,
            :assists => 7,
            :steals => 22,
            :blocks => 15,
            :slam_dunks => 10
          }},
          { "DeSagna Diop" => 
          {
            :number => 2, 
            :shoe => 14,
            :points => 24,
            :rebounds => 12,
            :assists => 12,
            :steals => 4,
            :blocks => 5,
            :slam_dunks => 5
          }},
          { "Ben Gordon" =>
          {
            :number => 8, 
            :shoe => 15,
            :points => 33,
            :rebounds => 3,
            :assists => 2,
            :steals => 1,
            :blocks => 1,
            :slam_dunks => 0
          }},
          { "Kemba Walker" =>
          {
            :number => 33, 
            :shoe => 15,
            :points => 6,
            :rebounds => 12,
            :assists => 12,
            :steals => 7,
            :blocks => 5,
            :slam_dunks => 12
          }}
          ]
  }
  }
  game_hash
end

def num_points_scored(player)
  game_hash.each do |team, stats|
    stats[:players].each do |i_player|
      if i_player[player]
        return i_player[player][:points]
      end
    end
  end
end

def shoe_size(player)
  game_hash.each do |team, stats|
    stats[:players].each do |i_player|
      if i_player[player]
        return i_player[player][:shoe]
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |team, stats|
    if stats[:team_name] == team_name
      return stats[:colors]
    end
  end
end

def team_names
  teams = []
  teams.push(game_hash[:home][:team_name])
  teams.push(game_hash[:away][:team_name])
  teams
end

def player_numbers(team)
  jersey_numbers = []
  game_hash.each do |teams, stats|
    if stats[:team_name] == team 
      stats[:players].each do |player|
        player.each do |name, data|
          jersey_numbers.push(data[:number])
        end
      end
    end
  end
  jersey_numbers
end

def player_stats(player)
  game_hash.each do |team, stats|
    stats[:players].each do |i_player|
      if i_player[player]
        return i_player[player]
      end
    end
  end
end

def big_shoe_rebounds
  shoes = []
  game_hash.each do |team, stats|
    stats[:players].each do |i_player|
      i_player.each do |name, values|
        shoes.push(i_player[name][:shoe])
      end
    end
  end
  game_hash.each do |team, stats|
    stats[:players].each do |i_player|
      i_player.each do |name, values|
        if i_player[name][:shoe] == shoes.max
          return i_player[name][:rebounds]
        end
      end
    end
  end
end

def most_points_scored
 points = []
  game_hash.each do |team, stats|
    stats[:players].each do |i_player|
      i_player.each do |name, values|
        points.push(i_player[name][:points])
      end
    end
  end
  game_hash.each do |team, stats|
    stats[:players].each do |i_player|
      i_player.each do |name, values|
        if i_player[name][:points] == points.max
          return name
        end
      end
    end
  end
end

def winning_team
brooklyn_points = []
charlotte_points = []
  game_hash.each do |team, stats|
    stats[:players].each do |i_player|
      i_player.each do |name, values|
        if stats[:team_name] == "Brooklyn Nets"
          brooklyn_points.push(i_player[name][:points])
          elsif stats[:team_name] == "Charlotte Hornets"
          charlotte_points.push(i_player[name][:points])
        end
      end
    end
  end
  bp = brooklyn_points.reduce do |p, sum = 0|
    sum += p
  end
  cp = charlotte_points.reduce do |p, sum = 0|
    sum += p
  end
bp > cp ? "Brooklyn Nets" : "Charlotte Hornets"
end

def player_with_longest_name
  players = []
  game_hash.each do |team, stats|
    stats[:players].each do |i_player|
      i_player.each do |name, values|
        players.push(name)
      end
    end
  end
  longest_name = players.max_by do |player|
    player.length
  end
  longest_name
end

def long_name_steals_a_ton?
  longest = player_with_longest_name
  steals = []
  most_steals = nil
  game_hash.each do |team, stats|
    stats[:players].each do |i_player|
      i_player.each do |name, values|
        steals.push(i_player[name][:steals])
      end
    end
  end
  game_hash.each do |team, stats|
    stats[:players].each do |i_player|
      i_player.each do |name, values|
        if i_player[name][:steals] == steals.max
          most_steals = name
        end
      end
    end
  end
  longest and most_steals ? true : false 
end





