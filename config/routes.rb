Mtghub::Application.routes.draw do
  get 'register' => 'users#new', as: :register
  resources :users do
    resources :decks
  end
  resources :mtg_sets
  resources :cards

  delete 'logout' => 'sessions#destroy', as: :logout
  get 'login' => 'sessions#new', as: :login
  resources :sessions, only: [:new, :create, :destroy]

  root to: 'users#new'
end
