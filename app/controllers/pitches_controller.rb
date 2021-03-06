class PitchesController < ApplicationController
  before_action :security_redirect
  before_action :authorize
  before_action :set_user
  
  def index
    @user = User.find(params[:user_id])
    @pitches = @user.pitches
  end
  
  def new
    @pitch = Pitch.new()
  end
  
  def create
    @pitch = @user.pitches.new(pitch_params)
    if @pitch.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end
  
  def edit
    @pitch = Pitch.find(params[:id])
  end
  
  def update
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
    params.require(:pitch).permit(:title, :content, :user_id)
  end
  
  def pitch_edit_params
    params.require(:pitch).permit(:title, :content)
  end

  
  def security_redirect
    if session[:user_id].nil?
      redirect_to login_path
    end
  end
  
end