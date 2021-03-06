Rails.application.routes.draw do
  get 'lessons/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    get "/home", to: "static_pages#home"
    get "/about", to: "static_pages#about"
    get "/help", to: "static_pages#help"
    get "/news", to: "static_pages#news"
    get "/signup", to: "users#new"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    resources :users
    resources :user_follows, only: %i[create destroy]
    resources :courses do
      resources :lessons, shallow: true
    end
    resources :words, only: %i[index edit update delete destroy] do
      collection { post :import }
    end
  end
end
