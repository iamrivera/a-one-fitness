Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :exercises
  resources :workouts
  resources :trainers
  resources :users do
    resources :workouts 
  end

  get 'signup', to: 'users#new', as: :signup #this gives us path helper
  get 'login', to: 'sessions#new', as: :login 

  get 'logout', to: 'sessions#destroy', as: :logout 

  root to: "workouts#index", as: :home

end
