class CreateWeapons < ActiveRecord::Migration[6.1]
  def change
    create_table :weapons do |t|
      t.references :weapon_base, null: false, foreign_key: true
      t.string :forge_quality
      t.integer :enchant
      t.integer :ensorcell
      t.integer :sanctify
      t.integer :critical_services
      t.integer :damage_services
      t.integer :sighting_services

      t.timestamps
    end
  end
end
