class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.references :details, polymorphic: true, null: false
      t.integer :weight
      t.string :noun
      t.string :name
      t.string :long_description
      t.string :show_description
      t.boolean :loresong_unlocked

      t.timestamps
    end
  end
end
