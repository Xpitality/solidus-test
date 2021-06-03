class Spree::ProductLikesController < Spree::StoreController
  def toggle
    @product_like = Xpitality::ProductLike.where(product_id: params['product_id'], user_id: try_spree_current_user.id).first
    puts @product_like.inspect
    if @product_like
      @status = @product_like.destroy
    else
      @status = Xpitality::ProductLike.create(product_id: params['product_id'], user_id: try_spree_current_user.id)
    end
    puts @status.inspect
    @product = Spree::Product.where(id: params['product_id']).first
    puts @product.inspect
  end
end
