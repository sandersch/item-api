class Weapon < ApplicationRecord
  belongs_to :weapon_base
  has_one :item, as: :details
  has_one :item_property, as: :slot
end
