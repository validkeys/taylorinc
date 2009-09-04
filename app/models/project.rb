class Project < ActiveRecord::Base
  
  belongs_to :category
  belongs_to :industry
  belongs_to :department
  
  has_many :photos, :order => 'position'
  
  validates_presence_of :client, :title, :tag_line, :description
  validates_length_of :client, :within => 2..100
  
  has_attached_file :image,
                    :styles => { :original => "800x600>", :thumb => "300x300>" },
                    :path => ":rails_root/public/attachments/projects/:id/:style_:basename.:extension",
                    :url => "/attachments/projects/:id/:style_:basename.:extension"
  
  #validates_attachment_presence :image
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/gif', 'image/png', 'image/pjpeg', 'image/x-png']
  
  has_friendly_id :title, :use_slug => true
  
end
