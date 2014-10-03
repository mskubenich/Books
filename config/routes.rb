BooksApp::Application.routes.draw do

  resources :users, only: [ :update, :create, :show ] do 
    collection do
      get :confirm
    end
  end
  root :to => "pages#index"
  get "pages/index"
  get "/signup", to: "users#new"
  get "/edit_profile", to: "users#edit"
  get "/profile", to: "users#show"
  resources :sessions, only: [:new, :create, :destroy]
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'

  match '/auth/:service/callback', to: 'services#create', via: 'get'
  namespace :admin do
    resources :users, only: [ :index ]
    resources :statistics, only: [ :index ]
  end 
  resources :services, only: [:index, :create, :destroy]

  resources :password_resets
  resources :books, only: [:index]
end
