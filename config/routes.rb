BooksApp::Application.routes.draw do
  get "admins/index", to: "admin/admins#index"
  root :to => "pages#index"
  get "pages/index"
  
end
