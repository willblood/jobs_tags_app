class HomesController < ApplicationController
  
  def index
  end

  def jobs
    @jobs= Job.all
    @companies= Company.all
  end

end