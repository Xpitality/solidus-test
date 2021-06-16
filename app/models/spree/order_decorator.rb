Spree::Order.class_eval do

  validates :fiscal_code, 'spree/validations/cf': true, if: :codice_fiscale_needed?

  def codice_fiscale_needed?
    self.bill_address&.country&.iso == 'IT'
  end

end
