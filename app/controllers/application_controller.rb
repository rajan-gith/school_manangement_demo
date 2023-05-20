class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    respective_paths
  end
  
  def respective_paths
    if current_admin
      rails_admin_path
    elsif current_school_admin
      school_admins_batches_url
    else
      schools_path
    end
  end
end
