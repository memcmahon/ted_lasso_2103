require 'rspec'
require './lib/player'

RSpec.describe Player do
  describe 'instantiation' do
    it '::new' do
      roy = Player.new({name: "Roy Kent", position: "Center Midfielder", salary: 1_000_000})

      expect(roy).to be_an_instance_of(Player)
    end

    it 'has attributes' do
      roy = Player.new({name: "Roy Kent", position: "Center Midfielder", salary: 1_000_000})

      expect(roy.name).to eq("Roy Kent")
      expect(roy.position).to eq("Center Midfielder")
      expect(roy.salary).to eq(1_000_000)
    end
  end
end
