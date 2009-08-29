class Project < ActiveRecord::Base
  belongs_to :department
  has_many :industries, :through => :industries_projects
  has_many :categories, :through => :categories_projects
  has_many :photos
  
  has_attached_file :image,
                    :styles => { :original => "800x600>", :thumb => "618x490>" },
                    :path => ":rails_root/public/attachments/projects/:id/:style_:basename.:extension",
                    :url => "/attachments/projects/:id/:style_:basename.:extension"
  
  validates_attachment_presence :image
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/gif', 'image/png', 'image/pjpeg', 'image/x-png']
  
  # acts_as_list :scope => :department
  
end
