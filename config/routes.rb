Rails.application.routes.draw do
  resources :surveys do
    post 'deliver'
    resources :survey_sections, except: [:index, :show]
  end
  resources :chapters
  resources :evaluations do
    resources :questions, except: [:index, :new] do
      resources :options, except: [:index, :new]
    end
  end
  devise_for :users

  authenticated(:user) do
    root 'pages#index', as: :authenticated_root
  end

  unauthenticated(:user) do
    root 'pages#landing_page'
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
