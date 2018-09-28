class ApplicationController < ActionController::Base
  
  def models
  	@models = ['Car', 'User','Bus']
  end


end
