class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :create_visit

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

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end
end
