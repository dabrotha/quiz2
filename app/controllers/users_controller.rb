
class UsersController < ApplicationController

    before_action :find_user, only: [:destroy, :update, :edit]
    before_action :authorize_user!, only: [:destroy, :update, :edit]

 def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to ideas_path, notice: "Logged In!"
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation
    )
  end

end