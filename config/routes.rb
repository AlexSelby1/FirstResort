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
    resources :reviews, only: [:new, :create]
 end
   
   resources :jobs

   resources :reviews, except: [:index]

   resources :conversations do
    resources :messages
  end


  root 'static_pages#home'

  get '/home' => 'static_pages#home'
  get '/jobs' => 'jobs#index'

  get '/users/:id', to: 'users#show'

  get '/contacts/new' => 'contacts#new'
  get '/contacts' => 'contacts#create'

  get 'category/:title', to: 'static_pages#category'

  post '/search' => 'jobs#search'

  

end
