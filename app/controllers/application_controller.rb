class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  def models
  	@models = ['Car', 'User','Bus']
  end


end
