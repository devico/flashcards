Rails.application.routes.draw do
  get "login" => "sessions#new", :as => "login"
  get "logout" => "sessions#destroy", :as => "logout"
  get "signup" => "users#new", :as => "signup"
  resources :users
  resources :sessions
  resources :cards
  get 'welcome/index'
  post 'welcome/check' => 'welcome#check'

  root 'welcome#review'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
