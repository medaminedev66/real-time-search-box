class SearchesController < ApplicationController
  include SearchesHelper
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  require 'date'
  require 'news-api'

  def index
    words = filter_words(all_words!(Search.pluck(:sentence)))
    @keywords = top_5_repeated_keywords(words)
    @keyword_counts = Search.keyword_counts.take(5)

    @users_rate = compare(User.current_month.count, User.previous_month.count, 'last month')
    @total_searches_rate = compare(Search.current_week.count, Search.previous_week.count, 'last week')
    @current_user_total_searches_rate = compare(current_user.searches.current_week.count, current_user.searches.previous_week.count, 'last week')
    @searches_rate = compare(Search.current_day.count, Search.previous_day.count, 'yesterday')

    @user_total_queries = current_user.searches.count
    @searches_date = searches_by_date(params[:search_date])

    @total_queries = Search.all.count
    @today_queries = Search.all.where('DATE(created_at) = ?', Date.today).count
    @users_count = User.all.count
  end

  def search
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

  def searches_by_date(selected_date)
    if selected_date.present?
      current_user.searches.where('DATE(created_at) = ?', selected_date).order('created_at DESC').take(10)
    else
      current_user.searches.order('created_at DESC').take(10)
    end
  end

  def compare(current_date_count, previous_date_count, compare_time)
    search_rate = previous_date_count.positive? ? ((current_date_count - previous_date_count).to_f / previous_date_count) * 100 : 0

    {
      current_date_count:,
      previous_date_count:,
      search_rate:,
      trend: search_rate.positive? ? 'increase' : (search_rate.negative? ? 'decrease' : 'no_change'),
      compare_time:
    }
  end
end
