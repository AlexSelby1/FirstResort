Rails.application.routes.draw do

  
  resources :categories
 # devise_for :users

  devise_for :users, controllers: {
    registrations: 'registrations',
    confirmations: 'confirmations'
   }

   resources :users
   resources :job_applications

  root 'static_pages#home'

  get '/home' => 'static_pages#home'
  get '/jobs' => 'job_applications#index'

  get '/users/:id', to: 'users#show'

  get '/contacts/new' => 'contacts#new'
  get '/contacts' => 'contacts#create'

  get 'category/:title', to: 'static_pages#category'

  post '/search' => 'job_applications#search'

end
