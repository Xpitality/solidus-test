module Spree
  class PagesController < Spree::StoreController

    def show
      @page = Alchemy::Page.where(name: params[:id]).first
      @title = @page.title
    end

  end
end