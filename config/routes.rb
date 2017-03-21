Rails.application.routes.draw do
  get 'workouts/index'

  get 'workouts/new'

  get 'workouts/create'

  get 'workouts/edit'

  get 'workouts/update'

  get 'workouts/destroy'

  get 'workouts/show'

  get 'workout/show'

    get "/workout", to: "pages#workout"


 resources :exercises

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
