Rails.application.routes.draw do
  resources :shields
  resources :weapons
  resources :armor
  resources :armor_bases
  resources :items
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
