class Position < ActiveRecord::Base
  belongs_to :team
  has_many :users
  before_save :process_team
  
  validates :name,    presence: true
  #validates :team_id, presence: true
  
  def process_team
    if self.team_id
      self.team = Team.find(self.team_id)
    end
  end
  
end
