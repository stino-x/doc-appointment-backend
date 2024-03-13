class User < ActiveRecord::Base
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User
  has_many :appointments
  # Teachers created by this user (admin)
  has_many :teachers, dependent: :destroy
  # Availabilities created by this user (admin)
  has_many :availabilities, foreign_key: :admin_user_id, dependent: :destroy
end