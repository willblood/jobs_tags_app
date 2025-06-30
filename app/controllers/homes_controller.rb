class HomesController < ApplicationController
  
  def index
  end

  def jobs
    @jobs= Job.all
  end

end