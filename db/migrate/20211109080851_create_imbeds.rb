class CreateImbeds < ActiveRecord::Migration[6.1]
  def change
    create_table :imbeds do |t|
      t.references :item, null: false, foreign_key: true
      t.integer :spell_number
      t.boolean :persists
      t.string :activator
      t.boolean :merchant_rechargeable, default: true
      t.boolean :player_rechargeable
      t.boolean :empowerable
      t.integer :charges
      t.integer :max_charges

      t.timestamps
    end
  end
end
