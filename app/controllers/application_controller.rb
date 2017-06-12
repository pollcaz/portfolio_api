class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    #sign_in_url = new_user_session_url
    store_location_for(resource, profiles_path) || request.referer || root_path
  end
end
