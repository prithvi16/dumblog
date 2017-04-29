Rails.application.routes.draw do



  get 'settings/edit'

  get 'settings/update'

  get '/settings' , to: "settings#index"
  post "/settings" => "settings#update"

  devise_for :users ,:controllers => { registrations:
'registrations' }
 resources :posts
 root to: "posts#index"
  get '/:user' , to: "person#show"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
