class Students::SchoolsController < ApplicationController
  before_action :authenticate_student!
  def index
    @schools = School.all.paginate(page: (params[:page]||1), per_page: PER_PAGE)
  end
  
  def batches
    @school = School.find(params[:id])
    @batches = @school.batches.paginate(page: (params[:page]||1), per_page: PER_PAGE)
  end
end
