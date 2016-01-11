class PasswordResetsController < ApplicationController
  skip_before_filter :require_user

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    user.send_password_reset if user
    flash[:success] = 'Email sent with password reset instructions.'
    redirect_to root_url
  end

  def edit
    @user = User.find_by(password_reset_token: params[:id])
  end

  def update
    @user = User.find_by(password_reset_token: params[:id])
    if @user.password_reset_sent_at < 2.hours.ago
      flash[:danger] = 'Password reset has expired.'
      redirect_to new_password_reset_path
    elsif @user.save_password(params[:user][:password])
      flash[:success] = 'Password has been reset!'
      redirect_to root_url
    else
      flash[:danger] = 'Whoops, that didn\'t work!'
      render :edit
    end
  end
end
