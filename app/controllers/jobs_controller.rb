class JobsController < ApplicationController
  before_action :set_company
  before_action :set_job  , only: [:edit, :update, :show, :destroy]
  before_action :check_company_authorization, only: [:edit, :update, :destroy]

  def index
    @jobs= @company.jobs

  end

  def new;end

  def create
    @job= @company.jobs.build(create_params)
    if @job.save
      flash[:success]= "Job created successfully"
      redirect_to company_jobs_path
    else
      flash.now[:error]= "Failed to create Job"
      redirect_to company_jobs_path
    end
  end

  def edit
    @job
  end

  def update
    if @job.update(update_params)
      flash[:success]= "Updated successfully !"
      redirect_to company_jobs_path
    else
      flash.now[:error]= "Failed to update job !"
      redirect_to edit_company_job_path
    end
  end

  def show
    @jobs
  end

  def destroy
    if @job.destroy
      flash[:success]= "Job deleted !"
      redirect_to company_jobs_path(@company)
    else
      flash.now[:error]= "Failed to delete job !"
      redirect_to company_jobs_path
    end
  end
  
  private
  def create_params
    params.permit(:title,:description,:location)
  end
  def update_params
    params.require(:job).permit(:title,:description,:location)
  end
  def set_company
    @company= Company.find(params[:company_id])
  end

  def set_job
    @job= Job.find(params[:id])
  end
  def check_company_authorization
    authorize_company(set_company)
  end
end