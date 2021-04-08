require 'rspec'
require './lib/player'
require './lib/team'
require './lib/league'
require 'pry'

RSpec.describe League do
  describe 'instantiation' do
    it "::new" do
      premier = League.new("Premier League")

      expect(premier).to be_an_instance_of(League)
    end

    it 'has a name' do
      premier = League.new("Premier League")

      expect(premier.name).to eq("Premier League")
    end

    it 'starts with no teams' do
      premier = League.new("Premier League")

      expect(premier.teams).to eq([])
    end
  end

  describe 'instance methods' do
    it '#add_team' do
      premier = League.new("Premier League")
      roy = Player.new({name: "Roy Kent", position: "Center Midfielder" , salary: 1_000_000})
      sam = Player.new({name: "Sam Obisanya", position: "Right-back Defender", salary: 600_000})
      richmond = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])
      jamie = Player.new({name: "Jamie Tartt", position: "Striker", salary: 1_500_000})
      fernandinho = Player.new({name: "Fernandinho", position: "Midfielder", salary: 5_200_000})
      manchester = Team.new("Manchester City FC", "Pep Guardiola", [jamie, fernandinho])

      premier.add_team(richmond)
      premier.add_team(manchester)

      expect(premier.teams).to eq([richmond, manchester])
    end

    it '#captains' do
      premier = League.new("Premier League")
      roy = Player.new({name: "Roy Kent", position: "Center Midfielder" , salary: 1_000_000})
      sam = Player.new({name: "Sam Obisanya", position: "Right-back Defender", salary: 600_000})
      richmond = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])
      jamie = Player.new({name: "Jamie Tartt", position: "Striker", salary: 1_500_000})
      fernandinho = Player.new({name: "Fernandinho", position: "Midfielder", salary: 5_200_000})
      manchester = Team.new("Manchester City FC", "Pep Guardiola", [jamie, fernandinho])

      premier.add_team(richmond)
      premier.add_team(manchester)

      expect(premier.captains).to eq([roy, fernandinho])
    end

    it '#players_by_team' do
      premier = League.new("Premier League")
      roy = Player.new({name: "Roy Kent", position: "Center Midfielder" , salary: 1_000_000})
      sam = Player.new({name: "Sam Obisanya", position: "Right-back Defender", salary: 600_000})
      richmond = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])
      jamie = Player.new({name: "Jamie Tartt", position: "Striker", salary: 1_500_000})
      fernandinho = Player.new({name: "Fernandinho", position: "Midfielder", salary: 5_200_000})
      manchester = Team.new("Manchester City FC", "Pep Guardiola", [jamie, fernandinho])

      premier.add_team(richmond)
      premier.add_team(manchester)

      expected = {
        richmond => ["Roy Kent", "Sam Obisanya"],
        manchester => ["Jamie Tartt", "Fernandinho"]
      }

      expect(premier.players_by_team).to eq(expected)
    end

    it '#highest_salary' do
      premier = League.new("Premier League")
      roy = Player.new({name: "Roy Kent", position: "Center Midfielder" , salary: 1_000_000})
      sam = Player.new({name: "Sam Obisanya", position: "Right-back Defender", salary: 600_000})
      richmond = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])
      jamie = Player.new({name: "Jamie Tartt", position: "Striker", salary: 1_500_000})
      fernandinho = Player.new({name: "Fernandinho", position: "Midfielder", salary: 5_200_000})
      manchester = Team.new("Manchester City FC", "Pep Guardiola", [jamie, fernandinho])

      premier.add_team(richmond)
      premier.add_team(manchester)

      expect(premier.highest_salary).to eq(5_200_000)
    end

    it '#most_expensive_player - no tie' do
      premier = League.new("Premier League")
      roy = Player.new({name: "Roy Kent", position: "Center Midfielder" , salary: 1_000_000})
      sam = Player.new({name: "Sam Obisanya", position: "Right-back Defender", salary: 600_000})
      richmond = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])
      jamie = Player.new({name: "Jamie Tartt", position: "Striker", salary: 1_500_000})
      fernandinho = Player.new({name: "Fernandinho", position: "Midfielder", salary: 5_200_000})
      manchester = Team.new("Manchester City FC", "Pep Guardiola", [jamie, fernandinho])

      premier.add_team(richmond)
      premier.add_team(manchester)

      expect(premier.most_expensive_player).to eq(["Fernandinho"])
    end

    it '#most_expensive_player - tie' do
      premier = League.new("Premier League")
      roy = Player.new({name: "Roy Kent", position: "Center Midfielder" , salary: 5_200_000})
      sam = Player.new({name: "Sam Obisanya", position: "Right-back Defender", salary: 600_000})
      richmond = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])
      jamie = Player.new({name: "Jamie Tartt", position: "Striker", salary: 1_500_000})
      fernandinho = Player.new({name: "Fernandinho", position: "Midfielder", salary: 5_200_000})
      manchester = Team.new("Manchester City FC", "Pep Guardiola", [jamie, fernandinho])

      premier.add_team(richmond)
      premier.add_team(manchester)

      expect(premier.most_expensive_player).to eq(["Roy Kent", "Fernandinho"])
    end

    it '#players_by_salary_range' do
      premier = League.new("Premier League")
      roy = Player.new({name: "Roy Kent", position: "Center Midfielder" , salary: 1_000_000})
      sam = Player.new({name: "Sam Obisanya", position: "Right-back Defender", salary: 600_000})
      richmond = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])
      jamie = Player.new({name: "Jamie Tartt", position: "Striker", salary: 1_500_000})
      fernandinho = Player.new({name: "Fernandinho", position: "Midfielder", salary: 5_200_000})
      manchester = Team.new("Manchester City FC", "Pep Guardiola", [jamie, fernandinho])

      premier.add_team(richmond)
      premier.add_team(manchester)

      expected = {
        "Over 0M" => ["Sam Obisanya"],
        "Over 1M" => ["Roy Kent", "Jamie Tartt"],
        "Over 2M" => [],
        "Over 3M" => [],
        "Over 4M" => [],
        "Over 5M" => ["Fernandinho"],
      }

      expect(premier.players_by_salary_range).to eq(expected)
    end

    it '#players_that_earn' do
      premier = League.new("Premier League")
      roy = Player.new({name: "Roy Kent", position: "Center Midfielder" , salary: 1_000_000})
      sam = Player.new({name: "Sam Obisanya", position: "Right-back Defender", salary: 600_000})
      richmond = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])
      jamie = Player.new({name: "Jamie Tartt", position: "Striker", salary: 1_500_000})
      fernandinho = Player.new({name: "Fernandinho", position: "Midfielder", salary: 5_200_000})
      manchester = Team.new("Manchester City FC", "Pep Guardiola", [jamie, fernandinho])

      premier.add_team(richmond)
      premier.add_team(manchester)

      expect(premier.players_that_earn(1_000_000..1_999_999)).to eq(["Roy Kent", "Jamie Tartt"])
      expect(premier.players_that_earn(2_000_000..2_999_999)).to eq([])
    end
  end
end
