require 'alchemy/solidus/spree_user_extension'

Spree::User.class_eval do
  include Alchemy::Solidus::SpreeUserExtension
end
