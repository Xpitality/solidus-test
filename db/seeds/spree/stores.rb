# frozen_string_literal: true

unless Spree::Store.where(code: 'enoteca-naturale').exists?
  Spree::Store.create!(
    name: "Enoteca naturale",
    code: "enoteca-naturale",
    url: if Rails.env.production?
           'enotecanaturale.it/'
         else
           Rails.env.staging? ? 'solidus-en.xptesting.com/' : "example.com"
         end,
    mail_from_address: Rails.env.production? ? 'store@enotecanaturale.it' : "store@solidus-en.xptesting.com"
  )
end
