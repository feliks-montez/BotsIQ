class Project < ActiveRecord::Base
  belongs_to :team

  default_scope {order('deadline ASC')}

  validates :name, presence: true
  validates :deadline, presence: true

end
