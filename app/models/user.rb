class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cars
  has_many :buses
  has_many :licenses, inverse_of: :user
  accepts_nested_attributes_for :licenses, reject_if: :all_blank, allow_destroy: true
  
end
