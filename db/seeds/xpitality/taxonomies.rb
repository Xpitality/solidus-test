def image(name, type = "jpg")
  images_path = Pathname.new(File.dirname(__FILE__)) + "images"
  path = images_path + "#{name}.#{type}"

  return false if !File.exist?(path)

  path
end

taxonomies = [
    { name: "Produttore" },
    { name: "Paese" },
    { name: "Tipologia" },
    { name: "Uve" },
    { name: "Formato" },
    { name: "Collezioni" },
    { name: "Quantità limitata" },
    { name: "Novità" },
]

taxonomies.each do |taxonomy_attrs|
  Spree::Taxonomy.create!(taxonomy_attrs)
end

t_produttore = Spree::Taxonomy.find_by!(name: "Produttore")
t_paese = Spree::Taxonomy.find_by!(name: "Paese")
t_tipologia = Spree::Taxonomy.find_by!(name: "Tipologia")
t_uve = Spree::Taxonomy.find_by!(name: "Uve")
t_formato = Spree::Taxonomy.find_by!(name: "Formato")
t_collezioni = Spree::Taxonomy.find_by!(name: "Collezioni")
t_quantita_limitata = Spree::Taxonomy.find_by!(name: "Quantità limitata")
t_novita = Spree::Taxonomy.find_by!(name: "Novità")

generic_producer_description = 'È anche grazie al lavoro sulla tradizione di vignaioli come Denny Bini se oggi è possibile parlare di una vera e propria rinascita della viticoltura emiliana.'
generic_collection_description = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris cursus risus id est ultrices, convallis lacinia risus congue. Sed ultricies velit orci'
generic_taxon_new_description = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris cursus risus id est ultrices, convallis lacinia risus congue. Sed ultricies velit orci'

