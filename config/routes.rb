Rails.application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'

  get 'sessions/new'

  root 'static_pages#home' # => root_path
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/constitution',   to: 'static_pages#constitution'
  get  '/civil_law',   to: 'static_pages#civil_law'
  get  '/criminal_law',   to: 'static_pages#criminal_law'
  get  '/civil_procedure_law',   to: 'static_pages#civil_procedure_law'
  get  '/criminal_procedure_law',   to: 'static_pages#criminal_procedure_law'
  get  '/administrative_law',   to: 'static_pages#administrative_law'
  get  '/commercial_law',   to: 'static_pages#commercial_law'

  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users do
    member do
      # /users/:id/ ...
      get :following, :followers
      # GET /users/1/following => following action
      # GET /users/1/followers => followers action
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
end
