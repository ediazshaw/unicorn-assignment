Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_up: 'register'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "about", to: "pages#about"
  get "type", to: "pages#type"
  get "doctors", to: "doctors#index"
  get "doctors/new", to: "doctors#new"
  get "doctors/:id", to: "doctors#show", :as => 'doctor'
  post "doctors", to: "doctors#create"
end