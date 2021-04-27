# Spree::Core::Engine.load_seed if defined?(Spree::Core)
%w(
  stores
  store_credit
  countries
  return_reasons
  states
  stock_locations
  zones
  refund_reasons
  roles
  shipping_categories
).each do |seed|
  puts "Loading seed file: #{seed}"
  require_relative "seeds/spree/#{seed}"
end

Spree::Auth::Engine.load_seed if defined?(Spree::Auth)

SolidusUserRoles::Engine.load_seed if defined?(SolidusUserRoles::Engine)
Alchemy::Seeder.seed!

%w(
  payment_methods
  shipping
  taxonomies
  products
  alchemy
).each do |seed|
  puts "Loading seed file: #{seed}"
  require_relative "seeds/xpitality/#{seed}"
end



# Spree::Sample.load_sample("orders")
# Spree::Sample.load_sample("payments")
# Spree::Sample.load_sample("reimbursements")

