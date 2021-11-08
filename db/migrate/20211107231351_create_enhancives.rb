class CreateEnhancives < ActiveRecord::Migration[6.1]
  def change
    create_table :enhancives do |t|
      t.references :item, null: false, foreign_key: true
      t.boolean :persists
      t.boolean :rechargeable

      t.timestamps
    end
  end
end
