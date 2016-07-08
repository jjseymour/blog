Rails.application.routes.draw do

  match "/404" => "errors#error404", via: [ :get, :post, :patch, :delete ]

  resources :messages

  get 'author', to: 'users#index'
  get 'favorites', to: 'users#favorites'
  get 'contact', to: 'users#contact'
  get 'home', to: 'home#home'

  resources :posts do
    resources :comments
  end

  root 'posts#index'

end
