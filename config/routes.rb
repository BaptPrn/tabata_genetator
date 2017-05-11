Rails.application.routes.draw do
  root to: 'homes#show', via: :get
  resources :exercises
  resource :workout, only: :show
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
end
