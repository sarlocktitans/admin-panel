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
      if @user.save
        flash[:sucess] = "User is successfully created"
        redirect_to admin_new_user_path
      else
        flash.now[:danger] =  @user.errors
        render 'new'
      end
    else
      flash.now.now[:danger] = "password and password_confirmation didn't match"
      render 'new'
    end 
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id]) 
    if(BCrypt::Password.new(@user.encrypted_password) == params[:user][:current_password])
      if @user.update(user_params)
        flash[:success] = "Records updated successfully"
        redirect_to admin_user_path
      else
        flash.now[:danger] = @user.errors
        render 'edit'
      end
    else
      flash.now[:danger] = "Password is incorrect"
      render 'edit'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def check
    @models = models
  end
  
  def user_params
    if(params[:user][:password].present?)
      params.require(:user).permit(:name, :email, :password, :password_confirmation,
                licenses_attributes: License.attribute_names.map(&:to_sym).push(:_destroy))
    else
      params.require(:user).permit(:name, :email,
                licenses_attributes: License.attribute_names.map(&:to_sym).push(:_destroy))
    end
  end

  
    
  
end