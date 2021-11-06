class CreateItemProperties < ActiveRecord::Migration[6.1]
  def change
    create_table :item_properties do |t|
      t.string :kind
      t.string :effect
      t.integer :amount
      t.boolean :temporary

      t.timestamps
    end
  end
end
