Blog::Application.routes.draw do
  
  devise_for :jedis

  resources :topics, :defaults => { :format => :html }
  match "topics(/tag/:tag)" => "topics#index", :as => :topics, :defaults => { :format => :html }
  match "topic/:slug" => "topics#show", :as => :topic, :defaults => { :format => :html }

  match "s/:slug" => "statics#show", :as => :static, :defaults => { :format => :html }

  namespace :editor do
    resources :topics
    resources :t_blogs
    resources :statics

    root :to => "title#index"
  end
  
  match "p/:page", :to => "topics#index", :defaults => { :format => :html }
  
  root :to => "topics#index", :page => 1, :defaults => { :format => :html }

  match "*a", :to => "inherited#response_404"
end
