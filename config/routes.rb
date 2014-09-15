BooksApp::Application.routes.draw do

  resources :users, only: [ :update, :create, :show ]
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

end
