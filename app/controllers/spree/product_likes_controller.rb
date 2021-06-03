class Spree::ProductLikesController < Spree::StoreController
  def toggle
    if try_spree_current_user
      @product_like = Xpitality::ProductLike.where(product_id: params['product_id'], user_id: try_spree_current_user.id).first

      if @product_like
        @status = @product_like.destroy
      else
        @status = Xpitality::ProductLike.create(product_id: params['product_id'], user_id: try_spree_current_user.id)
      end
      @product = Spree::Product.where(id: params['product_id']).first
    end
  end
end
