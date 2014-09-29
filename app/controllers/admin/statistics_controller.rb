class Admin::StatisticsController < ApplicationController
   before_action :set_tabs
  def index 
  	
  end
  private
  def set_tabs
  	@current_tab = :statistics
  end
end