Admin.create!(
  email:                  'admin@admin.com',
  password:               'admin888',
  password_confirmation:  'admin888'
)

Parameter.create!(code: 'DEFAULT_SEO_TITLE_SEGINE', value: 'DEFAULT TITLE')
Parameter.create!(code: 'DEFAULT_SEO_DESCRIPTION_SEGINE', value: 'DEFAULT DESCRIPTION')
Parameter.create!(code: 'DEFAULT_SEO_TITLE_IMMO_VICTOIRE', value: 'DEFAULT TITLE')
Parameter.create!(code: 'DEFAULT_SEO_DESCRIPTION_IMMO_VICTOIRE', value: 'DEFAULT DESCRIPTION')
Parameter.create!(code: 'VIADEO_SEGINE', value: '#')
Parameter.create!(code: 'GOOGLEPLUS_SEGINE', value: '#')
Parameter.create!(code: 'FACEBOOK_SEGINE', value: '#')
Parameter.create!(code: 'VIADEO_IMMO_VICTOIRE', value: '#')
Parameter.create!(code: 'GOOGLEPLUS_IMMO_VICTOIRE', value: '#')
Parameter.create!(code: 'FACEBOOK_IMMO_VICTOIRE', value: '#')

segine = Domain.create!(title: 'Segine', code:'SEGINE')
immo = Domain.create!(title: 'Immobilière des victoires', code:'IMMO_VICTOIRE')

# menu
Menu.create!(code: 'SEGINE')
Menu.create!(code: 'IMMO_VICTOIRE')

