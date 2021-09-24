class CategoriesController < ApplicationController
  def new
    @resource = Category.new
  end
end
