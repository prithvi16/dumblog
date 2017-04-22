Rails.application.routes.draw do
  get 'person/show'

  devise_for :users ,:controllers => { registrations:
'registrations' }
 resources :posts
 root to: "posts#index"
  get '/:user' , to: "person#show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