menus = Menu.all
menus.each do |menu|
  d = Domain.find_by_code(menu.code)
  # main links
  societe = Link.create!(title: 'La société', url: '#', domain: d, image:File.open("#{Rails.root}/app/assets/images/init/icon-building.png"))
  copropriete = Link.create!(title: 'Copropriété', url: '#', domain: d, image:File.open("#{Rails.root}/app/assets/images/init/icon-users.png"))
  gestion_locative = Link.create!(title: 'Gestion Locative', url: '#', domain: d, image:File.open("#{Rails.root}/app/assets/images/init/icon-building2.png"))
  transaction = Link.create!(title: 'Transaction', url: '#', domain: d, image:File.open("#{Rails.root}/app/assets/images/init/icon-transaction.png"))
  location = Link.create!(title: 'Location', url: '#', domain: d, image:File.open("#{Rails.root}/app/assets/images/init/icon-location.png"))
  assurances = Link.create!(title: 'Assurances', url: '#', domain: d, image:File.open("#{Rails.root}/app/assets/images/init/icon-folder.png"))
  espace_client = Link.create!(title: 'Espace client', url: '#', domain: d, image:File.open("#{Rails.root}/app/assets/images/init/icon-account.png"))

  # links
  actualites = Link.create!(title: 'Actualités Générales', url: '/actualites', domain: d)
  actu_copropriete = Link.create!(title: 'Actualités Copropriétés', url: '/actualites?categorie=actualites-coproprietes', domain: d)
  confiez = Link.create!(title: 'Confiez-nous votre immeuble', url: '/confiez-nous-votre-immeuble', domain: d)
  actualites_locatives = Link.create!(title: 'Actualités Locatives', url: '/actualites?categorie=actualites-gestion-locatives', domain: d)
  confiez2 = Link.create!(title: 'Confiez-nous la gestion de votre bien', url: '/confiez-nous-la-gestion-de-votre-bien', domain: d)
  bien_a_vendre = Link.create!(title: 'Nos biens à vendre', url: '/biens-a-vendre', domain: d)
  actualites_transaction = Link.create!(title: 'Actualités Transactions', url: '/actualites?categorie=actualites-transactions', domain: d)
  confiez3 = Link.create!(title: 'Confiez-nous la vente de votre bien', url: '/confiez-nous-la-vente-de-votre-bien', domain: d)
  bien_a_louer = Link.create!(title: 'Nos biens à louer', url: '/biens-a-louer', domain: d)
  espace_client_link = Link.create!(title: 'Consultez votre compte en ligne', url: 'https://atri.thetranet.fr/Authentification.aspx?ReturnUrl=%2fListeDesComptes.aspx', domain: d)

  # pages
  a_propos = Page.create!(title: 'A propos', body: 'A COMPLETER', domain: d)
  garantie = Page.create!(title: 'Garantie', body: 'A COMPLETER', domain: d)
  quelques_chiffres = Page.create!(title: 'Quelques Chiffres', body: 'A COMPLETER', domain: d)
  recrutement = Page.create!(title: 'Espace recrutement', body: 'A COMPLETER', domain: d)
  presentation_activite = Page.create!(title: 'Présentation Activite', body: 'A COMPLETER', slug:'gestion-syndic', domain: d)
  guide_copropriete = Page.create!(title: 'Le Guide du copropriétaire', body: 'A COMPLETER', domain: d)
  presentation_activite2 = Page.create!(title: 'Présentation Activite', body: 'A COMPLETER', slug: 'gestion-bien-immobilier', domain: d)
  guide_proprietaire = Page.create!(title: 'Le guide du propriétaire', body: 'A COMPLETER', domain: d)
  presentation_activite3 = Page.create!(title: 'Présentation Activite', body: 'A COMPLETER', slug: 'activite', domain: d)
  guide_transaction = Page.create!(title: 'Le guide de la transaction', body: 'A COMPLETER', domain: d)
  presentation_activite4 = Page.create!(title: 'Présentation Activite', body: 'A COMPLETER', slug: 'louer-un-bien', domain: d)
  guide_locataire = Page.create!(title: 'Le guide du locataire', body: 'A COMPLETER', domain: d)
  constituez = Page.create!(title: 'Constituer votre dossier', body: 'A COMPLETER', domain: d)
  assurances2 = Page.create!(title: 'Les assurances', body: 'A COMPLETER', domain: d)
  guide_assurance = Page.create!(title: 'Le guide dégat des eaux', body: 'A COMPLETER', domain: d)

  # menu association
  menu1 = MenuAssociation.create!(menu: menu, position: 0, link: societe)
  MenuAssociation.create!(menu: menu, position: 0, ancestry: menu1.id, page: a_propos)
  MenuAssociation.create!(menu: menu, position: 1, ancestry: menu1.id, page: garantie)
  MenuAssociation.create!(menu: menu, position: 2, ancestry: menu1.id, link: actualites)
  MenuAssociation.create!(menu: menu, position: 3, ancestry: menu1.id, page: quelques_chiffres)
  MenuAssociation.create!(menu: menu, position: 4, ancestry: menu1.id, page: recrutement)

  menu2 = MenuAssociation.create!(menu: menu, position: 1, link: copropriete)
  MenuAssociation.create!(menu: menu, position: 0, ancestry: menu2.id, page: presentation_activite)
  MenuAssociation.create!(menu: menu, position: 1, ancestry: menu2.id, link: actu_copropriete)
  MenuAssociation.create!(menu: menu, position: 2, ancestry: menu2.id, page: guide_copropriete)
  MenuAssociation.create!(menu: menu, position: 3, ancestry: menu2.id, link: confiez)

  menu3 = MenuAssociation.create!(menu: menu, position: 2, link: gestion_locative)
  MenuAssociation.create!(menu: menu, position: 0, ancestry: menu3.id, page: presentation_activite2)
  MenuAssociation.create!(menu: menu, position: 1, ancestry: menu3.id, link: actualites_locatives)
  MenuAssociation.create!(menu: menu, position: 2, ancestry: menu3.id, page: guide_proprietaire)
  MenuAssociation.create!(menu: menu, position: 3, ancestry: menu3.id, link: confiez2)

  menu4 = MenuAssociation.create!(menu: menu, position: 3, link: transaction)
  MenuAssociation.create!(menu: menu, position: 0, ancestry: menu4.id, page: presentation_activite3)
  MenuAssociation.create!(menu: menu, position: 1, ancestry: menu4.id, link: bien_a_vendre)
  MenuAssociation.create!(menu: menu, position: 2, ancestry: menu4.id, link: actualites_transaction)
  MenuAssociation.create!(menu: menu, position: 3, ancestry: menu4.id, page: guide_transaction)
  MenuAssociation.create!(menu: menu, position: 4, ancestry: menu4.id, link: confiez3)

  menu5 = MenuAssociation.create!(menu: menu, position: 4, link: location)
  MenuAssociation.create!(menu: menu, position: 0, ancestry: menu5.id, page: presentation_activite4)
  MenuAssociation.create!(menu: menu, position: 1, ancestry: menu5.id, link: bien_a_louer)
  MenuAssociation.create!(menu: menu, position: 2, ancestry: menu5.id, page: guide_locataire)
  MenuAssociation.create!(menu: menu, position: 3, ancestry: menu5.id, page: constituez)

  menu6 = MenuAssociation.create!(menu: menu, position: 5, link: assurances)
  MenuAssociation.create!(menu: menu, position: 0, ancestry: menu6.id, page: assurances2)
  MenuAssociation.create!(menu: menu, position: 1, ancestry: menu6.id, page: guide_assurance)

  menu7 = MenuAssociation.create!(menu: menu, position: 5, link: espace_client)
  MenuAssociation.create!(menu: menu, position: 0, ancestry: menu7.id, link: espace_client_link)
end

Agency.create!(title: 'Segine', domain: segine, address: '12 place des Victoires, 92600 Asnières-sur-seine', latitude: '48.910566', longitude: '2.2893519', body: 'Agence Immobilière <br /> Adresse: ...<br /> Téléphone: ...<br />Horaires: ...')
Agency.create!(title: 'Immobiliere des victoires', domain: immo, address: '12 place des Victoires, 92600 Asnières-sur-seine', latitude: '48.910566', longitude: '2.2893519', body: 'Agence Immobilière <br /> Adresse: ...<br /> Téléphone: ...<br />Horaires: ...')

