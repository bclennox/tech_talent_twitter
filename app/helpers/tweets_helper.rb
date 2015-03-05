module TweetsHelper
  def avatar_image_tag(user, options = {})
    image_url = user.avatar.present? ? user.avatar_url : 'http://placehold.it/64x64'
    image_tag image_url, class: "avatar #{options[:class]}"
  end
end
