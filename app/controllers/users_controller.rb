class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to users_path
    else
      flash[:errors] = user.error.full.messages
      render new_user
    end  
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      redirect_to users_path
    else
      render :text => user.errors.full_messages
    end
  end

  def destroy
    User.delete(params[:id])
    redirect_to users_path
  end

  private
    def user_params  #this method will return only what can be mass assigned!
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
end
