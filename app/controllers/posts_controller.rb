class PostsController < ApplicationController
    before_action :set_post, only: [:edit, :update, :show, :destroy]

    
    def index
        @posts = Post.all # This will grab all the Posts from the Database
    end
   
    def new
        @post = Post.new
    end

   def create
    @post = Post.new(post_params)
    if @post.save
    flash[:success] = "Post was successfully created!"
    redirect_to post_path(@post)
    else
        render 'new'
    # @post.save
    end
   end

   def show
   end

   def edit
   end

   def update
    if @post.update(post_params)
    flash[:success] = "Post was successfully updated"
    redirect_to post_path(@post)
   else
    render 'edit'
   end
end


def destroy 
    @post.destroy
    flash[:danger] = "Post was successfully deleted"
    redirect_to posts_path
end






   private

   def set_post
    @post = Post.find(params[:id])
   end

   def post_params
    params.require(:post).permit(:title, :description)
   end
end
