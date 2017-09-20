class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :quotefavorites 
  has_many :quotes, through: :quotesfavorites

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
