module UserHelper
  def display_avatar
    image_tag  "#{current_user.avatar}"
  end
end
