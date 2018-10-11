class Admin::BusesController < ApplicationController

  before_action :check	
  def index
  	@buses = Bus.all
  end
  
  def new
  	@bus = Bus.new
  end
  
  def create
  	@bus = Bus.new(bus_params)
  	@bus.user = User.first
  	if @bus.save
  	  flash[:success] = "Bus was successfully saved"
  	  redirect_to admin_new_bus_path
    else
      flash.now[:danger] = "Following errors prohibited new bus from save\n #{@bus.errors}"
      render 'new'
    end
  end
  
  def edit
    @bus = Bus.find(params[:id])
  end

  def update
    @bus = Bus.find(params[:id])
    if(BCrypt::Password.new(current_user.encrypted_password) == params[:bus][:current_password])
      if @bus.update(bus_params)
        flash[:success] = "Records updates successfully"
        redirect_to admin_bus_path
      else
        flash.now[:danger] = "Something went wrong"
        render 'edit'
      end
    else
      flash.now[:danger] = "Password is incorrect"
      render 'edit'
    end
  end
  
  def show
    @bus = Bus.find(params[:id])
  end

  def check
  	@models = models
  end

  def bus_params
  	params.require(:bus).permit(:bus_name, :make, :model, :description,
  						:is_featured, :price, :year, :registration_date,
  						       :manufacturer)
  end

end