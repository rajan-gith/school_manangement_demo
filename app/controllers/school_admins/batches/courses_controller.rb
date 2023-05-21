class SchoolAdmins::Batches::CoursesController < SchoolAdmins::BaseController
  
  before_action :set_school
  before_action :set_batch
  before_action :set_course, only: [:show, :edit, :new]
  def index
    @courses = @.batches
  end
  
  def show
    @student_batches = @batch.student_batches
  end
  
  def edit
  end
  
  def new
  end

  def create
  end

  private
  def batch_params
    params.require(:batch).permit(:name)
  end

  def set_school
    @school = current_school_admin.school
  end
  
  def set_batch
    @batch = @school&.batches.find(params[:id])
  end
end

