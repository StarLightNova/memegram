class User < ApplicationRecord
  belongs_to :role
  has_many   :posts
  has_one_attached :avatar

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  validates :email, :first_name, :last_name, :username, presence: true
  validates :password, :password_confirmation, presence: true, on: :create
end
