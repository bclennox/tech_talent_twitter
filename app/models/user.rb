class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tweets, dependent: :destroy
  has_many :follows
  has_many :followings, through: :follows

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
end
