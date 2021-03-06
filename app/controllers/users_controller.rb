class UsersController < ApplicationController
  before_action :find_user, only: %i[edit update show]
  before_action :same_user, only: %i[edit update]
  skip_before_action :require_user

  def new
    @user = User.new
  end

  def show; end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
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
    params.require(:user).permit(:name, :image, :bio)
  end

  def find_user
    @user = User.find(params[:id])
  end

  def same_user
    return unless current_user != @user

    flash[:danger] = 'You can only edit or your profile'
    redirect_to root_path
  end
end
