Rails.application.routes.draw do
  get 'audits/:uuid/:token/:step', to: 'audits#index', as: :audits_index
  post 'save/answers', to: 'audits#save_answers', as: :audits_save_answer
  get 'finish', to: 'audits#finish', as: :audits_finish

  resources :surveys do
    post :deliver
    get 'add/emails', to: 'surveys#add_emails'
    get 'export/answers', to: 'surveys#export_answers'
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
