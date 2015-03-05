class TimelinesController < ApplicationController
  before_action :authenticate_user!

  def show
    @tweets = Tweet
      .where(user_id: current_user.follows.select(:following_id))
      .includes(:user)
      .page(params[:page])
      .per(10)
  end
end
