class PagesController < ApplicationController
  def index
    @pages = Page.all
  end
  def show
    @page = Page.find_by!(slug: params[:id]) # Use :id if not using slugs
  end
end
