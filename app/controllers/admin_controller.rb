class AdminController <  ApplicationController
  before_action :ensure_user_is_admin

  private

  def ensure_user_is_admin
    authorize! :admin, nil
  end

end	