class HomesController < ApplicationController
  def index
    redirect_to respective_paths
  end
end
