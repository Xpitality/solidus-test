# frozen_string_literal: true

unless Spree::Store.where(code: 'enoteca-naturale').exists?
  store = Spree::Store.create!(
    name: "Enoteca naturale",
    code: "enoteca-naturale",
    url: if Rails.env.production?
           'enotecanaturale.it/'
         else
           Rails.env.staging? ? 'solidus-en.xptesting.com/' : "example.com"
         end,
    mail_from_address: Rails.env.production? ? 'shop@enotecanaturale.it' : "store@solidus-en.xptesting.com"
  )

  {
      store_email: 'shop@enotecanaturale.it',
      store_phone: '+390282770589',
      store_instagram: 'https://instagram.com/enotecanaturale',
      store_facebook: 'https://facebook.com/enotecanaturale',
      quantity_limit_taxonomy: 'Quantità limitata',
      featured_producer_taxon_name: 'Koppitsch',
      featured_collection_taxon_name: 'La Slovenia del vino'
  }.each { |label, text_value| store.additional_store_settings.create(label: label, text_value: text_value) }

end
