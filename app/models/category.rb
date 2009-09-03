class Category < ActiveRecord::Base
  
  has_many :projects, :order => 'title'
  
  validates_presence_of :title
  validates_length_of :title, :within => 2..100
  
  
  has_attached_file :image,
                    :styles => { :original => "800x600>", :thumb => "300x300>" },
                    :path => ":rails_root/public/attachments/categories/:id/:style_:basename.:extension",
                    :url => "/attachments/categories/:id/:style_:basename.:extension"
  
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/gif', 'image/png', 'image/pjpeg', 'image/x-png']
  
  has_friendly_id :title, :use_slug => true
  
end
