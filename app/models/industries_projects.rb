class IndustriesProjects < ActiveRecord::Base
  belongs_to :industry
  belongs_to :project
end
