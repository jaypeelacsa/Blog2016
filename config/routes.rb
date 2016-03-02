Rails.application.routes.draw do
	  devise_for :users
	  devise_for :models
	  root to:"posts#index"
	  resources :categories


	  resources :posts do
		resources :comments, module: 'post'
	  end

	  resources :comments do
	 	resources :replies
	  end


	  
	  get 'auth/:provider/callback', to: 'sessions#create'
	get 'logout', to: 'sessions#destroy'

  end
