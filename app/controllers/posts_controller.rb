class PostsController < ApplicationController
    def index
        @posts = Post.all.order(created_at: :desc)

    # Filter by post type if type parameter exists
    if params[:type].present?
        @posts = @posts.where(post_type: params[:type])
    end

    # Apply pagination to the filtered results
    @posts = @posts.page(params[:page]).per(6) # Using Kaminari pagination
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

    def edit
        @post = Post.find(params[:id])
        unless @post.user == current_user || current_user.admin?
            flash[:alert] = "You are not authorized to edit this post."
            redirect_to post_path(@post) and return
        end
    end

    def new 
        @post = Post.new
        @post.user = current_user if user_signed_in?
    end
    
    private

    def post_params
        params.require(:post).permit(:title, :body, :post_type, :feature_image, :main_image, :status, :featured)
    end
end
