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

### Search By Steam ID

A Player can be looked up by steam ID. This returns the player’s name and brawlhalla_id.

_(A player’s steamid in format steamID64 (ex 76561198025185087).)_

```ruby
  bh = Brawlhalla::API::Client.new('YOUR_API_KEY_HERE')
  bh.search('PLAYER_STEAM_ID')
```

### Players

#### Stats

This endpoint retrieves all stats about a player

```ruby
  bh = Brawlhalla::API::Client.new('YOUR_API_KEY_HERE')
  bh.stats('PLAYER_BRAWLHALLA_ID')
```

#### Ranked

This endpoint retrieves ranked data about a player.

```ruby
  bh = Brawlhalla::API::Client.new('YOUR_API_KEY_HERE')
  bh.ranked('PLAYER_BRAWLHALLA_ID')
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/rikas/brawlhalla-api.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
