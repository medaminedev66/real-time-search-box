class DemoController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create_demo_user]

  def create_demo_user
    demo_user = User.find_by(email: "demo@test.com")

    if demo_user.present?
      sign_in(demo_user)
      redirect_to searches_search_path
    else
      flash[:alert] = 'Demo user not found.'
      redirect_to new_user_session_path
    end
  end
end
