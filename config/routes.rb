Rails.application.routes.draw do
  get 'availabilities/index'
  get 'availabilities/show'
  get 'availabilities/new'
  get 'availabilities/create'
  get 'availabilities/edit'
  get 'availabilities/update'
  get 'availabilities/destroy'
  get 'appointments/index'
  get 'appointments/show'
  get 'appointments/new'
  get 'appointments/create'
  get 'appointments/edit'
  get 'appointments/update'
  get 'appointments/destroy'
  get 'teachers/index'
  get 'teachers/show'
  get 'teachers/new'
  get 'teachers/create'
  get 'teachers/edit'
  get 'teachers/update'
  get 'teachers/destroy'
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/create'
  get 'users/edit'
  get 'users/update'
  get 'users/destroy'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
