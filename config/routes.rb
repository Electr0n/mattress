MattressShop::Application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'

  root :to => 'home#index'
  get "home/index"

  match '/articles' => 'pages#articles'
  #match '/articles', :to => 'pages#articles'


  devise_for :users

  resources :mattresses, :only => [:index, :show]
  resources :product_series, :only => [] do
    resources :mattresses, :only => [:index, :show]
  end
  resources :manufacturers, :only => [] do
    resources :mattresses, :only => [:index, :show]
  end

  resources :pages, only: [:show]

  namespace :admin do
    root :to => 'mattresses#index'
    resources :product_series
    resources :manufacturers
    resources :mattresses
    resources :page_parts
    resources :bulk_price_changes, only: [:new, :create]
    resources :seos
  end

end
