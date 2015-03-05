class TweetsController < ApplicationController
  def index
    @tweets = Tweet.includes(:user).page(params[:page]).per(10)
  end
end
