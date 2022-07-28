class AddMaterialToItem < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :material, :string
  end
end
