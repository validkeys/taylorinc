class Project < ActiveRecord::Base
  belongs_to :industry
  belongs_to :category
end
