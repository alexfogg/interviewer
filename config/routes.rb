Interviewer::Application.routes.draw do
  root :to => 'interviews#index'
  resources :users, :only => [:index, :new, :create, :show]
  resources :interviews
  resources :questions

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
  get '/userchart' => 'users#userchart'

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

  resources :answers, :only => [:index] do
    collection do
      get 'new/:question_id', :action => :new, :as => :new
    end
  end



end
