# frozen_string_literal: true

module Brawlhalla
  module API
    class DoublesRanking
      ATTRIBUTES = %i[
        brawlhalla_id_one brawlhalla_id_two rating peak_rating tier wins games teamname region
        global_rank
      ]

      attr_accessor *ATTRIBUTES

      def initialize(json)
        ATTRIBUTES.each do |attr|
          send("#{attr}=", json[attr])
        end

        # Fix teamname encoding
        @teamname = @teamname.encode('iso-8859-1')
      end
    end
  end
end
