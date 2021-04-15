module Spree
  class AdditionalStoreSetting < ActiveRecord::Base
    belongs_to :store, class_name: 'Spree::Store'

    validates :label, presence: true, uniqueness: {scope: :store_id}

    class << self
      def store_email
        where(label: :store_email)
      end
      def store_phone
        where(label: :store_phone)
      end
      def store_instagram
        where(label: :store_instagram)
      end
      def store_facebook
        where(label: :store_facebook)
      end
      def hidden_taxonomies
        where(label: :hidden_taxonomies)
      end
      def quantity_limit_taxonomy
        where(label: :quantity_limit_taxonomy)
      end
      def new_product_taxon_name
        where(label: :new_product_taxon_name)
      end
    end
  end
end
