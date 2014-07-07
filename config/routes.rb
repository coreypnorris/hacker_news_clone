HackerNewsClone::Application.routes.draw do
  devise_for :user, :path => '', :path_names => { :sign_in => "sign_in", :sign_out => "sign_out", :sign_up => "register" }
  resources :users, :path => '', only: [:show] do
    resources :posts
    resources :comments, only: [:index]
  end
  resources :posts, only: [:index, :show] do
    resources :votes, only: [:new, :create]
    resources :comments, only: [:create]
  end

  resources :comments, only: [:new, :create, :show] do
    resources :votes, only: [:new, :create]
    resources :comments, only: [:new, :create]
  end

  root to: "posts#index"
  match ":username", :to => "users#show", :via => :get
end
