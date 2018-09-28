class Admin::BusesController < ApplicationController

  before_action :check	
  def index
  	@buses = Bus.all
  end
  
  def new
  	@bus = Bus.new
  end
  
  def create
  	@bus = Bus.new(car_params)
  	@bus.user = User.first
  	if @bus.save
  	  flash[:success] = "Bus was successfully saved"
  	  redirect_to admin_new_bus_path
    else
      flash[:danger] = "Following errors prohibited new bus from save\n" + @bus.errors
      render 'new'
    end
  end

  def check
  	@models = models
  end

  def car_params
  	params.require(:bus).permit(:bus_name, :make, :model, :description,
  						:is_featured, :price, :year, :registration_date,
  						       :manufacturer)
  end

end