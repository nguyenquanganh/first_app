Rails.application.routes.draw do
  root "static_pages#home"
  get "static_pages/home"
  get "static_pages/help"
  get "static_pages/about"
  scope "(:locale)", locale: /en|vi/ do
    root to: "static_pages#home"
  end
end
