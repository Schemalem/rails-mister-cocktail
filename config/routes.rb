Rails.application.routes.draw do
  resources :cocktails, only: [ :index, :show, :new, :create ] do
    resources :doses, only: [ :new, :create ]
  end
  resources :doses, only: [ :destroy ]
  # delete "doses/:id", to: 'doses#destroy'
  root to: 'cocktails#index'
end
