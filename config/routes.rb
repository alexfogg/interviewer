Interviewer::Application.routes.draw do
  root :to => 'interviews#index'
  resources :users, :only => [:index, :new, :create, :show]
  resources :questions

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
  get '/userchart' => 'users#userchart'

   resources :interviews do
    collection do
      get 'search'
      get 'filter/:user_id', :action => :filter, :as => :filter
      get 'cost/:cost', :action => :cost, :as => :cost
    end
  end
end
