Rails.application.routes.draw do
  mount ForestLiana::Engine => '/forest'
  root to: 'cocktails#index'
  resources :cocktails, only: [:show, :new, :create, :destroy] do
    resources :doses, only: [:new, :create]
  end
  resources :doses, only: [:destroy]
end
