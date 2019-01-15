class PostsController < ApplicationController
    def new
        @post = Post.new
    end

   def create
    @post = Post.new(post_params)
    if @post.save
    flash[:notice] = "Post was successfully created!"
    redirect_to post_path(@post)
    else
        render 'new'
    # @post.save
    end
   end

   def show
    @post = Post.find(params[:id])
   end




   private
   def post_params
    params.require(:post).permit(:title, :description)
   end
end
