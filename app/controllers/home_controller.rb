class HomeController < ApplicationController
  def index
    unless current_user.present?
      redirect_to new_user_session_path
    else
      redirect_to photos_path
    end
  end
end
