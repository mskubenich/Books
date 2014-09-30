class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :create_visit, onlu: [:save_statistic]
  before_action :signed_in_user, only: [:edit, :update]
  

  private

  def create_visit
    ua = AgentOrange::UserAgent.new(request.user_agent)
    browser = ua.device.engine.browser
    os = ua.device.operating_system

    Visit.create ip: request.remote_ip,
                 browser: browser.name,
                 browser_version: browser.version.to_s,
                 os_name: os.name,
                 os_version: os.version.to_s,
                 device: ua.device.to_s
  end

  def signed_in_user
    redirect_to signin_url, notice: "Please sign in." unless signed_in?
  end


def save_statistic
  users_ip = Visit.ip.each do |user_ip|
  visit_date = @user_ip.created_at
  
    if user_ip != request.remote_ip && (visit_date-Visit.created_at) >24*3600
      create_visit
    end
  end
end

end
