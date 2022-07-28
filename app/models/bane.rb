class Bane < ApplicationRecord
  belongs_to :item
  has_one :property, as: :slot, class_name: "ItemProperty"
end
