class Item < ApplicationRecord
  belongs_to :details, polymorphic: true
end
