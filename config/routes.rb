BooksApp::Application.routes.draw do
  resources :users
  get "admins/index", to: "admin/admins#index"
  root :to => "pages#index"
  get "pages/index"
  get "/signup", to: "users#new"

end
