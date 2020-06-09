class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash.notice = "Account created succesfully welcome #{@user.name}"
      log_in @user
      redirect_to root_path
    else
      flash.now[:alert] = 'Please enter your name'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
