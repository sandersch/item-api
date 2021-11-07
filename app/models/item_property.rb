class ItemProperty < ApplicationRecord
  belongs_to :slot, polymorphic: true
end
