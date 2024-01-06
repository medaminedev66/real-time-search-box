Rails.application.routes.draw do
  devise_for :users
  root 'searches#search'
  get 'searches/search'
  get '/searches', to: 'searches#index'
  post '/save_search', to: 'searches#create', defaults: { format: :json }
end
