class PostsController < ApplicationController
    def index
        @posts = Post.all.order(created_at: :desc)
        
        # Optional: Filter by post type if type parameter exists
        if params[:type].present?
            @posts = @posts.where(post_type: params[:type])
        end
        
        # Optional: Pagination
        @posts = Post.order(created_at: :desc).page(params[:page]).per(6) # if using pagination gem
    end
    def show
        @post = Post.find(params[:id])
        @comments = @post.comments.order(created_at: :desc)
        @like = @post.likes.find_by(user: current_user) if user_signed_in?
        
        # Optional: Load more comments
        if params[:load_more_comments].present?
            @comments = @comments.page(params[:page]).per(5) # if using pagination gem
        end
    end
end
