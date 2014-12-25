AgentHistory::Application.routes.draw do
  resources :history,:only => :index

  resources :destroye_histories,:only => [:index,:show]

  resources :capture_histories,:only => [:index,:show]

  resources :deploy_histories,:only => [:index,:show]

  resources :link_histories,:only => [:index,:show]

  resources :agents,:only => [:index,:show]

  resources :portals,:only => [:index,:show]

  resources :snippets
  mount Resque::Server, :at => "/resque"
  require 'resque-history/server'

  root :to => "history#index"
end
