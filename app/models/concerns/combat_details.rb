module CombatDetails
  extend ActiveSupport::Concern

  included do
    has_one :item, as: :details
    has_one :item_property, as: :slot
  end
end
