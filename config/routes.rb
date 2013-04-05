Interviewer::Application.routes.draw do
  root :to => 'interviews#index'
  resources :users, :only => [:index, :new, :create, :show]
  resources :questions

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
  get '/userchart' => 'users#userchart'
  get '/interviewchart' => 'interviews#interviewchart'
  
  resources :interviews do
    member do
      get 'analytics', :action => :analytics, :as => :analytics
    end
    
    collection do
      get 'filter/:user_id', :action => :filter, :as => :filter
      get 'cost/:cost', :action => :cost, :as => :cost
      end
    end

end
