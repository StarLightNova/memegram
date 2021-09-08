class UsersController < ApplicationController


  # TODO:: users/1 = A, users/3 = B, when you logged to A you can get parameters of user B. Fix bug.
  def show
    can_user_go
  end

  private
  def can_user_go
    begin
      @user = User.find(params[:id])
    rescue
      render 'layouts/404.html.erb'
    end
  end
end
