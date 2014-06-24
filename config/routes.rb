HackerNewsClone::Application.routes.draw do
  devise_for :user, :path => '', :path_names => { :sign_in => "sign_in", :sign_out => "sign_out", :sign_up => "register" }
  resources :user, only: [:show] do
    resources :posts
  end
  resources :posts, only: [:index]

  root to: "posts#index"
end
