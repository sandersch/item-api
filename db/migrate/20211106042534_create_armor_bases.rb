class CreateArmorBases < ActiveRecord::Migration[6.1]
  def change
    create_table :armor_bases do |t|
      t.integer :group
      t.string :name
      t.integer :weight
      t.integer :rt
      t.integer :ap
      t.integer :cva

      t.timestamps
    end
  end
end
