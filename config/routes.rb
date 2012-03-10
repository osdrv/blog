Blog::Application.routes.draw do
  
  devise_for :jedis

  resources :topics
  match "topics(/tag/:tag)" => "topics#index", :as => :topics
  match "topic/:slug" => "topics#show", :as => :topic

  namespace :editor do
    resources :topics
    resources :t_blogs

    root :to => "title#index"
  end

  root :to => "topics#index"

end
