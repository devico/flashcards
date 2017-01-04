Rails.application.routes.draw do

  scope path: "/:locale" do
    resources :users
    resources :sessions
    resources :cards
    resources :decks
  end

  get "login" => "sessions#new", :as => "login"
  get "logout" => "sessions#destroy", :as => "logout"
  get "signup" => "users#new", :as => "signup"

  get 'welcome/index'
  post 'welcome/check' => 'welcome#check'
  
  get 'oauths/oauth'
  get 'oauths/callback'
  post "oauth/callback" => "oauths#callback"
  get "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider

  root 'welcome#review'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
