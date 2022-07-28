class AddSlotToItemProperties < ActiveRecord::Migration[6.1]
  def change
    add_reference :item_properties, :slot, polymorphic: true, null: false
  end
end
