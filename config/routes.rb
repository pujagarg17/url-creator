Rails.application.routes.draw do
  get '/stats', to: 'stats#index'
  resources :urls, param: :slug
  root :to => 'urls#new'
  get '/:slug', to: 'urls#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
