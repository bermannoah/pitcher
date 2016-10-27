class PitchesController < ApplicationController
  
  before_action :security_redirect
  before_action :authorize
  
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
  
  private
  
  def set_user
    @user = User.find(params[:user_id])
  end
  
  def pitch_params
    params.require(:pitch).permit(:title, :content, :user_id)
  end
  
  def security_redirect
    if params[:user_id].nil?
      redirect_to login_path
    end
  end
  
end