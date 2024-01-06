class ApplicationController < ActionController::Base
  include Devise::Controllers::Helpers
  helper_method :current_page?

  def current_page?(path)
    request.path == path
  end
end
