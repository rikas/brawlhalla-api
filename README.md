# Brawlhalla API

A ruby wrapper for the [Brawlhalla API](http://dev.brawlhalla.com/).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'brawlhalla-api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install brawlhalla-api

## Usage

Before using Brawlhalla::API you need to set it up with a valid API key.

```ruby
Brawlhalla::API.configure do |config|
  config.api_key = 'YOUR_API_KEY_HERE'
  config.debug = false # set to true for debugging
end
```

### Search By Steam ID

A Player can be looked up by steam ID. This returns the player’s name and brawlhalla_id.

_(A player’s steamid in format steamID64 (ex 76561198048321884).)_

```ruby
Brawlhalla::API.search('76561198048321884')
# => #<Brawlhalla::API::PlayerSearch:0x00007fa9db937a10 @brawlhalla_id=8817417, @name="Rikas">
```

### Players

#### Stats

This endpoint retrieves all stats about a player, given a `brawlhalla_id`. It will return a new
`Brawlhalla::API::Player` instance with all the stats as attributes.

```ruby
player = Brawlhalla::API::Player.find('8817417')
# => #<Brawlhalla::API::Player:0x00007f9642b71350 ...>

player.games # => 1839
player.brawlhalla_id # => 8817417
player.damagebomb  # => 5516
player.kobomb # => 47
```

You also get individual stats (`Brawlhalla::API::LegendStat` instance) for each legend.

```ruby
player.legend_stats.size # => 42

scarlet_stats = player.legend_stats.first

scarlet_stats.damagedealt # => 4481
scarlet_stats.damagegadgets # => 53
scarlet_stats.games # => 45
```

#### Ranked

This endpoint retrieves ranked data about a player. It receives one argument - the brawlhalla_id of
the player.

```ruby
ranked = Ranking.find('8817417')
ranked.wins # => 172
ranked.region # => "EU"
ranked.rating # => 1394
ranked.peak_rating # => 1415
```

**Note**: You can also get the ranked data if you already have a `Brawlhalla::API::Player` instance
by calling the `#ranking` method. Keep in mind that this will also trigger an API call:

```ruby
player = Brawlhalla::API::Player.find('8817417')
player.ranking #=> All the ranked data like the one you get with `Brawlhalla::API::Ranked.find`
```

You can check each legend's rankings by calling the `#legend_rankings` method. This will return an
array of `Brawlhalla::API::LegendRanking` instances:

```ruby
ranked = Ranking.find('8817417')
legend_rankings = ranked.legend_rankings # Array of LegendRanking instances
legend_rankings.size # => 10

bodvar_ranking = legend_rankings.first
bodvar_ranking.games # => 31
bodvar_ranking.peak_rating # => 1200
bodvar.rating # => 1199
bodvar_ranking.tier # => "Silver 2"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run
the tests. You can also run `bin/console` for an interactive prompt that will allow you to
experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/rikas/brawlhalla-api.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
