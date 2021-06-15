module Spree
  class PagesController < Spree::StoreController

    def show
      @page = Alchemy::Page.where(name: params[:id]).first
      if @page
        @title = @page.elements.first&.content_by_name(:headline)&.essence&.body || @page.title
      end
    end

  end
end