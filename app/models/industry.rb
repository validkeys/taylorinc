class Industry < ActiveRecord::Base
  has_many :projects, :through => :industries_projects
end
