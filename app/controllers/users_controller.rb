class UsersController < ApplicationController
  def new
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
end
