Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  # Define routes for the User resource and nest other resources under it
  resources :users do
    # Nested routes for teachers
    resources :teachers do
      # Nested routes for appointments
      resources :appointments
      # Nested routes for availabilities
      resources :availabilities
    end  
    # Add more nested resources as needed
  end

  # Additional routes for accessing all teachers
  resources :teachers, only: [:index, :show]

  # Additional routes for accessing all appointments associated with a user
  get '/users/:user_id/appointments', to: 'appointments#index_for_user', as: 'user_appointments'

  # Defines the root path route ("/")
  # root "articles#index"
end
