class ArmorAccessory < ApplicationRecord
  has_one :item, as: :details
  has_one :item_property, as: :slot
end
