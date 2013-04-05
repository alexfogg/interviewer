Interviewer::Application.routes.draw do
  root :to => 'interviews#index'
  resources :users, :only => [:index, :new, :create, :show]
  resources :interviews

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
  get '/userchart' => 'users#userchart'
  
end
