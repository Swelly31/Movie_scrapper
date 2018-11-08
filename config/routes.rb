Rails.application.routes.draw do

	root 'home#index'
	get '/show', to: "home#show"

	post '/', to: 'home#result'

	resources :home
	resources :startscrap

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
