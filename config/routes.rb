Rails.application.routes.draw do

  namespace 'home' do
    resources :cards
    resources :decks
  end

  namespace 'dashboard' do
    resources :users
    resources :sessions
  end

  get "dashboard/login" => "dashboard/sessions#new", :as => "dashboard/login"
  get "dashboard/logout" => "dashboard/sessions#destroy", :as => "dashboard/logout"
  get "dashboard/signup" => "dashboard/users#new", :as => "dashboard/signup"

  get 'home/welcome/index'
  post 'home/welcome/check' => 'home/welcome#check'
  
  get 'dashboard/oauths/oauth'
  get 'dashboard/oauths/callback'
  post "dashboard/oauth/callback" => "dashboard/oauths#callback"
  get "dashboard/oauth/:provider" => "dashboard/oauths#oauth", :as => :auth_at_provider

  get 'home/welcome/review' => 'home/welcome#review'
  root 'home/welcome#review'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
