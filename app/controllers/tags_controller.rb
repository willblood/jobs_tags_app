class TagsController < ApplicationController

  def create
    authorize_company(set_job.company)
    @tag= Tag.new(create_params)
    if @tag.save
      flash[:success]= "Tag Created !"
    else
      flash.now[:error]= "Failed to crete tag !"
    end
  end

  def destroy
    authorize_company(set_job.company)
    if set_job.destroy
      flash[:success]= "Destroyed !"
    else
      flash.now[:error]= "Failed to destroy"
    end
  end

  def create_params
    params.permit(:title)
  end

  def set_job
    @job= Job.find(params[:job_id])
  end

end