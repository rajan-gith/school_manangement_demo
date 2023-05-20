class Students::SchoolsController < ApplicationController
  before_action :authenticate_student!
  def index
    @schools = School.all
  end
  
  def batches
    @school = School.find(params[:id])
    @batches = @school.batches
  end
end
