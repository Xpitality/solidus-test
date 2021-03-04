class CreateSpreeAdditionalStoreSetting < ActiveRecord::Migration[6.0]
  def change
    create_table :spree_additional_store_settings do |t|
      t.references :store, null: false
      t.string :label
      t.text :text_value
      t.boolean :boolean_value
      t.integer :number_value
    end
  end
end
