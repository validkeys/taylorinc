class Photo < ActiveRecord::Base
  
  belongs_to :project
  acts_as_list :scope => :project
  
  validates_presence_of :project
  validates_length_of :title, :within => 5..128, :allow_nil => true, :allow_blank => true
  
  has_attached_file :image,
                    :styles => { :original => "700x466", :cover => "150x100!", :thumb => "68x50!" },
                    :path => ":rails_root/public/attachments/:id/:style_:basename.:extension",
                    :url => "/attachments/:id/:style_:basename.:extension"
                    
  validates_attachment_presence :image
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/gif', 'image/png', 'image/pjpeg', 'image/x-png'] 
    
end
