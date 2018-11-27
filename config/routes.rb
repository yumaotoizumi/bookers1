Rails.application.routes.draw do
	root 'root#top'
	get '/top' => 'root#top'

	get '/about' => 'root#about'

  devise_for :users
  resources :users
  resources :users_images, only: [:new, :create, :index, :show ,:update]



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'books/new' => 'books#new'
post '/books' => 'books#create'

get '/books' => 'books#index'

get '/books/:id' => 'books#show' , as: 'book'

get '/books/:id/edit' => 'books#edit', as: 'edit_book'

 patch '/books/:id' => 'books#update', as: 'update_book'

 delete '/books/:id' => 'books#destroy', as: 'destroy_book'


end

