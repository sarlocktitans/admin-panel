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
      flash.now[:danger] = "Following errors prohibited new car from save\n #{@car.errors}"
      render 'new'
    end
  end

  def edit
    @car = Car.find(params[:id])
  end

  def update
    @car = Car.find(params[:id])
    if(BCrypt::Password.new(current_user.encrypted_password) == params[:car][:current_password])
      if @car.update(car_params)
        flash[:success] = "Records updates successfully"
        redirect_to admin_car_path
      else
        flash.now[:danger] = "Something went wrong"
        render 'edit'
      end
    else
      flash.now[:danger] = "Password is incorect"
      render 'edit'
    end
  end

  def show
    @car = Car.find(params[:id])
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