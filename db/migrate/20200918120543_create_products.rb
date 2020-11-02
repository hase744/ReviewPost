class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :item
      t.string :manufacturer
      t.string :price
      t.string :height
      t.string :width
      t.string :depth
      t.text :function

      t.timestamps
    end
  end
end
