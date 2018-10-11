class Admin::DashboardController < ApplicationController
  
  before_action :check

  def index
  	
  end

  def check
  	@models = models
  end
  
end
