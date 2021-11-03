class HomepageController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index]
  def index
    @post = Post.order(created_at: :desc).paginate(page: params[:page], :per_page => 10)
  end
end
