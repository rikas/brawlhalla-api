# frozen_string_literal: true

module Brawlhalla
  module API
    class Client
      BASE_URL = 'https://api.brawlhalla.com'

      def initialize(api_key, debug: false)
        @api_key = api_key
        @debug = debug
      end

      # Search player by Steam ID.
      #
      # === Example
      #   bh = Brawlhalla::API::Client.new('YOUR_API_KEY_HERE')
      #   bh.search(76561198048321884)
      def search(steamid)
        request(
          path: 'search',
          params: { steamid: steamid }
        )
      end

      # Get player stats by giving the Brawlhalla ID.
      #
      # === Example
      #   bh = Brawlhalla::API::Client.new('YOUR_API_KEY_HERE')
      #   bh.stats(8817417)
      def stats(brawlhalla_id)
        request(path: "player/#{brawlhalla_id}/stats")
      end

      # Get player ranked stats by giving the Brawlhalla ID.
      #
      # === Example
      #   bh = Brawlhalla::API::Client.new('YOUR_API_KEY_HERE')
      #   bh.ranked(8817417)
      def ranked(brawlhalla_id)
        request(path: "player/#{brawlhalla_id}/ranked")
      end

      private

      def client
        @client ||= Faraday.new(url: BASE_URL) do |conn|
          conn.headers['Content-Type'] = 'application/json'
          conn.use FaradayMiddleware::ParseJson
          conn.response :json, parser_options: { symbolize_names: true }
          conn.response :logger if @debug
          conn.adapter Faraday.default_adapter
        end
      end

      def request(path:, params: {})
        full_url = build_url(path, params)

        response = client.get(full_url)
        response.body
      end

      def build_url(path, params = {})
        url = Addressable::URI.join(path)
        url.query_values = { api_key: ENV['API_KEY'] }.merge(params)
        url
      end
    end
  end
end
