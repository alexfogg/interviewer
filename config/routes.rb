Interviewer::Application.routes.draw do
  root :to => 'interviews#index'
  resources :users, :only => [:index, :new, :create, :show]

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  resources :users do
    collection do
      get 'userchart'
    end
  end

  resources :interviews do
    collection do
      get 'filter/:user_id', :action => :filter, :as => :filter
      get 'cost/:cost', :action => :cost, :as => :cost
    end
  end

  resources :questions, :only => [:index, :show] do
    collection do
      get 'new/:interview_id', :action => :new, :as => :new
      post '/:interview_id', :action => :create, :as => :create
    end
  end


end
