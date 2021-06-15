class AddFiscalCodeToSpreeOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :spree_orders, :fiscal_code, :string, null: false
  end
end
