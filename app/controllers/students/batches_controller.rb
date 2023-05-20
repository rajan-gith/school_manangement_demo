class Students::BatchesController < ApplicationController
  before_action :find_batch, except: [:index]
  def index
    @batches = Batch.all
  end

  def show
    @student_batch = @batch.student_batches.find_by(student_id: current_student.id)
    @fellow_student_batches = StudentBatch.all.joins(:student).where(batch_id: @student_batch&.batch_id, status: StudentBatch.statuses[:approved]).includes(:student)
  end
  
  def apply
    mapping = @batch.student_batches.find_or_initialize_by(student_id: current_student.id)
    if mapping.save
      flash[:success] = "Raised Request to enrollment"
    else
      flash[:error] = "Could not raise Request"
    end
    redirect_to batch_url
  end
  
  private 
  
  def find_batch
    @batch = Batch.find(params[:id])
  end
end