Slider.create!(title: 'slide 1', domain: segine, image:File.open("#{Rails.root}/app/assets/images/init/slide1.jpeg"))
Slider.create!(title: 'slide 2', domain: segine, image:File.open("#{Rails.root}/app/assets/images/init/slide2.jpeg"), position: 2)
Slider.create!(title: 'slide 1', domain: immo, image:File.open("#{Rails.root}/app/assets/images/init/slide1.jpeg"))
Slider.create!(title: 'slide 2', domain: immo, image:File.open("#{Rails.root}/app/assets/images/init/slide2.jpeg"), position: 2)

cat1 = Category.create!(title: 'Actualites Gestion Locatives')
cat2 = Category.create!(title: 'Actualites Copropriétés')
cat3 = Category.create!(title: 'Actualites Transactions')
Category.create!(title: 'Infos pratiques')

5.times do
  a = Article.create!(title: 'Lorem Ipsum', published_at: DateTime.new(2017, 01, 15, 0, 0, 0), is_published: true, domain: segine, body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur at vehicula magna, ultricies maximus urna. Vestibulum vulputate felis in nibh rhoncus, eget ullamcorper lorem pulvinar. Integer eleifend velit non velit euismod scelerisque. Nunc lobortis ligula vestibulum vehicula pretium. Phasellus non mollis leo. Sed eu ligula dictum, porttitor lacus eget, pellentesque risus. Nam nisl mi, convallis in risus eget, venenatis sagittis arcu. Aliquam commodo aliquet blandit. In diam ex, congue quis odio vel, dignissim varius nulla. Ut vel faucibus massa. Integer laoreet felis ut nulla ornare, eget feugiat mauris tincidunt. Duis suscipit quis urna et mollis. Vestibulum lectus odio, venenatis pharetra magna vel, fringilla iaculis mauris. Aliquam sollicitudin ex et eros luctus, nec maximus arcu rhoncus. Nunc vel ante dui.')
  a.categories << cat1
  a.categories << cat2
  a.categories << cat3
end

Widget.create!(domain: segine, title:'A Propos', subtitle:'Entreprise familiale depuis plus de 40ans.', icon: 'fa-bookmark', url_text: 'En savoir plus', url: '#')
Widget.create!(domain: immo, title:'A Propos', subtitle:'Entreprise familiale depuis plus de 40ans.', icon: 'fa-bookmark', url_text: 'En savoir plus', url: '#')
Widget.create!(domain: segine, title:'Le guide de la transaction', subtitle:'Connaître les démarches dans l\'achat ou la vente d\'un bien', icon: 'fa-book', url_text: 'En savoir plus', url: '#')
Widget.create!(domain: immo, title:'Le guide de la transaction', subtitle:'Connaître les démarches dans l\'achat ou la vente d\'un bien', icon: 'fa-book', url_text: 'En savoir plus', url: '#')
Widget.create!(domain: segine, title:'Constitution de votre dossier', subtitle:'Nos conseillers vous accompagnent', icon: 'fa-star', url_text: 'En savoir plus', url: '#')
Widget.create!(domain: immo, title:'Constitution de votre dossier', subtitle:'Nos conseillers vous accompagnent', icon: 'fa-star', url_text: 'En savoir plus', url: '#')

FormMail.create!(code_form: 'GENERAL', email: 'test@test.fr', domain: segine)
FormMail.create!(code_form: 'NEWSLETTER', email: 'test@test.fr', domain: segine)
FormMail.create!(code_form: 'CONFIEZ-IMMEUBLE', email: 'test@test.fr', domain: segine)
FormMail.create!(code_form: 'CONFIEZ-GESTION-BIEN', email: 'test@test.fr', domain: segine)
FormMail.create!(code_form: 'CONFIEZ-VENTE-BIEN', email: 'test@test.fr', domain: segine)
FormMail.create!(code_form: 'RECRUTEMENT', email: 'test@test.fr', domain: segine)
FormMail.create!(code_form: 'GENERAL', email: 'test@test.fr', domain: immo)
FormMail.create!(code_form: 'NEWSLETTER', email: 'test@test.fr', domain: immo)
FormMail.create!(code_form: 'CONFIEZ-IMMEUBLE', email: 'test@test.fr', domain: immo)
FormMail.create!(code_form: 'CONFIEZ-GESTION-BIEN', email: 'test@test.fr', domain: immo)
FormMail.create!(code_form: 'CONFIEZ-VENTE-BIEN', email: 'test@test.fr', domain: immo)
FormMail.create!(code_form: 'RECRUTEMENT', email: 'test@test.fr', domain: immo)
