class ApplicationController < ActionController::Base
  include Devise::Controllers::Helpers
  before_action :authenticate_user!, unless: :landing_page_controller?
  helper_method :current_page?

  def landing_page_controller?
    controller_name == 'landing_pages'
  end

  def current_page?(path)
    request.path == path
  end

  protected

  def after_sign_in_path_for(resource)
    if resource.is_a?(User)
      searches_search_path(resource)
    else
      super
    end
  end

  def after_sign_up_path_for(resource)
    if resource.is_a?(User)
      searches_search_path(resource)
    else
      super
    end
  end
end
