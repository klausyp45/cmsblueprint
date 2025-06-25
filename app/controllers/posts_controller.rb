class PostsController < ApplicationController
    def index
        @posts = Post.all.order(created_at: :desc)
        
        # Optional: Filter by post type if type parameter exists
        if params[:type].present?
            @posts = @posts.where(post_type: params[:type])
        end
        
        # Optional: Pagination
        @posts = @posts.page(params[:page]).per(10) # if using pagination gem
    end
end
