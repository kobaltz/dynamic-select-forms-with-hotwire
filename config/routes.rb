Rails.application.routes.draw do
  resources :processors
  resources :generations, only: [:index]
  root to: 'welcome#index'
end
