class SearchesController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  def index
    @searches = current_user.searches
  end

  def search
    @articles = Article.all
  end

  def create
    json_data = JSON.parse(request.body.read)
    search = current_user.searches.new(json_data)

    if search.save
      render json: search, status: :ok
    else
      render json: { success: false, errors: search.errors.full_message }
    end
  end
end
