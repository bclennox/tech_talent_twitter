class TimelinesController < ApplicationController
  before_action :authenticate_user!

  def show
    @tweet = current_user.tweets.build
    @tweets = Tweet
      .where(user_id: current_user.follows.pluck(:following_id) << current_user.id)
      .includes(:user)
      .page(params[:page])
      .per(10)
      .order(created_at: :desc)
  end
end
