class SearchesController < ApplicationController
  include SearchesHelper
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  def index
    require 'date'
    words = filter_words(all_words!(Search.pluck(:sentence)))
    @keywords = top_5_repeated_keywords(words)
    @users_count = User.all.count
    @users_rate = compare(User.current_day.count, User.previous_day.count, "yesterday")
    @total_queries = Search.all.count
    @total_rate = compare(Search.current_week.count, Search.previous_week.count, "last week")
    @user_total_queries = current_user.searches.count
    @keyword_counts = Search.keyword_counts.take(5)
    if params[:search_date].present?
      selected_date = params[:search_date]
      @searches_date = current_user.searches.where('DATE(created_at) = ?',
                                                   selected_date).order('created_at DESC').take(10)
    else
      @searches_date = current_user.searches.order('created_at DESC').take(10)
    end
    @today_queries = Search.all.where('DATE(created_at) = ?', Date.today).count
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

  def destroy
    search = Search.find(params[:id])

    if search.user == current_user
      search.destroy
      redirect_to searches_path, notice: 'Search was successfully removed.'
    else
      redirect_to searches_path, alert: 'You are not authorized to remove this search.'
    end
  end

  private

  def compare(count_current, count_previous, compare_time)
    current_date_count = count_current
    previous_date_count = count_previous

    if previous_date_count > 0
      search_rate = ((current_date_count - previous_date_count).to_f / previous_date_count) * 100
    else
      search_rate = 0
    end

    comparison_data = {
      current_date_count: current_date_count,
      previous_date_count: previous_date_count,
      search_rate:,
      trend: search_rate.positive? ? 'increase' : (search_rate.negative? ? 'decrease' : 'no_change'),
      compare_time:
    }

    comparison_data
  end
end
