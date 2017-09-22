Rails.application.routes.draw do
	scope "(:locale)", locale: /en|vi/ do
    root to: "static_pages#home"
    get "/help", to: "static_pages#help"
    get "/about", to: "static_pages#about"
    get "/contact", to: "static_pages#contact"
    get "/signup", to: "users#new"
    get "/users", to: "users#index"
    post "/users", to: "users#create"
    get "/users/:id", to: "users#show"
  end
end
