class PagesController < ApplicationController
  layout :resolve_layout
  
  def index
    @pages = Page.all
  end
  def home
    @featured_posts = Post.published.featured.order(created_at: :desc).limit(3)
  end
  def show
    @page = Page.find_by!(slug: params[:id])
  end

  private

  def resolve_layout
    case action_name
    when "show"
      case params[:id]
      when "about"
        "about_layout"
      when "contact"
        "contact_layout"
      when "pricing"
        "pricing_layout"
      else
        "application" # default fallback
      end
    else
      "application"
    end
  end
end
