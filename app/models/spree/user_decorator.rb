require 'alchemy/solidus/spree_user_extension'

Spree::User.class_eval do
  include Alchemy::Solidus::SpreeUserExtension
  has_many :product_likes, class_name: "Xpitality::ProductLike"
end
