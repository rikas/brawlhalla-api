# frozen_string_literal: true

module Brawlhalla
  module API
    class PlayerSearch
      attr_accessor :name, :brawlhalla_id

      def initialize(json)
        @name = json[:name]
        @brawlhalla_id = json[:brawlhalla_id]
      end
    end
  end
end
