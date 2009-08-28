class CategoriesProjects < ActiveRecord::Base
  belongs_to :category
  belongs_to :project
end
