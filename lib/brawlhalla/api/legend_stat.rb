# frozen_string_literal: true

module Brawlhalla
  module API
    class LegendStat
      ATTRIBUTES = %i[
        legend_id legend_name_key damagedealt damagetaken kos falls suicides teamkos matchtime games
        wins damageunarmed damagethrownitem damageweaponone damageweapontwo damagegadgets kounarmed
        kothrownitem koweaponone koweapontwo kogadgets timeheldweaponone timeheldweapontwo xp level
        xp_percentage
      ].freeze

      attr_accessor(*ATTRIBUTES)

      def initialize(json)
        ATTRIBUTES.each do |attr|
          value = json[attr]
          value = value.to_i if attr.to_s.start_with?('damage')

          send("#{attr}=", value)
        end
      end
    end
  end
end
