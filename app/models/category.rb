class Category < ActiveRecord::Base
  has_many :projects, :through => :categories_projects
end
