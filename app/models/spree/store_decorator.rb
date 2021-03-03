Spree::Store.class_eval do
  has_many :additional_store_settings, dependent: :destroy, class_name: "Spree::AdditionalStoreSetting"
end
