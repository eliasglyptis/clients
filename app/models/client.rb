class Client < ApplicationRecord
  require 'uri'
  belongs_to :user

  before_save { 
    self.email = email.downcase 
    self.first_name = first_name.downcase.capitalize!
    self.last_name = last_name.downcase.capitalize!
  }

  validates :first_name, :last_name, presence: true, length: { minimum: 2, maximum: 150 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

end
