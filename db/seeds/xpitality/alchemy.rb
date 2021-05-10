site = Alchemy::Site.create(host: '*', name: 'Enoteca Naturale')

language = Alchemy::Language.create(
    name: 'Italian',
    language_code: 'it',
    frontpage_name: 'Home',
    page_layout: 'index',
    public: true,
    default: true,
    site: site,
    locale: 'it')

root_page = Alchemy::Page.create(name: 'Root')
italian_layoutroot_page = Alchemy::Page.create(name: 'Layoutroot for Italian', parent: root_page, layoutpage: true, language: language, urlname: 'layoutroot-for-italian')

[
    { name: 'chi-siamo', urlname: 'chi-siamo', title: 'Chi siamo', visible: true, layoutpage: true, parent: italian_layoutroot_page, page_layout: 'basic', language: language },
    { name: 'faq', urlname: 'faq', title: 'FAQ', visible: true, layoutpage: true, parent: italian_layoutroot_page, page_layout: 'basic', language: language },
    { name: 'spedizione', urlname: 'spedizione', title: 'Spedizione', visible: true, layoutpage: true, parent: italian_layoutroot_page, page_layout: 'basic', language: language },
    { name: 'contatti', urlname: 'contatti', title: 'Contatti', visible: true, layoutpage: true, parent: italian_layoutroot_page, page_layout: 'basic', language: language },
    { name: 'terms-of-service', urlname: 'terms-of-service', title: 'Terms of service', visible: true, layoutpage: true, parent: italian_layoutroot_page, page_layout: 'basic', language: language },
    { name: 'il-locale', urlname: 'il-locale', title: 'Il locale', visible: true, layoutpage: true, parent: italian_layoutroot_page, page_layout: 'basic', language: language },
].each do |page_attributes|
  Alchemy::Page.create page_attributes
end

