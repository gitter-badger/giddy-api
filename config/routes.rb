Rails.application.routes.draw do

  root to: 'pages#home'

  # landing pages
  get 'pages/home'

  namespace :api do
    namespace :v1 do
      resources :activities
      resources :users do
        get :confirm_email, on: :member
      end
      post 'user_token', to: 'user_token#create'
    end
  end
end
