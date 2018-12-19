Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # USERS & ADMINISTRATION
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # FROALA (WYSIWYG)
  post '/froala_upload' => 'froala#upload'
  post '/froala_manage' => 'froala#manage'
  delete '/froala_delete' => 'froala#delete'

  # HOME / root
  root to: 'home#index'

  # NEWSLETTER
  post '/inscription-newsletter' => 'home#newsletter_subscription', as: 'newsletter_subscription'

  get '/:token/confirm_email/', :to => "home#confirm_email", as: 'confirm_email'
   

  # CONTACT
  get '/contact' => 'contacts#new'
  get '/confiez-nous-votre-immeuble' => 'contacts#new'
  get '/confiez-nous-la-gestion-de-votre-bien' => 'contacts#new'
  get '/confiez-nous-la-vente-de-votre-bien' => 'contacts#new'
  get '/deposer-ma-candidature' => 'contacts#new'
  post '/contact' => 'contacts#create'
  post '/confiez-nous-votre-immeuble' => 'contacts#create'
  post '/confiez-nous-la-gestion-de-votre-bien' => 'contacts#create'
  post '/confiez-nous-la-vente-de-votre-bien' => 'contacts#create'
  post '/deposer-ma-candidature' => 'contacts#create'
  get '/contact/succes' => 'contacts#success', as: 'contact_success'
  # ARTICLES
  resources :articles, only: [:show, :index], path: 'actualites'

  # PROPERTIES
  get '/:properties' => 'properties#index', as: 'properties', constraints: { properties:/(biens-a-vendre|biens-a-louer)/ }
  post '/:properties/query' => 'properties#query', as: 'properties_query', constraints: { properties:/(biens-a-vendre|biens-a-louer)/ }
  get '/:properties/ref-:id' => 'properties#show', as: 'property', constraints: { properties:/(biens-a-vendre|biens-a-louer)/ }
  post '/:properties/ref-:id' => 'properties#contact_property_create', constraints: { properties:/(biens-a-vendre|biens-a-louer)/ }

  # PAGE
  get '/:id' => 'pages#show', as: 'page'
end
