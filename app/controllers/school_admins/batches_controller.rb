class SchoolAdmins::BatchesController < SchoolAdmins::BaseController
  
  before_action :set_school
  before_action :set_batch, except: [:index]
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

  private
  def set_school
    @school = current_school_admin.school
  end
  
  def set_batch
    @batch = @school&.batches.find(params[:id])
  end
end

