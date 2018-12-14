# frozen_string_literal: true

require 'brawlhalla/api/legend_ranking'
require 'brawlhalla/api/doubles_ranking'

module Brawlhalla
  module API
    class Ranking
      ATTRIBUTES = %i[
        name brawlhalla_id rating peak_rating tier wins games region global_rank region_rank
      ]

      attr_accessor *ATTRIBUTES
      attr_reader :legend_rankings, :doubles_rankings

      def self.find(brawlhalla_id)
        ranking_json = API.client.ranked(brawlhalla_id)
        new(ranking_json)
      end

      def initialize(json)
        ATTRIBUTES.each do |attr|
          send("#{attr}=", json[attr])
        end

        legends = json[:legends] || []
        doubles = json[:"2v2"] || []

        @legend_rankings = legends.map { |legend_json| LegendRanking.new(legend_json) }
        @doubles_rankings = doubles.map { |doubles_json| DoublesRanking.new(doubles_json) }
      end
    end
  end
end
