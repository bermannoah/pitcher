class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def new
    @user = User.new
    @hide_password_entry_form = false
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
    @hide_password_entry_form = true
  end
  
  def update
    if @user.update(user_edit_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
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