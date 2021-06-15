SolidusProductFeed.configure do |config|
  config.title = 'e/n enoteca naturale'
  config.link = 'https://www.enotecanaturale.it'
  config.description = 'La selezione più croccante di vini naturali, on-line e al nostro bancone'
  config.language = 'it'

  config.feed_product_class = 'Xpitality::FeedProduct'
end

# SolidusProductFeed.configure do |config|
#   config.title = -> (view) { view.current_store.name }
#   config.link = -> (view) { "http://#{view.current_store.url}" }
#   config.description = -> (view) { "Find out about new products on http://#{view.current_store.url} first!" }
#   config.language = -> (view) { view.lang_from_store(current_store.language) }
# end
