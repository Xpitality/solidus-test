# frozen_string_literal: true

module Spree
  class CouponCodesController < Spree::StoreController
    before_action :load_order, only: :create
    around_action :lock_order, only: :create

    def create
      authorize! :update, @order, cookies.signed[:guest_token]

      if params[:coupon_code].present?
        @order.coupon_code = params[:coupon_code]
        handler = PromotionHandler::Coupon.new(@order).apply
        @order.update_attribute(:state, 'payment') if @order.state == 'confirm'

        respond_with(@order) do |format|
          format.html do
            if handler.successful?
              redirect_to checkout_path, flash: { success: handler.success }
            else
              redirect_to checkout_path, flash: { error: handler.error }
            end
          end
        end
      end
    end

    private

    def load_order
      @order = current_order
    end
  end
end
