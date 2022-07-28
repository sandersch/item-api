class CreateBanes < ActiveRecord::Migration[6.1]
  def change
    create_table :banes do |t|
      t.references :item, null: false, foreign_key: true
      t.string :against

      t.timestamps
    end
  end
end
