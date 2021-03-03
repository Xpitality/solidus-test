module Spree
  class AdditionalStoreSetting < ActiveRecord::Base
    belongs_to :store, class_name: 'Spree::Store'

    validates :label, presence: true, uniqueness: {scope: :store_id}
  end
end
