class SearchesController < ApplicationController
  include SearchesHelper
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  def index
    words = filter_words(all_words!(Search.pluck(:sentence)))
    @keywords = top_5_repeated_keywords(words)
    @users_count = User.all.count
    @total_queries = Search.all.count
    @user_total_queries = current_user.searches.count
    @keyword_counts = Search.keyword_counts.take(5)
    if params[:search_date].present?
      selected_date = params[:search_date]
      @searches_date = current_user.searches.where('DATE(created_at) = ?',
                                                   selected_date).order('created_at DESC').take(10)
    else
      @searches_date = current_user.searches.order('created_at DESC').take(10)
    end
  end

  def search
    require 'news-api'
    require 'date'
    one_month_ago = Date.today.prev_month
    yesterday = Date.today - 1
    newsapi = News.new('975ec4bd3d464983a4f95d3e6454308c')
    @articles = newsapi.get_everything(q: 'ruby on rails', from: `#{one_month_ago}&to=#{yesterday}`,
                                       sortBy: 'popularity', language: 'en')
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

  def find_searches; end
end
