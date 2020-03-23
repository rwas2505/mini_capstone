class RenameCratedProductsCartedProducts < ActiveRecord::Migration[6.0]
  def change
    rename_table :crated_products, :carted_products
  end
end
