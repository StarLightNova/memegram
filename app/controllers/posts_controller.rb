class PostsController < ApplicationController
  def show
    begin
      @post = Post.find(params[:id])
    rescue
      render 'layouts/404.html.erb'
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:title, :body, :user_id))
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end
end 
