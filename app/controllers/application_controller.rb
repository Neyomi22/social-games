class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_session_user 

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  private
  def set_session_user
    session[:user_id] = current_user.id if current_user
  end

end
