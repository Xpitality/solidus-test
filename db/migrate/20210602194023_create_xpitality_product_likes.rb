class CreateXpitalityProductLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :xpitality_product_likes do |t|
      t.references :user
      t.references :product

      t.timestamps
    end
  end
end
