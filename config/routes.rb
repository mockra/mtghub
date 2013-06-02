Mtghub::Application.routes.draw do
  get 'register' => 'users#new', as: :register
  resources :users do
    resources :decks
  end
  resources :decks do
    resources :suggestions
  end
  resources :mtg_sets
  resources :cards
  resources :forks

  delete 'logout' => 'sessions#destroy', as: :logout
  get 'login' => 'sessions#new', as: :login
  resources :sessions, only: [:new, :create, :destroy]

  root to: 'users#new'
end
