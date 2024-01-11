class SearchesController < ApplicationController
  include SearchesHelper
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  def index
    @searches = current_user.searches.order('created_at DESC').take(10)
    words = filter_words(all_words!(Search.pluck(:sentence)))
    @keywords = top_5_repeated_keywords(words)
    @users_count = User.all.count
    @total_queries = Search.all.count
    @user_total_queries = current_user.searches.count
    @keyword_counts = Search.keyword_counts.take(5)
  end

  def search
    require 'news-api'
    newsapi = News.new("975ec4bd3d464983a4f95d3e6454308c")
    @articles = newsapi.get_everything(q: "ruby on rails", from: "2023-12-15&to=2024-01-05", sortBy: "popularity", language: 'en')
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
