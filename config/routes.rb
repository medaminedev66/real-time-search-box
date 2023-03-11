Rails.application.routes.draw do
  get 'searches/search'

  post '/save_search', to: 'searches#create', defaults: {format: :json}
end
