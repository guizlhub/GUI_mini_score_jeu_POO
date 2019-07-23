require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Joozy OZZBOURNE")  # on ajoute directement les joueurs pour ne pas à avoir a les definir en paramètre
player2 = Player.new("Une vieille PUNTO")

def entree
	puts "Les roses sont rose,"
	sleep(2)
	puts "	les violettes sont violettes,"
	sleep(2)
	puts "		et ton sang gicle quand je te fouette."
  sleep(2)
  
	puts "
 ✿♥✿░ ░ ░B░I░E░N░V░E░N░U░E░ ░ ░✿♥✿
✿♥✿░ ░ ░ ░ ░ ░D░A░N░S░ ░ ░ ░ ░ ░✿♥✿
✿♥✿░ ░T░H░E░ ░U░L░T░I░M░A░T░E░ ░✿♥✿
 ✿♥✿░ ░ ░ ░ ░G░A░M░E░ ░ ░ ░ ░ ░✿♥✿
 \n"
end



def human_player
	puts "Paysan.. Entre ton nom pour participer:"
	print "> "
	human_player = gets.chomp
	HumanPlayer.new(human_player)
end

def self.all
	@@all_player
end

def fight(player1, player2, human_player)

  while player1.life_points >= 0 && player2.life_points >= 0|| human_player.life_points >= 0
		
		puts "Vous avez #{human_player.life_points}"

		puts "Quelle action veux-tu effectuer ?
		a - chercher une meilleure arme 
		s - chercher à se soigner 

		attaquer un joueur en vue :
		0 - #{player1.name} a #{player1.life_points}
		1 - #{player2.name} a #{player2.life_points}"

		entry = gets.chomp 
		if entry == "a" 
			human_player.search_weapon
		elsif entry == "s"
			human_player.search_health_pack
		elsif entry == "0" 
			human_player.attacks(player1)
		elsif entry == "1"
			human_player.attacks(player2)
		elsif entry != "a" || entry != "s" || entry != "0" || entry != "1"
		 puts "Mauvaise entrée, réessayer"
		end

		puts "les autres joueurs attaquent"

			player1.attacks(human_player)
			player2.attacks(human_player)

		break if human_player.life_points <= 0
		break if player1.life_points <= 0
		break if player2.life_points <= 0 

	end

end

def won(player1, player2, human_player)
	if human_player.life_points > player1.life_points
		puts "Tu as gagné!"
	  elsif player1.life_points > human_player || player2.life_points > human_player
		puts "Vas jouer aux mots croisée, tu ne perdras pas au moins..."
	end
end

fight

binding.pry



