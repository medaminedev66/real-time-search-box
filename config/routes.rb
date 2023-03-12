Rails.application.routes.draw do
  get 'searches/search'
  get '/searches', to: 'searches#index'

  post '/save_search', to: 'searches#create', defaults: {format: :json}
end
