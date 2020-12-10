SolidusProductFeed.configure do |config|
  config.title = 'My Awesome Store'
  config.link = 'https://www.awesomestore.com'
  config.description = 'Find out about new products on https://www.awesomestore.com first!'
  config.language = 'it'
end

# SolidusProductFeed.configure do |config|
#   config.title = -> (view) { view.current_store.name }
#   config.link = -> (view) { "http://#{view.current_store.url}" }
#   config.description = -> (view) { "Find out about new products on http://#{view.current_store.url} first!" }
#   config.language = -> (view) { view.lang_from_store(current_store.language) }
# end