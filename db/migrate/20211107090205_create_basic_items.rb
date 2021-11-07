class CreateBasicItems < ActiveRecord::Migration[6.1]
  def change
    create_table :basic_items do |t|
      t.string :worn
      t.integer :capacity
      t.integer :item_limit
      t.string :kind

      t.timestamps
    end
  end
end
