class PitchesController < ApplicationController
  before_action :security_redirect
  before_action :authorize
  before_action :set_user
  
  def index
    @user = User.find(params[:user_id])
    @pitches = @user.pitches
  end
  
  def show
    @pitch = Pitch.find(params[:id])
  end
  
  def new
    @pitch = Pitch.new()
    @status_options = Status.all.map{ |c| [c.title, c.id] }
  end
  
  def create
    @status_options = Status.all.map{ |c| [c.title, c.id] }
    @pitch = @user.pitches.new(pitch_params)
    if @pitch.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end
  
  def edit
    @status_options = Status.all.map{ |c| [c.title, c.id] }
    @pitch = Pitch.find(params[:id])
  end
  
  def update
    @status_options = Status.all.map{ |c| [c.title, c.id] }
    @pitch = @user.pitches.find(params[:id])
    if @pitch.update(pitch_edit_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end
  
  def destroy
    @pitch = @user.pitches.find(params[:id])
    @pitch.destroy
    redirect_to user_path(@user)
  end
  
  private
  
  def set_user
    @user = User.find(session[:user_id])
  end
  
  def pitch_params
    params.require(:pitch).permit(:title, :content, :user_id, :status_id)
  end
  
  def pitch_edit_params
    params.require(:pitch).permit(:title, :content, :status_id)
  end

  
  def security_redirect
    if session[:user_id].nil?
      redirect_to login_path
    end
  end
  
end