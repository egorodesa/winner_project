class WelcomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all.page(params[:page]).per(10).padding(1)

    @users2 = User.all.page(params[:my_best_page]).per(10).offset(1)

  end

  def show
  end

end
