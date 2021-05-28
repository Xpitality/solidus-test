class CreateXpitalityProductImports < SolidusSupport::Migration[4.2]
  def self.up
    create_table :xpitality_product_imports do |t|
      t.string :status
      t.string :status_message
      t.text :import_errors
      t.text :data
      t.boolean :completed
      t.references :stock_location
      t.timestamps
    end
  end

  def self.down
    drop_table :xpitality_product_imports
  end
end