class DeployedApplicationsController < ApplicationController

  def new
    @deployed_application.build_location
    @deployed_application.build_brigade
  end

  def create
    if @deployed_application.save
      redirect_to @deployed_application, notice: 'The application was deployed successfully!'
    else
      flash[:error] = 'The application could not be deployed'
      render :new
    end
  end

  def show
    @deployed_application = DeployedApplication.find(params[:id])
  end

  def index
    @filter_type = params[:filter_by]
    @deployed_applications = DeployedApplication.all
  end
end