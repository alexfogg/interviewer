Interviewer::Application.routes.draw do
  root :to => 'home#index'
  resources :users, :only => [:index, :new, :create, :show]

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  resources :users
  resources :interviews
  resources :questions

end
