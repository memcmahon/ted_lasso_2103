class League
  attr_reader :name, :teams

  def initialize(name)
    @name = name
    @teams = []
  end

  def add_team(team)
    @teams << team
  end

  def captains
    # all_captains = []
    # @teams.each do |team|
    #   all_captains << team.captain_object
    # end
    # all_captains

    @teams.map do |team|
      team.captain_object
    end

    # all_captains = []
    # @teams.each do |team|
    #   captain = team.players.max_by do |player|
    #     player.salary
    #   end
    #   all_captains << captain
    # end
    # all_captains
  end

  def players_by_team
    # grouped_players = {}
    # @teams.each do |team|
    #   names = team.players.map do |player|
    #     player.name
    #   end
    #   grouped_players[team] = names
    # end
    # grouped_players

    grouped_players = {}
    @teams.each do |team|
      grouped_players[team] = team.player_names
    end
    grouped_players

    # @teams.reduce({}) do |grouped_players, team|
    #   grouped_players[team] = team.player_names
    #   grouped_players
    # end
  end

  def most_expensive_player
    top_salary = highest_salary

    captains.reduce([]) do |names, player|
      if player.salary == top_salary
        names << player.name
      end
      names
    end
  end

  def highest_salary
    most_expensive_captain = captains.max_by do |player|
      player.salary
    end
    most_expensive_captain.salary
  end

  def players_by_salary_range
    groups = (highest_salary / 1_000_000) + 1
    grouped_players = {}
    groups.times do |n|
      range = (n * 1_000_000)..(((n + 1) * 1_000_000)-1)
      grouped_players["Over #{n}M"] = players_that_earn(range)
    end
    grouped_players
  end

  def players_that_earn(range)
    player_names = []
    @teams.each do |team|
      team.players.each do |player|
        if range.include?(player.salary)
          player_names << player.name
        end
      end
    end
    player_names
  end
end
