class UsersController < ApplicationController


  # TODO:: users/1 = A, users/3 = B, when you logged to A you can get parameters of user B. Fix bug.
  def show
    begin
      @user = User.find(params[:id])
    rescue
      render 'layouts/404.html.erb'
    end
  end


  private
  def is_current_user
    return current_user.id == params[:id]
  end
end
