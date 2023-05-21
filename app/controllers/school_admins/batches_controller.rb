class SchoolAdmins::BatchesController < SchoolAdmins::BaseController
  
  before_action :set_school
  before_action :set_batch, except: [:index, :new, :create]
  def index
    @batches = @school&.batches
  end
  
  def show
    @student_batches = @batch.student_batches
  end
  
  def approve
    mapping = @batch.student_batches.find_by(id: params[:student_batch_id])
    if mapping.approved!
      flash[:success] = "approved"
    else
      flash[:error] = "Could not approve"
    end
    redirect_to school_admins_batch_url(@batch.id)
  end

  def reject
    mapping = @batch.student_batches.find_by(id: params[:student_batch_id])
    if mapping.rejected!
      flash[:success] = "rejected"
    else
      flash[:error] = "Could not reject"
    end
    redirect_to school_admins_batch_url(@batch.id)
  end
  
  def new
    @batch = @school.batches.new()
  end
  
  def edit
  end
  
  def update
    if @batch.update(batch_params)
      flash[:success] = "saved"
    else
      flash[:error] = "Could not save"
    end
    redirect_to school_admins_batches_url
  end

  def create
    @batch = @school.batches.new(batch_params)
    if @batch.save
      flash[:success] = "saved"
    else
      flash[:error] = "Could not save"
    end
    redirect_to school_admins_batches_url
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

