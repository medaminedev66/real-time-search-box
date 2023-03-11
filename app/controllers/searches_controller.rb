class SearchesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def search
    @articles = Article.all
  end

  def create
    json_data = JSON.parse(request.body.read)
    search = Search.new(json_data)

    if search.save
      render json: search, status: :ok
    else
      render json: { success: false, errors: search.errors.full_message }
    end
  end
end
