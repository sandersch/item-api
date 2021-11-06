class ArmorDetail < ApplicationRecord
  belongs_to :armor_base
  belongs_to :item_property
end
