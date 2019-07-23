require 'pry'

class Player
  attr_accessor :name, :life_points

  def initialize(player_name)
    @name = player_name
    @life_points = 10
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie."
  end

  #Damages - OUCH !
  def gets_damages(damage_points)
    #on soustrait un point de vie à un joueur
    @life_points = @life_points - damages_point
      if life_points <= 0
        puts "Le joueur #{@name} s'est fait fracasser"
        puts "..."
        puts "Il est DEAD - Fin du Game pour lui!"
      end
  end
   
  #A l'attaque !
  def attacks (player_attacked)
    damages = compute_damage
      puts "#{@name} attaque #{player_attacked.name}"
      player_attacked.gets_damages(damages)
      puts "BIM #{player_attacked.name} a perdu #{damages} points de vie"
      player_attacked.show_state
      puts "\n"	
    end

  def compute_damage
    return rand(1..6)
  end


end

class HumanPlayer < Player
	attr_accessor :weapon_level

	def initialize(player_name)
	  @life_points = 30
	  @weapon_level = 1
    @name = player_name
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{weapon_level}."
  end

  #Le (-fameux!-) multiplicateur de dégat
  def compute_damage
    return rand(1..6) * @weapon_level
  end

  def roll_dice
    return rand(6)+1
  end

  def search_weapon
    lvl_weapon = rand(1..6)
    puts "Tu as choppé une HALLEBARDE de niveau #{lvl_weapon}"
      if lvl_weapon > @weapon_level
        @weapon_level = lvl_weapon
        puts "GÉNIAL, le niveau de cette arme te rend plus FORT !"
        else
        puts "Mmh... pas fameux ... cette nouvelle arme t'encombre, laisse la tomber."
      end
  end

  def search_health_pack
    health_pack = rand(1..6)
    if health_pack == 1
      puts "Y a walou! passes ton chemin."
      elsif health_pack >= 2 && health_pack <= 5
        health_pack = 50
        @life_points = health_pack + @life_points
          if @life_points > 100
            @life_points = 100
          end
          puts "Manifaïque ma chérie, tu as trouvé un pack de +50PV, tu as maintenant #{life_points}PV"

      elsif health_pack == 6
        health_pack = 80
        @life_points = health_pack + @life_points
        if @life_points > 100
          @life_points = 100
        end
        puts "Manifaïque ma chérie, tu as trouvé un pack de +80PV, tu as maintenant #{life_points}PV"
    end
  end


end
