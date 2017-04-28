Rails.application.routes.draw do
  root to: 'homes#show', via: :get
  resources :exercises
  resource :workout, only: :show
  # get "/workout", to: "pages#workout"
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
