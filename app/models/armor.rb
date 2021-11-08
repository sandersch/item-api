class Armor < ApplicationRecord
  include CombatDetails

  belongs_to :armor_base
end
