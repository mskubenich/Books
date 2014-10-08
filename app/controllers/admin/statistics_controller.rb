class Admin::StatisticsController < AdminController

  before_action :set_tabs

  def index
    gon.visits = Visit.order('created_at ASC').group_by{|v| v.created_at.beginning_of_day }.map{|k, v| [(k.strftime('%s').to_i * 1000), v.size] }
  end

  private

  def set_tabs
  	@current_tab = :statistics
  end

end
