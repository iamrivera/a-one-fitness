Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :exercises
  
  resources :workouts do 
    resources :exercises 
  end
  # resources :trainers
  resources :users

  resources :users do
    resources :workouts 
  end

  post 'users/:id/workouts/:id/remove', to: 'workouts#remove', as: :remove_workout 

  #Basic Sessions Controller Setup (See Seesions Controllers Lab)
  get '/login', to: 'sessions#new', as: :login  

  get 'signup', to: 'users#new', as: :signup #this gives us path helper

  get '/logout', to: 'sessions#destroy', as: :logout 
  post '/logout', to: 'session#destroy'

  root to: "workouts#index", as: :home

  get '/auth/facebook/callback' => 'sessions#create' 
  
end
