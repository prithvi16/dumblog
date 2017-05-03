Rails.application.routes.draw do




  get '/threads' , to: "threads#index"

  get '/settings' , to: "settings#index"
  post "/settings" => "settings#update"

  devise_for :users ,:controllers => { registrations:
'registrations' }
 resources :posts do
   resources :comments
   end
 root to: "posts#index"
  get '/:user' , to: "person#show"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
