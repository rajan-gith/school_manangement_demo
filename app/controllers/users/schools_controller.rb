class Users::SchoolsController < ApplicationController
  before_action :authenticate_user!
  def index
    @schools = School.all
  end
  
  def batches
    @school = School.find(params[:id])
    @batches = @school.batches
  end
end
