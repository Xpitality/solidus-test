module MailHelper
  def current_store
    Spree::Store.first
  end
end