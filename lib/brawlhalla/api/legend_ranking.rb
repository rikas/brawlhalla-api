# frozen_string_literal: true

module Brawlhalla
  module API
    class LegendRanking
      ATTRIBUTES = %i[legend_id legend_name_key rating peak_rating tier wins games]

      attr_accessor *ATTRIBUTES

      def initialize(json)
        ATTRIBUTES.each do |attr|
          send("#{attr}=", json[attr])
        end
      end
    end
  end
end
