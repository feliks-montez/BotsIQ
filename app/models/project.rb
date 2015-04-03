class Project < ActiveRecord::Base
  default_scope {order('deadline ASC')}

  validates :name, presence: true
  validates :deadline, presence: true

end
