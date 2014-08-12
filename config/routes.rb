BooksApp::Application.routes.draw do
  root :to => "pages#index"
  get "pages/index"
  
end
