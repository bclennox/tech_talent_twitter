class TweetsController < ApplicationController
  before_action :authenticate_user!, only: [:favorite, :create]

  def index
    @tweets = Tweet
      .includes(:user)
      .page(params[:page])
      .per(10)
      .order(created_at: :desc)
  end

  def create
    tweet = current_user.tweets.create(tweet_params)
    redirect_to timeline_path, notice: 'Tweeted your tweet!'
  end

  def favorite
    @tweet = Tweet.find(params[:id])
    current_user.toggle_favorite(@tweet)
    render layout: false
  end

  private

  def tweet_params
    params.require(:tweet).permit(:body)
  end
end
