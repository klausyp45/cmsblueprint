# app/controllers/likes_controller.rb
class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_likeable

  def create
    @like = current_user.likes.new(likeable: @likeable)
    
    if @like.save
      redirect_back fallback_location: root_path, notice: "Liked!"
    else
      redirect_back fallback_location: root_path, alert: "Could not like."
    end
  end

  def destroy
    @like = current_user.likes.find_by(likeable: @likeable)
    @like.destroy
    redirect_back fallback_location: root_path, notice: "Unliked!"
  end

  private

  def set_likeable
    @likeable = params[:likeable_type].constantize.find(params[:likeable_id])
  end
end
