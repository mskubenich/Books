class Admin::StatisticsController < AdminController

  before_action :set_tabs

  def index
    gon.visits = Visit.order('created_at ASC').group_by{|v| v.created_at.beginning_of_day }.map{|k, v| [(k.strftime('%s').to_i * 1000), v.size] }
    gon.browsers = Visit.order('browser').group_by{|v| v.browser}.map{|k, v| [(k), v.size] }
    gon.os = Visit.order('os_name').group_by{|v| v.os_name}.map{|k, v| [(k), v.size] }
    gon.devices = Visit.order('device').group_by{|v| v.device }.map{|k, v| [(k), v.size] }
  end

  private

  def set_tabs
  	@current_tab = :statistics
  end

end
