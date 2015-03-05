class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all.includes(:user)
  end
end
