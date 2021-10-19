class Api::V1::PostsController < ApplicationController
  skip_before_action :authenticate_user!
  
  # GET /posts
  def index
    render json: Post.all
  end

  # GET /post/:id
  def show
    render json: Post.find(params[:id])
  end

  # POST /users (create)
  # Description: I didn't write this method, because I already have this method in Device get
  # So I think it is unnecessary for me to rewritting it as a RESTful API.
  
  # PUT /users/:id (update)
  # Same for update as createing.

  # DELETE /users/:id
  # Considering about delete for admin, but I changed my mind to adding here
  # In case of a user w/ programming skills would fetch this and delete records.
  # Will write for admin controller itself.
  # def destroy
  #   @user = User.find(params[:id])
  #   if @user
  #     @user.destroy
  #     render json: { message: 'User successfully deleted.' }, status: 200
  #   else
  #     render json: { message: 'Unable to delete.' }, status: 400
  #   end
  # end

  private
    def post_params
      params.require(:post).permit(:title, :body, :category_id, :user_id)
    end  
end
