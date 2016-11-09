Rails.application.routes.draw do
  resources :cards
  get 'welcome/index'
  post 'cards/check_card'

  root 'cards#review'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
