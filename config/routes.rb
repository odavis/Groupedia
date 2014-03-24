Groupedia::Application.routes.draw do

  resources :charges, only: [:create, :new]
  resources :wikis do 
    resources :articles do 
    end
  end

  resources :collaborations, only: [:new, :create, :destroy]
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks"}
  resources :users
  
  root :to => "welcome#index"
  get "welcome/about"

end
