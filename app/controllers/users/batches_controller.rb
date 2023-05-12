class Users::BatchesController < ApplicationController
  before_action :find_batch, except: [:index]
  def index
    @batches = Batch.all
  end

  def show
    @batch = Batch.find(params[:id])
  end
  
  def apply
    render :show
  end
  
  private 
  
  def find_batch
    @batch = Batch.find(params[:id])
  end
end
