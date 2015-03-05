class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def edit
    @user = current_user
    @followings = @user.followings
    @available_followings = @user.available_followings
  end

  def update
    @user = current_user

    if @user.update(user_params)
      redirect_to edit_profile_path, notice: 'Updated your profile.'
    else
      flash.now[:alert] = @user.errors.full_messages.join('. ')
      render :edit
    end
  end

  def follow
    @user = current_user
    @user.follows.create(following_id: params[:following_id])
    redirect_to edit_profile_path, notice: 'Added your follower.'
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :location, :handle, :avatar)
  end
end
