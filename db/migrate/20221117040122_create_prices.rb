class CreatePrices < ActiveRecord::Migration[6.1]
  def change
    create_table :prices do |t|
      t.float :price
      t.integer :product_id
      t.timestamps
    end
  end
end
