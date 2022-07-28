class CreateResistances < ActiveRecord::Migration[6.1]
  def change
    create_table :resistances do |t|
      t.references :item, null: false, foreign_key: true
      t.string :kind
      t.integer :amount
      t.boolean :temporary

      t.timestamps
    end
  end
end
