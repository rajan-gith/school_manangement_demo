class ApplicationController < ActionController::Base
  before_action :redirect_users
  before_action :authenticate_user!

  def redirect_users
    if current_admin
      redirect_to rails_admin_path
    end
  end
end
