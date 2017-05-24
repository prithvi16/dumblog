require 'subdomain'
require 'nosubdomain'
Rails.application.routes.draw do




  get 'home/index'

  constraints ( Subdomain ) do
  match '/' => 'person#show' , via: :get
	match  '/rss' ,to: "person#rss" ,as: :feed , via: :get
  get '/tags', to:"person#tag" ,as: :tag
  get    '/posts/:post_id/comments' , to: "comments#index" , as: :post_comments
	post    '/posts/:post_id/comments' , to: "comments#create"
  get    '/posts/:post_id/comments/new' , to: "comments#new" , as: :new_post_comment
	get    '/posts/:post_id/comments/:id/edit' , to: "comments#edit" , as: :edit_post_comment
	get    '/posts/:post_id/comments/:id'  , to: "comments#show" , as: :post_comment
  patch  '/posts/:post_id/comments/:id' , to: "comments#update"
  put  '/posts/:post_id/comments/:id' , to: "comments#update"
	delete  '/posts/:post_id/comments/:id' , to: "comments#destroy"
	get    '/posts/:id' , to: "posts#show" , as: :post

end




constraints ( Nosubdomain ) do
  get '/threads' , to: "threads#index" , as: :threads
  post '/posts' , to: "posts#create"
	get  '/posts/new' , to: "posts#new" , as: :new_post
	get  '/posts/:id/edit' , to: "posts#edit" , as: :edit_post

  patch '/posts/:id' , to: "posts#update"
	put '/posts/:id' , to: "posts#update"
  delete '/posts/:id' , to: "posts#destroy"
	get  '/posts' , to: "posts#index"




  get '/settings' , to: "settings#index"
  post "/settings" => "settings#update"
  devise_for :users ,:controllers => { registrations:
	'registrations' ,
  sessions: 'sessions'

}
	root to: "home#index"
  end



		# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
