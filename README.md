# Ted Lasso

## Instructions

* Fork this Repository
* Clone your forked repo to your computer.
* Complete the activity below.
* Push your solution to your forked repo
* Submit a pull request from your repository to this repository
* Put your name in your PR!

## Iteration 1

Use TDD to create a `Player` class that responds to the following interaction pattern:

```ruby
pry(main)> require './lib/player'
# => true

pry(main)> roy = Player.new({name: "Roy Kent", position: "Center Midfielder", salary: 1_000_000})
# => #<Player:0x00007f98a4ba8dc8...>

pry(main)> roy.name
# => "Roy Kent"

pry(main)> roy.position
# => "Center Midfielder"

pry(main)> roy.salary
# => 1000000
```

## Iteration 2

Use TDD to create a `Team` class that responds to the following interaction pattern:

* The team captain is the highest paid player.

```ruby
pry(main)> require './lib/player'
# => true

pry(main)> require './lib/team'
# => true

pry(main)> roy = Player.new({name: "Roy Kent", position: "Center Midfielder" , salary: 1_000_000})
# => #<Player:0x00007f98a4ba8dc8...>

pry(main)> sam = Player.new({name: "Sam Obisanya", position: "Right-back Defender", salary: 600_000})
# => #<Player:0x00007f8327213de0...>

pry(main)> richmond = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])
# => #<Team:0x00007f83280b3288...>

pry(main)> richmond.name
# => "AFC Richmond"

pry(main)> richmond.coach
# => "Ted Lasso"

pry(main)> richmond.players
# => [#<Player:0x00007f8327213de0...>, #<Player:0x00007f8326ab57d8...>]

pry(main)> richmond.total_salary
# => 1600000

pry(main)> richmond.captain
# => "Roy Kent"

pry(main)> richmond.positions_filled
# => ["Center Midfielder", "Right-back Defender"]
```

## Iteration 3

Use TDD to create a `League` class that responds to the following interaction pattern.

```ruby
pry(main)> require './lib/league'
# => true

pry(main)> require './lib/team'
# => true

pry(main)> require './lib/player'
# => true

pry(main)> premier = League.new("Premier League")
# => #<League:0x00007fe5f83ea3b0...>

pry(main)> premier.name
# => "Premier League"

pry(main)> premier.teams
# => []

pry(main)> roy = Player.new({name: "Roy Kent", position: "Center Midfielder" , salary: 1_000_000})
# => #<Player:0x00007f98a4ba8dc8...>

pry(main)> sam = Player.new({name: "Sam Obisanya", position: "Right-back Defender", salary: 600_000})
# => #<Player:0x00007f8327213de0...>

pry(main)> richmond = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])
# => #<Team:0x00007f83280b3288...>

pry(main)> jamie = Player.new({name: "Jamie Tartt", position: "Striker", salary: 1_500_000})
# => #<Player:0x00007fe5f832bb18...>

pry(main)> fernandinho = Player.new({name: "Fernandinho", position: "Midfielder", salary: 5_200_000})
# => #<Player:0x00007fe5f8172a60...>

pry(main)> manchester = Team.new("Manchester City FC", "Pep Guardiola", [jamie, fernandinho])
# => #<Team:0x00007fe5f88b0a20...>

pry(main)> premier.add_team(richmond)

pry(main)> premier.add_team(manchester)

pry(main)> premier.teams
# => [#<Team:0x00007f83280b3288...>,#<Team:0x00007fe5f88b0a20...>]

pry(main)> premier.captains
# => [#<Player:0x00007f98a4ba8dc8...>,#<Player:0x00007fe5f8172a60...>]

pry(main)> premier.players_by_team
# => {
      #<Team:0x00007f83280b3288...> => ["Roy Kent", "Sam Obisanya"],
      #<Team:0x00007fe5f88b0a20...> => ["Jamie Tartt", "Fernandinho"]
#    }
```

## Iteration 4

Use TDD to update your `League` class so that it responds to the following interaction pattern.

* `most_expensive_player` will return multiple names if there is a tie.
* `players_by_salary_range` is inclusive, so a player making 1_000_000 would get included in Over 1M. This
method should be a general one and be able to handle any salary.

```ruby
pry(main)> require './lib/league'
# => true

pry(main)> require './lib/team'
# => true

pry(main)> require './lib/player'
# => true

pry(main)> roy = Player.new({name: "Roy Kent", position: "Center Midfielder" , salary: 1_000_000})
# => #<Player:0x00007f98a4ba8dc8...>

pry(main)> sam = Player.new({name: "Sam Obisanya", position: "Right-back Defender", salary: 600_000})
# => #<Player:0x00007f8327213de0...>

pry(main)> richmond = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])
# => #<Team:0x00007f83280b3288...>

pry(main)> jamie = Player.new({name: "Jamie Tartt", position: "Striker", salary: 1_500_000})
# => #<Player:0x00007fe5f832bb18...>

pry(main)> fernandinho = Player.new({name: "Fernandinho", position: "Midfielder", salary: 5_200_000})
# => #<Player:0x00007fe5f8172a60...>

pry(main)> manchester = Team.new("Manchester City FC", "Pep Guardiola", [jamie, fernandinho])
# => #<Team:0x00007fe5f88b0a20...>

pry(main)> premier.add_team(richmond)

pry(main)> premier.add_team(manchester)


pry(main)> premier.most_expensive_player
# => ["Fernandinho"]

pry(main)> premier.players_by_salary_range
# => {
#      "Over 0M" => ["Sam Obisanya"],
#      "Over 1M" => ["Roy Kent", "Jamie Tartt"],
#      "Over 2M" => [],
#      "Over 3M" => [],
#      "Over 4M" => [],
#      "Over 5M" => ["Fernandinho"],
#    }

```_
