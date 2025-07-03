class HomesController < ApplicationController
  
  def index
  end

  def jobs
    @jobs= Job.order("created_at DESC")
    @companies= Company.all
  end

end