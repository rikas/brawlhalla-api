# frozen_string_literal: true

require 'brawlhalla/api/legend_stat'
require 'brawlhalla/api/clan'
require 'brawlhalla/api/ranking'

module Brawlhalla
  module API
    class Player
      ATTRIBUTES = %i[
        brawlhalla_id name xp level xp_percentage games wins damagebomb damagespikeball
        damagesidekick hitsnowball kobomb komine kospikeball kosnowball
      ]

      attr_accessor *ATTRIBUTES
      attr_reader :legend_stats, :clan

      def self.find(brawlhalla_id)
        stats_json = API.client.stats(brawlhalla_id)

        new(stats_json)
      end

      def initialize(json)
        ATTRIBUTES.each do |attr|
          value = json[attr]
          value = value.to_i if attr.to_s.start_with?('damage')

          send("#{attr}=", value)
        end

        initialize_clan(json)
        initialize_legends(json)
      end

      def ranking
        @ranking ||= Ranking.find(brawlhalla_id)
      end

      private

      # For some odd reason the damage values come as strings instead of integers.
      def sanitalize_damage_values
        @damagebomb = @damagebomb.to_i
        @damagesidekick = @damagesidekick.to_i
        @damagespikeball = @damagespikeball.to_i
      end

      def initialize_clan(json)
        return unless json[:clan]

        @clan = Clan.new(json[:clan])
      end

      def initialize_legends(json)
        return unless json[:legends]

        @legend_stats = json[:legends].map { |legend_json| LegendStat.new(legend_json) }
      end
    end
  end
end
