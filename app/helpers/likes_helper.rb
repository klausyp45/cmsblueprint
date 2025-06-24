module LikesHelper
  def like_path(likeable)
    like_likes_path(likeable_type: likeable.class.name, likeable_id: likeable.id)
  end

  def unlike_path(likeable)
    unlike_likes_path(likeable_type: likeable.class.name, likeable_id: likeable.id)
  end
end
