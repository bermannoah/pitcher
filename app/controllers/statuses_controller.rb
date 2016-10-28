class StatusesController < ApplicationController
  before_action :set_status, only: [:show, :edit, :update, :destroy]
  
  def index
    @user = User.find(session[:user_id])
    @statuses = @user.collect_statuses(@user)
  end
  
  def new
    @status = Status.new()
  end
  
  def show
    @pitches = @status.pitches
  end
  
  def create
    @status = Status.new(status_params)
    if @status.save
      redirect_to status_path(@status)
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @status.update(status_params)
      redirect_to status_path(@status)
    else
      render :edit
    end
  end
  
  def destroy
    @status.delete
    redirect_to statuses_path
  end
  
  private 
  
  def set_status
    @status = Status.find(params[:id])
  end
  
  def status_params
    params.require(:status).permit(:title)
  end
end