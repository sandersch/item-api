class BasicItem < ApplicationRecord
  has_one :item, as: :details
end
