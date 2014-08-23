BooksApp::Application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  get "admins/index", to: "admin/admins#index"
  root :to => "pages#index"
  get "pages/index"
 

end
