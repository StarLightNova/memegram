class PostsController < ApplicationController

  def show
    begin
      @resource = Post.find(params[:id])
    rescue
      render 'layouts/404.html.erb'
    end
  end

  def new
    @resource = Post.new
    @categories = Category.all
  end

  def create
    @resource = Post.new(post_params_required)
    if @resource.save
      redirect_to @resource
    else
      render :new
    end
  end

  def edit
    @resource = Post.find(params[:id])
  end

  def update
    @resource = Post.find(params[:id])
    @resource.update(post_params_required)
    flash.now[:success] = ["Saved!"]
    render :edit
  end
  
  def destroy
    Post.find(params[:id]).delete
    flash.now[:success] = ["You successfully deleted meme."]
    redirect_to User.find(params[:user_id])
  end

  private
    def post_params_required
      params.require(:post).permit(:title, :body, :user_id)
    end
end 
