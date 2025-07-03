class CompaniesController < ApplicationController

  before_action :set_company , only: [:edit, :update, :show]
  before_action :check_company_authorization, only: [:edit, :update]

  def index
    @jobs= Job.all
  end

  def new;end

  #Create
  def create
    @company= Company.new(create_params)
    if @company.save
      flash[:success]= "Company created Successfully !"
      redirect_to root_path
    else
      flash.now[:error]="Failed to create company !"
    end
  end

  #Update
  def edit
    @company
    @followers= @company.followers
  end

  def update
    if  @company.update(update_params)
      flash[:success]="Updated Successfully !"
      redirect_to edit_company_path(@company)
    else      
      flash.now[:error]= "Update Failed !"
      redirect_to edit_company_path(@company)
    end

  end

  #show
  def show
    @company
    # @followers= @company.followers
  end

  private
  def create_params
    params.permit(:email,:company_name, :password, :password_confirmation, :industry, :description, :logo)
  end

  def update_params
    params.require(:company).permit(:email,:company_name,:industry, :description, :logo)
  end

  def set_company
    @company= Company.find(params[:id])
  end

  def check_company_authorization
    authorize_company(set_company)
  end

end