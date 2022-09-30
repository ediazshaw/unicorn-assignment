Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_up: 'register'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "about", to: "pages#about"
  get "type", to: "pages#type"
  get "admins/new", to: "admins#new"
  get "admins/:id", to: "admins#show", :as => 'admin'
  post "admins", to: "admins#create"
  get "doctors", to: "doctors#index"
  get "doctors/new", to: "doctors#new"
  get "doctors/:id", to: "doctors#show", :as => 'doctor'
  get "doctors/:id/slots", to: "doctors#slots", :as => 'doctor_slots'
  post "doctors", to: "doctors#create"
  get "consultations", to: "consultations#index"
  get "consultations/:id", to: "consultations#show", :as => 'consultation'
  resources :patients, only: [:index, :show,:new, :create] do
    resources :consultations, only: [:new, :create]
  end
end
