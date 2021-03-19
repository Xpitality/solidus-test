def image(name, type = "jpg")
  images_path = Pathname.new(File.dirname(__FILE__)) + "images"
  path = images_path + "#{name}.#{type}"

  return false if !File.exist?(path)

  path
end

tax_category = Spree::TaxCategory.find_by!(name: "Default")
shipping_category = Spree::ShippingCategory.find_by!(name: "Default")

products = [
    {
        name: 'Rennersistas "Waiting for Tom Weiss" 2019',
        description: "Tom è il nuovo Godot. Arriva, arriva, con calma ma arriva. Ma in realtà i Tom che Stefanie ha aspettato, durante le sue esperienze presso le rispettive cantine (Matassa in Francia e Shobbrook in Australia), sono due, come due sono i vitigni che compongono questo vino, Chardonnay e Pinot Bianco. L'aromaticità appena accennata del Pinot Bianco eleva lo Chardonnay, l'abitudine ad avere a che fare con l'ossigeno che gli garantisce la permanenza in anfora e in legno gli dona un perfetto equilibrio senza interventi di alcun tipo, neanche l'aggiunta di solfiti.",
        slug: 'rennersistas-waiting-for-tom-weiss-2019',
        sku: 'RENSISWTW19',
        tax_category: tax_category,
        shipping_category: shipping_category,
        price: 24.50,
        cost_price: 13.30,
        weight: 1.8,
        height: 20,
        width: 10,
        depth: 5,
        available_on: Time.current,
        taxons: ['Bianco', 'Chardonnay', '0,75l', 'Burgenland', 'Pinot bianco', 'Rennersistas'],
        properties: {
            'Occasione' => "in quella famosa notte di mezz'estate",
            'Alcool' => 13,
            'Annata' => 2019
        }
    },
]

images = {}

products.each do |product_attrs|
  Spree::Config[:currency] = "EUR"

  properties = product_attrs.delete(:properties)
  taxons = product_attrs.delete(:taxons)

  product = Spree::Product.create!(product_attrs)
  product.reload
  product.shipping_category = shipping_category
  taxons.each do |taxon_name|
    taxon = Spree::Taxon.find_by!(name: taxon_name)
    taxon.products << product
  end
  properties.each do |prop_name, prop_value|
    product.set_property(prop_name, prop_value)
  end
  product.save!

  images[product.master] = [image(product_attrs[:slug])]

  product.variants.each do |variant|
    main_image = image(product_attrs[:slug], "jpg")
    File.open(main_image) do |f|
      variant.images.create!(attachment: f)
    end
  end
end

images.each do |variant, sample_images|
  puts "Loading images for #{variant.product.name}"
  sample_images.each do |sample_image|
    File.open(sample_image) do |f|
      variant.images.create!(attachment: f)
    end
  end
end

Spree::Config[:currency] = "EUR"

Spree::Variant.all.each do |variant|
  variant.stock_items.each do |stock_item|
    Spree::StockMovement.create(quantity: 10, stock_item: stock_item)
  end
end