# frozen_string_literal: true

module Brawlhalla
  module API
    class Configuration
      attr_accessor :api_key, :debug

      def initialize
        @api_key = ''
        @debug = false
      end

      def debug?
        @debug || false
      end
    end
  end
end
