class Admin::StatisticsController < AdminController
  def index
    gon.visits = Visit.order('created_at ASC').group_by{|v| v.created_at.beginning_of_day }.map{|k, v| [(k.strftime('%s').to_i * 1000), v.size] }
  end
end
