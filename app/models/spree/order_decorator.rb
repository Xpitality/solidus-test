Spree::Order.class_eval do

  validates :fiscal_code, 'spree/validations/cf': true, if: :email?

  # class << self
  # end

  def new_order?
    self.new_record?
  end

end
