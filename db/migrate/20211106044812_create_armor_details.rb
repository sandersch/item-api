class CreateArmorDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :armor_details do |t|
      t.references :armor_base, null: false, foreign_key: true
      t.references :item_property, null: true, foreign_key: true
      t.integer :enchant
      t.integer :ensorcell
      t.integer :sanctify
      t.integer :critical_services
      t.integer :damage_services
      t.integer :sighting_services
      t.timestamp :loresong_unlocked

      t.timestamps
    end
  end
end
