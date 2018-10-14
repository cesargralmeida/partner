Rails.application.routes.draw do
  devise_for :partners
  resources :partners do
    collection do
      post :register
    end
  end
  resources :requests, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
