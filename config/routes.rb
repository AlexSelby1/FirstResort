Rails.application.routes.draw do
  resources :categories

  devise_for :users, controllers: {
      registrations: 'registrations',
    confirmations: 'confirmations'
  }
  devise_scope :user do
    post 'users/sign_up', to: 'devise/registrations#create'
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

   resources :users do
    resources :reviews, only: [:new, :create, :edit]
 end
   

   resources :jobs do
    resources :job_applications, only: [:create, :destroy, :index] do
      get '/jobs/:job_id/job_applications?:recipient_id&sender_id' => 'job_applications#create'
    member do
    post :toggle_accept
    end
  end
  end

   resources :reviews, except: [:index]

   resources :conversations do
    resources :messages
  end

  root 'static_pages#home'

  get '/home' => 'static_pages#home'
  get '/jobs' => 'jobs#index'

  get '/users/:id', to: 'users#show'
  get '/candidates', to: 'users#showCandidate'

  get '/jobs/:id/job_applications/:id' => 'job_applications#destroy'

  get '/contacts/new' => 'contacts#new'
  post '/contacts' => 'contacts#create'

  get 'category/:title', to: 'static_pages#category'

  post '/jobs/search' => 'jobs#search'
  post '/candidates/search' => 'users#search'
  
  get '/jobs/:job_id/job_applications/:id/toggle_accept' => 'job_applications#toggle_accept'
  
end
