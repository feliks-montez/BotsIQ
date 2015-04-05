class User < ActiveRecord::Base
  belongs_to :team
  belongs_to :position
  before_save :process_email
  #before_save :process_ids
  
  has_secure_password

  validates :name,     presence: true
  #validates :position, presence: true  
  validates :email,    presence: true
  validates :password,              presence: true, on:[:new, :create]
  validates :password_confirmation, presence: true, on:[:new, :create]
  
  def process_email
    self.email = self.email.downcase
  end
  
  def process_ids
    if self.team_id
      self.team = Team.find(self.team_id)
    end
    
    if self.position_id
      self.position = Position.find(self.position_id)
    end
  end
  
end
