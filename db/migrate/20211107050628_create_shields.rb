class CreateShields < ActiveRecord::Migration[6.1]
  def change
    create_table :shields do |t|
      t.string :size
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
