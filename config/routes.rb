Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_up: 'register'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "about", to: "pages#about"
  get "type", to: "pages#type"
  # get "doctors", to: "doctors#index"
  # get "doctors/new", to: "doctors#new"
  # get "doctors/:id", to: "doctors#show", :as => 'doctor'
  # get "doctors/:id/consult", to: "doctors#consult", :as => 'consult'
  # post "doctors", to: "doctors#create"
  # get "patients", to: "patients#index"
  # get "patients/new", to: "patients#new"
  # get "patients/:id", to: "patients#show", :as => 'patient'
  # post "patients", to: "patients#create"
  # get "consultations", to: "consultations#index"
  # get "consultations/new", to: "consultations#new"
  # get "consultations/:id", to: "consultations#show", :as => 'consultation'
  # post "consultations", to: "consultations#create"
  get "consultations", to: "consultations#index"
  get "consultations/:id", to: "consultations#show", :as => 'consultation'
  resources :patients, only: [:index, :show,:new, :create] do
    resources :doctors, only: [:index, :show,:new, :create] do
      resources :consultations, only: [:new, :create]
    end
  end
end
