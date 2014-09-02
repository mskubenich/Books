class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :create_visit
  before_action :signed_in_user, except: [:new]

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
    redirect_to signin_path, notice: "Please sign in." unless signed_in?
  end

  
end
