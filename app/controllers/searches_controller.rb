class SearchesController < ApplicationController
  include SearchesHelper
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  def index
    @searches = current_user.searches.order('created_at DESC')
    # @keywords = all_keywords!()
    # @top_5_keywords = top_5_keywords(@keywords)
    @users_count = User.all.count
    @total_queries = Search.all.count
    @user_total_queries = current_user.searches.count
    @keyword_counts = Search.keyword_counts.take(5)
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
