class ApplicationController < ActionController::Base
  # before_action :redirect_users
  before_action :authenticate_student!

  def after_sign_in_path_for(resource)
    if current_admin
      rails_admin_path
    else
      root_path
    end
  end
end
