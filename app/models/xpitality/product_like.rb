class Xpitality::ProductLike < ActiveRecord::Base
  self.table_name_prefix = 'xpitality_'

  belongs_to :user, class_name: 'Spree::User'
  belongs_to :product, class_name: 'Spree::Product'

end
