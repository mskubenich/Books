BooksApp::Application.routes.draw do
  get "users/new"
  root :to => "pages#index"
  get "pages/index"
  get "/signup", to: "users#new"
  
end
