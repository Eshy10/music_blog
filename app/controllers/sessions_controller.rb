class SessionsController < ApplicationController
  skip_before_action :require_user
  def new; end

  def create
    if session_params.blank?
      render 'new'
      flash.notice = 'Please enter your name'
    else
      user = User.find_by(session_params)
      if user.present?
        session[:user_id] = user.id
        redirect_to root_url, notice: 'Logged in!'
      else
        flash.now[:alert] = 'sign up before you login'
        render 'new'
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Logged out!'
  end

  private

  def session_params
    params.require(:session).permit(:name)
  end

end
