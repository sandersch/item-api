class Armor < ApplicationRecord
  belongs_to :armor_base
  has_one :item, as: :details
  has_one :item_property, as: :slot
end
