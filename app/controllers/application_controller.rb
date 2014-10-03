class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :save_visit
  before_action :signed_in_user, only: [:edit, :update]
  

  @@ASD = 34*4

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


def save_visit
  visits = Visit.where("ip = ? AND created_at > ? ", request.remote_ip , Time.now.beginning_of_day )
    if visits.blank? 
      create_visit
  end
end

end
