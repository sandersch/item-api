class Weapon < ApplicationRecord
  include CombatDetails

  belongs_to :weapon_base
end
