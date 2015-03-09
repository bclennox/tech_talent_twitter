class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tweets, dependent: :destroy
  has_many :follows
  has_many :followings, through: :follows
  has_many :favorites
  has_many :favorite_tweets, through: :favorites, source: :tweet

  mount_uploader :avatar, AvatarUploader

  def name
    "#{first_name} #{last_name}"
  end

  def recent_tweets
    tweets.limit(5)
  end

  def available_followings
    self.class.where.not(id: follows.select(:following_id)).where.not(id: id)
  end

  def favorite?(tweet)
    favorites.where(tweet: tweet).exists?
  end

  def toggle_favorite(tweet)
    if favorite?(tweet)
      favorites.where(tweet: tweet).first.destroy
    else
      favorites.create(tweet: tweet)
    end
  end
end
