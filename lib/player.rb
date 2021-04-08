class Player
  attr_reader :name, :position, :salary

  def initialize(player_params)
    @name = player_params[:name]
    @position = player_params[:position]
    @salary = player_params[:salary]
  end
end
