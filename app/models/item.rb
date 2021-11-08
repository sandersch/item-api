class Item < ApplicationRecord
  belongs_to :details, polymorphic: true
  has_many :resistances
  has_one :enhancive
  has_many :enhancive_properties
end
