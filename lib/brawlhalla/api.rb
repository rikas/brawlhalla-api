# frozen_string_literal: true

require 'brawlhalla/api/version'
require 'brawlhalla/api/configuration'
require 'brawlhalla/api/client'
require 'brawlhalla/api/player'
require 'brawlhalla/api/player_search'

require 'faraday'
require 'faraday_middleware'
require 'addressable'

module Brawlhalla
  module API
    module_function

    def configuration
      @configuration ||= Configuration.new
    end

    def client
      @client = Client.new(configuration.api_key, debug: configuration.debug?)
    end

    def configure
      yield(configuration)
    end

    def search(steam_id)
      search_json = client.search(steam_id)

      PlayerSearch.new(search_json)
    end
  end
end
