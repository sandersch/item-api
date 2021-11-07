class CreateWeaponBases < ActiveRecord::Migration[6.1]
  def change
    create_table :weapon_bases do |t|
      t.string :name
      t.string :category
      t.integer :weight
      t.integer :base_speed
      t.integer :minimum_speed
      t.decimal :damage_factor, precision: 4, scale: 3
      t.integer :avd

      t.timestamps
    end
  end
end
