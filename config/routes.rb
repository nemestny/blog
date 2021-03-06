Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :posts#, only: [:index, :show]
  get 'home(/:hello)', to: 'home#index' # скобки обозначают необязательность
  root 'home#index'
  get 'about', to:'home#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
