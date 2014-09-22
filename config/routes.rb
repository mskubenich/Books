BooksApp::Application.routes.draw do

  get "password_resets/new"
  resources :users, only: [ :update, :create, :show ]
  get "admins/index", to: "admin/admins#index"
  root :to => "pages#index"
  get "pages/index"
  get "/signup", to: "users#new"
  get "/edit_profile", to: "users#edit"
  get "/profile", to: "users#show"
  resources :sessions, only: [:new, :create, :destroy]
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  namespace :admin do
    resources :users, only: [ :index ]
    resources :statistics, only: [ :index ]
  end  

  get '/auth/:service/callback', to: 'services#create'
  resources :services, only: [:index, :create, :destroy]

  resources :password_resets, only: [:new, :create, :edit, :update]
end
