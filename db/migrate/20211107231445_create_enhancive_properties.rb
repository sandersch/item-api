class CreateEnhanciveProperties < ActiveRecord::Migration[6.1]
  def change
    create_table :enhancive_properties do |t|
      t.references :item, null: false, foreign_key: true
      t.string :kind
      t.integer :amount
      t.integer :minimum_level

      t.timestamps
    end
  end
end
