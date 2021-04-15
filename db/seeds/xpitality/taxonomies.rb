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

taxons = [
    { name: "Produttore", taxonomy: t_produttore, position: 0 },
    { name: "Klinec", taxonomy: t_produttore, parent: "Produttore" },
    { name: "Kmetija Štekar", taxonomy: t_produttore, parent: "Produttore" },
    { name: "Cantina del Malandrino", taxonomy: t_produttore, parent: "Produttore" },
    { name: "Benoit Delorme", taxonomy: t_produttore, parent: "Produttore" },
    { name: "Rennersistas", taxonomy: t_produttore, parent: "Produttore" },
    { name: "Koppitsch", taxonomy: t_produttore, parent: "Produttore" },

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
    { name: "La Slovenia del vino", taxonomy: t_collezioni, parent: "Collezioni" },
    { name: "Vini imperiali", taxonomy: t_collezioni, parent: "Collezioni" },

    { name: "Quantità limitata", taxonomy: t_quantita_limitata, position: 6 },
    { name: "1", taxonomy: t_quantita_limitata, parent: "Quantità limitata" },
    { name: "2", taxonomy: t_quantita_limitata, parent: "Quantità limitata" },
    { name: "3", taxonomy: t_quantita_limitata, parent: "Quantità limitata" },
    { name: "10", taxonomy: t_quantita_limitata, parent: "Quantità limitata" },

    { name: "Novità", taxonomy: t_novita, position: 7 },
]

taxons.each do |taxon_attrs|
  if taxon_attrs[:parent]
    taxon_attrs[:parent] = Spree::Taxon.find_by!(name: taxon_attrs[:parent])
    Spree::Taxon.create!(taxon_attrs)
  end
end