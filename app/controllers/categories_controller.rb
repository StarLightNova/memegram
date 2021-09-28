class CategoriesController < ApplicationController
  def new
    @resource = Category.new
  end

  def show
    @resource = Category.find(params[:id])
    @category_posts = @resource.posts
  end

  def create
    @resource = Category.new(category_params_required)
    if @resource.save
      redirect_to @resource
    else
      render :new
    end
  end

  private 
  def category_params_required
    params.require(:category).permit(:category_name, :category_description)
  end
end
