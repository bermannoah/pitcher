class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def new
    @user = User.new
  end
  
  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to login_path
    else 
      redirect_to '/signup'
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @user.update(user_edit_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end
  
  def destroy
    session.clear
    @user.destroy
    redirect_to "/"
  end
  
  
  private
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  def user_edit_params
    params.require(:user).permit(:name, :email)
  end
  
end