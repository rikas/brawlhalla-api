# frozen_string_literal: true

module Brawlhalla
  module API
    class Clan
      ATTRIBUTES = %i[
        clan_name clan_id clan_xp personal_xp
      ].freeze

      attr_accessor(*ATTRIBUTES)

      alias name clan_name
      alias id clan_id
      alias xp clan_xp

      def initialize(json)
        ATTRIBUTES.each do |attr|
          send("#{attr}=", json[attr])
        end
      end
    end
  end
end
