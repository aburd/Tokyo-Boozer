Rails.application.routes.draw do

  resources :stores do
    resources :locations
  end

  root to: "pages#home"
  get 'test', to: "stores#test"

  resources :pages
  get 'home', to: 'pages#home'
  get 'reviews', to: 'pages#reviews'
  get 'areas', to: 'pages#areas'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  get 'map_page', to: 'pages#map_page'

end
