Interviewer::Application.routes.draw do
  root :to => 'home#index'
  resources :users, :only => [:index, :new, :create, :show]


  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
  get '/userchart' => 'users#userchart'

  get '/interviewchart' => 'interviews#interviewchart'

  resources :interviews do
    member do
      get 'analytics', :action => :analytics, :as => :analytics
      post 'purchase'
    end
    collection do
      get 'search'
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

  resources :answers, :only => [:index] do
    collection do
      get 'new/:question_id', :action => :new, :as => :new
      post '/:question_id', :action => :create, :as => :create
    end
  end

  resources :progresses, :only => [:index] do
    collection do
      post '/:interview_id',  :action => :create, :as => :create
      get '/passed_redirect/:progress_id', :action => :passed_redirect, :as => :passed_redirect
    end
  end



end
