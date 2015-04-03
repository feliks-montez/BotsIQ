class User < ActiveRecord::Base
  belongs_to :team
  before_save :process_email
  
  has_secure_password

  validates :name,     presence: true
  validates :position, presence: true  
  validates :email,    presence: true
  validates :password,              presence: true, on:[:new, :create]
  validates :password_confirmation, presence: true, on:[:new, :create]
  
  def process_email
    self.email = self.email.downcase
  end
  
end
