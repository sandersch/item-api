class ArmorDetail < ApplicationRecord
  belongs_to :armor_base
  has_one :item_property
end
