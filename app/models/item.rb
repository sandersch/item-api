class Item < ApplicationRecord
  belongs_to :details, polymorphic: true
  has_many :resistances
end
