Spree::Order.class_eval do

  validates :fiscal_code, 'spree/validations/cf': true

  # class << self
  # end

end
