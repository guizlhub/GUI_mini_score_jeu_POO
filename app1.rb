require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Josiane")
player2 = Player.new("José")

puts "-Bienvenue au combat à mort!"
puts "Le combat va bientôt commencer"
puts "-A ma droite, une guerrière redoutable, surnommée bulldozer par ses fans... Joooooooooooosiaaane!"
puts "#{player1.name} entre sur le ring: "
puts "-A ma gauche, José le concierge... Oui heu... le combattant prévu a la chiasse il n'a pas pu venir... Mais José s'est proposé, alors... Bref peu importe."
puts "#{player2.name} entre sur le ring: "
puts "-QUE LE COMBAT COMMENCE!"
puts " "

while player1.life_points >= 0 || player2.life_points >= 0
  player1.show_state
  player2.show_state
  player1.attacks(player2)
  break if player2.life_points <= 0
  player2.attacks(player1)
  break if player1.life_points <= 0
  puts " "
end

binding.pry
