class ProfilesController < ApplicationController
  def edit
    @user = current_user
  end

  def update
    current_user.update(user_params) 
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :user_name, :email, :skill_level, :photo)
  end
end
