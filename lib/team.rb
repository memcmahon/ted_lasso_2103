class Team
  attr_reader :name, :coach, :players

  def initialize(name, coach, players)
    @name = name
    @coach = coach
    @players = players
  end

  def player_names
    @players.map do |player|
      player.name
    end
  end

  def total_salary
    # total = 0
    # @players.each do |player|
    #   total += player.salary
    #   # total = total + player.salary
    # end
    # total

    @players.sum do |player|
      player.salary
    end

    # @players.reduce(0) do |total, player|
    #   total + player.salary
    # end
  end

  def captain
    captain_object.name
  end

  def captain_object
    @players.max_by do |player|
      player.salary
    end
  end

  def positions_filled
    @players.map do |player|
      player.position
    end
  end
end
