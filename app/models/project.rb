class Project < ActiveRecord::Base
  belongs_to :department
  has_many :industries, :through => :industries_projects
  has_many :categories, :through => :categories_projects
end
