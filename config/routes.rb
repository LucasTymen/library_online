Rails.application.routes.draw do

  scope "(:locale)", locale: /en|fr/ do
    resources :books
    root 'books#index'
  end


  get 'users/:username' => 'users#show' , as: :show_user
  resources :books do
  member do
      get 'buy'
      resources :comments
    end

    collection do
      get 'bestof'
    end
  end

  constraints(subdomain: /^admin$/) do
    scope module: 'admin' do
      resources :books
    end
  end

  namespace :api do
    scope module: 'admin' do
      resources :books
    end
  end


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

end
