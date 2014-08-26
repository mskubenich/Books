BooksApp::Application.routes.draw do
  resources :users, only: [ :update, :create, :show ]
  get "admins/index", to: "admin/admins#index"
  root :to => "pages#index"
  get "pages/index"
  get "/signup", to: "users#new"
  get "/edit_profile", to: "users#edit"
end
