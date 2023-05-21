class SchoolAdmins::Batches::CoursesController < SchoolAdmins::BaseController
  
  before_action :set_school
  before_action :set_batch
  before_action :set_course, only: [:show, :edit, :update]
  def index
    @courses = @batch.courses
  end
  
  def show
  end
  
  def edit
  end
  
  def new
    @course = @batch.courses.new()
  end

  def create
    @course = @batch.courses.create(course_params)
    redirect_to school_admins_batches_courses_path
  end

  private
  def course_params
    params.require(:course).permit(:name)
  end

  def set_school
    @school = current_school_admin.school
  end
  
  def set_course
    @course = @batch.courses.find(params[:batch_id])
  end
  
  def set_batch
    @batch = @school&.batches.find(params[:id])
  end
end

