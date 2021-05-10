module Spree
  class PagesController < Spree::StoreController

    def show
      @page = Alchemy::Page.where(name: params[:id]).first
    end

  end
end