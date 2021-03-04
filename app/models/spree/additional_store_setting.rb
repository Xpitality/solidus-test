module Spree
  class AdditionalStoreSetting < ActiveRecord::Base
    belongs_to :store, class_name: 'Spree::Store'

    validates :label, presence: true, uniqueness: {scope: :store_id}

    class << self
      def delivery_location
        where(label: :delivery_location)
      end
    end

    def show_modal?
      label == 'delivery_location' && boolean_value
    end

    def hours_until_delivery_location_expiry
      number_value || 1
    end

  end
end