taxons = [
    { name: "Produttore", taxonomy: t_produttore, position: 0 },
    { name: "Klinec", taxonomy: t_produttore, parent: "Produttore", description: generic_producer_description },
    { name: "Kmetija Štekar", taxonomy: t_produttore, parent: "Produttore", description: generic_producer_description },
    { name: "Cantina del Malandrino", taxonomy: t_produttore, parent: "Produttore", description: generic_producer_description },
    { name: "Benoit Delorme", taxonomy: t_produttore, parent: "Produttore", description: generic_producer_description },
    { name: "Rennersistas", taxonomy: t_produttore, parent: "Produttore", description: generic_producer_description },
    { name: "Rennersistas 2", taxonomy: t_produttore, parent: "Produttore", description: generic_producer_description },
    { name: "Rennersistas 3", taxonomy: t_produttore, parent: "Produttore", description: generic_producer_description },
    { name: "Koppitsch", taxonomy: t_produttore, parent: "Produttore", description: generic_producer_description },
    { name: "Koppitsch 2", taxonomy: t_produttore, parent: "Produttore", description: generic_producer_description },
    { name: "Koppitsch 3", taxonomy: t_produttore, parent: "Produttore", description: generic_producer_description },

    { name: "Paese", taxonomy: t_paese, position: 1 },
    { name: "Italia", taxonomy: t_paese, parent: "Paese" },
    { name: "Langhe", taxonomy: t_paese, parent: "Italia" },
    { name: "Colli Berici", taxonomy: t_paese, parent: "Italia" },
    { name: "Francia", taxonomy: t_paese, parent: "Paese" },
    { name: "Borgogna", taxonomy: t_paese, parent: "Francia" },
    { name: "Slovenia", taxonomy: t_paese, parent: "Paese" },
    { name: "Collio goriziano / Brda", taxonomy: t_paese, parent: "Slovenia" },
    { name: "Valle della Vipava", taxonomy: t_paese, parent: "Slovenia" },
    { name: "Germania", taxonomy: t_paese, parent: "Paese" },
    { name: "Mosella", taxonomy: t_paese, parent: "Germania" },
    { name: "Pfalz", taxonomy: t_paese, parent: "Germania" },
    { name: "Repubblica Ceca", taxonomy: t_paese, parent: "Paese" },
    { name: "Moravia sud", taxonomy: t_paese, parent: "Repubblica Ceca" },
    { name: "Austria", taxonomy: t_paese, parent: "Paese" },
    { name: "Burgenland", taxonomy: t_paese, parent: "Austria" },

    { name: "Tipologia", taxonomy: t_tipologia, position: 2 },
    { name: "Rosso", taxonomy: t_tipologia, parent: "Tipologia" },
    { name: "Bianco", taxonomy: t_tipologia, parent: "Tipologia" },
    { name: "Macerato", taxonomy: t_tipologia, parent: "Tipologia" },
    { name: "Rosato", taxonomy: t_tipologia, parent: "Tipologia" },
    { name: "Metodo classico", taxonomy: t_tipologia, parent: "Tipologia" },
    { name: "Rifermentato", taxonomy: t_tipologia, parent: "Tipologia" },
    { name: "Champagne", taxonomy: t_tipologia, parent: "Tipologia" },
    { name: "Passito", taxonomy: t_tipologia, parent: "Tipologia" },
    { name: "Birra", taxonomy: t_tipologia, parent: "Tipologia" },
    { name: "Distillato", taxonomy: t_tipologia, parent: "Tipologia" },

    { name: "Uve", taxonomy: t_uve, position: 3 },
    { name: "Chardonnay", taxonomy: t_uve, parent: "Uve" },
    { name: "Ribolla gialla", taxonomy: t_uve, parent: "Uve" },
    { name: "Malvasia istriana", taxonomy: t_uve, parent: "Uve" },
    { name: "Cabernet Sauvignon", taxonomy: t_uve, parent: "Uve" },
    { name: "Pinot nero", taxonomy: t_uve, parent: "Uve" },
    { name: "Pinot bianco", taxonomy: t_uve, parent: "Uve" },
    { name: "Riesling Italico", taxonomy: t_uve, parent: "Uve" },
    { name: "Field blend", taxonomy: t_uve, parent: "Uve" },

    { name: "Formato", taxonomy: t_formato, position: 4 },
    { name: "0,75l", taxonomy: t_formato, parent: "Formato" },
    { name: "1,5l / magnum", taxonomy: t_formato, parent: "Formato" },
    { name: "Mezza bottiglia", taxonomy: t_formato, parent: "Formato" },
    { name: "Bottiglietta (250ml)", taxonomy: t_formato, parent: "Formato" },
    { name: "Lattina", taxonomy: t_formato, parent: "Formato" },

    { name: "Collezioni", taxonomy: t_collezioni, position: 5 },
    { name: "La Slovenia del vino", taxonomy: t_collezioni, parent: "Collezioni", description: generic_collection_description },
    { name: "Vini imperiali", taxonomy: t_collezioni, parent: "Collezioni", description: generic_collection_description },

    { name: "Quantità limitata", taxonomy: t_quantita_limitata, position: 6 },
    { name: "1", taxonomy: t_quantita_limitata, parent: "Quantità limitata" },
    { name: "2", taxonomy: t_quantita_limitata, parent: "Quantità limitata" },
    { name: "3", taxonomy: t_quantita_limitata, parent: "Quantità limitata" },
    { name: "10", taxonomy: t_quantita_limitata, parent: "Quantità limitata" },

    { name: "Novità", taxonomy: t_novita, position: 7, description: generic_taxon_new_description },
]

taxons.each do |taxon_attrs|
  if taxon_attrs[:parent]
    taxon_attrs[:parent] = Spree::Taxon.find_by!(name: taxon_attrs[:parent])
    t = Spree::Taxon.create!(taxon_attrs)

    if taxon_attrs[:parent].name == "Produttore"
      puts "Loading image for taxon #{t.name}"
      main_image = image('la-cantina-del-mese-background', "png")
      File.open(main_image) do |f|
        t.images.create!(attachment: f)
      end
    end
  end
end