class AddImageNameToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :image_name, :string
  end
end
