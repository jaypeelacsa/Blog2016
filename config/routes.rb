Rails.application.routes.draw do
  devise_for :users
	root to:"posts#index"
  resources :categories
	  
  resources :posts do
		resources :comments, module: 'posts' do
			resources :replies, module: 'comments'
		end
	end
		  
	get 'auth/:provider/callback', to: 'sessions#create'
	get 'logout', to: 'sessions#destroy'
end
