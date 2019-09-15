# Write your code here!
require "pry"

def game_hash
  home_names = ['Alan Anderson', 'Reggie Evans', 'Brook Lopez', 'Mason Plumlee', 'Jason Terry']
  home_stats = [[0,16,22,12,12,3,1,1],[30,14,12,12,12,12,12,7],[11,17,17,19,10,3,1,15],[1,19,26,11,6,3,8,5],[31,15,19,2,2,4,11,1]]
  away_names = ['Jeff Adrien', 'Bismack Biyombo', 'DeSagna Diop', 'Ben Gordon', 'Kemba Walker']
  away_stats = [[4,18,10,1,1,2,7,2],[0,16,12,4,7,22,15,10],[2,14,24,12,12,4,5,5],[8,15,33,3,2,1,1,0],[33,15,6,12,12,7,5,12]]
  stat_names = %i(number shoe points rebounds assists steals blocks slam_dunks)
  
game = {
       home: {
         team_name: "Brooklyn Nets",
         colors: ["Black", "White"],
         players: []
       },
       away: {
         team_name: "Charlotte Hornets",
         colors: ["Turquoise", "Purple"],
         players: []
       } 
      }

home_names.length.times do |i|
  game[:home][:players] << {home_names[i] => {}}
  game[:away][:players] << {away_names[i] => {}}
  stat_names.length.times do |j|
   game[:home][:players][i][home_names[i]][stat_names[j]] = home_stats[i][j]
   game[:away][:players][i][away_names[i]][stat_names[j]] = away_stats[i][j]
  end
end

game
end

def num_points_scored(name)
  game_hash.each do |key, hash|
    hash[:players].each do |elem|
      return elem[elem.keys.first][:points] if elem.keys.first == name
    end 
  end 
end 

def shoe_size(name)
  game_hash.each do |key, hash|
    hash[:players].each do |elem|
      return elem[elem.keys.first][:shoe] if elem.keys.first == name
    end
  end
end

def team_colors(team_name)
  game_hash.each do |key, hash|
    return hash[:colors] if hash[:team_name] == team_name
  end
end 

def team_names
  team_array = []
  game_hash.each do |key, hash|
    team_array << hash[:team_name]
  end
  team_array
end

def player_numberss(team_name)
  jersey_array = []
  game_hash.each do |key, hash|
    hash[:players].each do |elem|
      jersey_array << elem.values.first[:number]
    end
  end
  jersey_array
end 

def player_numbers(team_name)
  jersey_array = []
  game_hash.each do |key, hash|
    if hash[:team_name] == team_name
      hash[:players].each do |elem|
        jersey_array << elem.first.last[:number] 
      end
    end 
  end
  jersey_array
end 

def player_stats(name)
  game_hash.each do |key, hash|
    hash[:players].each do |elem|
      return elem[elem.keys.first] if elem.keys.first == name
    end
  end
end

def big_shoe_rebounds(name)
  
  
end 

p player_stats("Alan Anderson")


