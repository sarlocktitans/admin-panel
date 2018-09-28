class Admin::UsersController < ApplicationController
  
  before_action :check
  require 'bcrypt'
  def user_assosiate
  	if(params[:car].present? && params[:bus].present?)
  	   find('Car')
  	 find('Bus')
  	elsif params[:car].present?
  	  find('Car')
  	elsif params[:bus].present?
  	   find('Bus')
  	end
  end

  def find( model)
    user_value = User.where('name like?',"%#{params[:username]}%").first
  	@cars= user_value.cars if(model == 'Car')
  	@buses = user_value.buses if(model == 'Bus')
  end
  
  def index
    @user = User.all
  end

  def new
    @user = User.new
    @minimum_password_length = 6
  end

  def create
    @user = User.new(user_params)
    if(params[:password] == params[:password_confirmation])
      @user.encrypted_password = BCrypt::Password.create(params[:password])
    else
      flash[:danger] = "password and password_confirmation didn't match"
      render 'new'
    end  
    if @user.save
      flash[:sucess] = "User is successfully created"
      redirect_to admin_new_user_path
    else
      flash[:danger] =  @user.errors
      render 'new'
    end
  end

  def check
    @models = models
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end