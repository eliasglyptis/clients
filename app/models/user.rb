class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :clients

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :full_name, presence: true, length: { minimum: 2, maximum: 70 }
  validates :organization, allow_blank: true, length: {minimum: 3, maximum: 70}, on: :update
  
end
