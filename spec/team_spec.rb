require 'rspec'
require './lib/player'
require './lib/team'
require 'pry'

RSpec.describe Team do
  describe 'instantiation' do
    it '::new' do
      roy = Player.new({name: "Roy Kent", position: "Center Midfielder" , salary: 1_000_000})
      sam = Player.new({name: "Sam Obisanya", position: "Right-back Defender", salary: 600_000})
      richmond = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])

      expect(richmond).to be_an_instance_of(Team)
    end

    it 'has attributes' do
      roy = Player.new({name: "Roy Kent", position: "Center Midfielder" , salary: 1_000_000})
      sam = Player.new({name: "Sam Obisanya", position: "Right-back Defender", salary: 600_000})
      richmond = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])

      expect(richmond.name).to eq("AFC Richmond")
      expect(richmond.coach).to eq("Ted Lasso")
      expect(richmond.players).to eq([roy, sam])
    end
  end

  describe 'instace methods' do
    it '#total_salary' do
      roy = Player.new({name: "Roy Kent", position: "Center Midfielder" , salary: 1_000_000})
      sam = Player.new({name: "Sam Obisanya", position: "Right-back Defender", salary: 600_000})
      richmond = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])

      expect(richmond.total_salary).to eq(1_600_000)
    end

    it '#captain' do
      roy = Player.new({name: "Roy Kent", position: "Center Midfielder" , salary: 1_000_000})
      sam = Player.new({name: "Sam Obisanya", position: "Right-back Defender", salary: 600_000})
      richmond = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])

      expect(richmond.captain).to eq('Roy Kent')
    end

    it '#captain_object' do
      roy = Player.new({name: "Roy Kent", position: "Center Midfielder" , salary: 1_000_000})
      sam = Player.new({name: "Sam Obisanya", position: "Right-back Defender", salary: 600_000})
      richmond = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])

      expect(richmond.captain_object).to eq(roy)
    end

    it '#player_names' do
      roy = Player.new({name: "Roy Kent", position: "Center Midfielder" , salary: 1_000_000})
      sam = Player.new({name: "Sam Obisanya", position: "Right-back Defender", salary: 600_000})
      richmond = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])

      expect(richmond.player_names).to eq([roy.name, sam.name])
    end

    it '#positions_filled' do
      roy = Player.new({name: "Roy Kent", position: "Center Midfielder" , salary: 1_000_000})
      sam = Player.new({name: "Sam Obisanya", position: "Right-back Defender", salary: 600_000})
      richmond = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])

      expect(richmond.positions_filled).to eq(["Center Midfielder", "Right-back Defender"])
    end
  end
end
