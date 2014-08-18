BooksApp::Application.routes.draw do
  resources :users
  root :to => "pages#index"
  get "pages/index"
  get "/signup", to: "users#new"

end
