class Admin::UsersController < AdminController
  before_action :set_tabs
  def index 
  	@users = User.all
  end
  private
  def set_tabs
  	@current_tab = :user
  end
end
