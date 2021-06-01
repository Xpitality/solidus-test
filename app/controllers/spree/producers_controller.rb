module Spree
  class ProducersController < Spree::StoreController
    helper 'spree/taxons', 'spree/taxon_filters'

    respond_to :html

    def index
      @title = 'Enoteca Naturale - Produttori'
    end

  end
end
