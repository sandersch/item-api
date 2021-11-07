class CreateArmorAccessories < ActiveRecord::Migration[6.1]
  def change
    create_table :armor_accessories do |t|
      t.string :kind
      t.integer :critical_services
      t.integer :damage_services

      t.timestamps
    end
  end
end
