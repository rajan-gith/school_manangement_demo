class SchoolAdmins::BaseController < ApplicationController
  skip_before_action :authenticate_student!, raise: false
  before_action :authenticate_school_admin!

end
