module TweetsHelper
  def avatar_image_tag(user, options = {})
    image_url = user.avatar.present? ? user.avatar_url : 'http://placehold.it/64x64'
    image_tag image_url, class: "avatar #{options[:class]}"
  end

  def tweet_date(tweet)
    time_ago_in_words(tweet.created_at) + ' ago'
  end

  def tweet_favorite(tweet)
    icon = tweet_favorite_icon(tweet)
    link_to favorite_tweet_path(tweet), class: 'favorite-link' do
      content_tag(:i, nil, class: "glyphicon #{icon}")
    end
  end

  private

  def tweet_favorite_icon(tweet)
    if current_user.favorite?(tweet)
      'glyphicon-star'
    else
      'glyphicon-star-empty'
    end
  end
end
