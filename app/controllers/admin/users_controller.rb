class Admin::UsersController < AdminController

  before_action :set_tabs

  def index
    if current_user.admin?
      @users = User.all
    else
      flash[:error] = "Access denied!"
      redirect_to root_path
    end
  end

  private

  def set_tabs
  	@current_tab = :user
  end
end
