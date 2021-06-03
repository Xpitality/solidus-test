module MailHelper
  def current_store
    @current_store ||= Spree::Config.current_store_selector_class.new(request).store
  end
end