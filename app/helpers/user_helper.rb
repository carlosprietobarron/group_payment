module UserHelper
  def display_avatar
    image_tag current_user.avatar.to_s
  end
end
