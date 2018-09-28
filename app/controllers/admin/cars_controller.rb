class Admin::CarsController < ApplicationController

  before_action :check
  
  def index
  	@cars = Car.all
  end
  
  def new
  	@car = Car.new
  end
  
  def create
  	@car = Car.new(car_params)
  	@car.user = User.first
  	if @car.save
  	  flash[:success] = "Car was successfully saved"
  	  redirect_to admin_new_car_path
    else
      flash[:danger] = "Following errors prohibited new car from save"
      flash[:danger] = @car.errors
      render 'new'
    end
  end

  def check
  	@models = models
  end

  def car_params
  	params.require(:car).permit(:car_name, :make, :model, :description,
  						:is_featured, :price, :year, :registration_date,
  						       :manufacturer)
  end
end