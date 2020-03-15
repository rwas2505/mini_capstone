class ChangeColumnNameInProducts < ActiveRecord::Migration[6.0]
  def change
    rename_column :products, :suppler_id, :supplier_id
  end
end
