Mtghub::Application.routes.draw do
  get 'register' => 'users#new', as: :register

  resources :users do
    resources :decks do
      get 'comments'
    end
  end

  resources :decks do
    resources :suggestions
    resources :comments, only: :create
    resources :stars
  end

  resources :suggestions do
    resources :comments, only: :create
  end

  resources :comments

  resources :mtg_sets
  resources :cards
  resources :forks

  delete 'logout' => 'sessions#destroy', as: :logout
  get 'login' => 'sessions#new', as: :login
  resources :sessions, only: [:new, :create, :destroy]

  root to: 'users#new'
end
