class Project < ActiveRecord::Base
  belongs_to :team
  before_save :process_team

  default_scope {order('deadline ASC')}

  validates :name, presence: true
  validates :deadline, presence: true
  
  def process_team
    if self.team_id
      self.team = Team.find(self.team_id)
    end
  end

end
