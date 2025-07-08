class PagesController < ApplicationController
  def index
    @pages = Page.all
  end
  def home
    @featured_posts = Post.published.featured.order(created_at: :desc).limit(3)
  end
  def show
    @page = Page.find_by!(slug: params[:id])
  end
end
