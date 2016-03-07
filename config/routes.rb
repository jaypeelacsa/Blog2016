Rails.application.routes.draw do
	  devise_for :users
	  devise_for :models
	  root to:"posts#index"
	  resources :categories


	  resources :posts do
		  resources :comments, module: "posts"
	  end

	  resources :comments
	 	resources :replies
	 
	get 'auth/:provider/callback', to: 'sessions#create'
	get 'logout', to: 'sessions#destroy'

  end
