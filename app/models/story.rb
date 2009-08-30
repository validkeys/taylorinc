class Story < ActiveRecord::Base
  
  validates_presence_of :permalink, :title, :body
  validates_length_of :permalink, :within => 2..128
  validates_length_of :title, :within => 2..128
  
  has_attached_file :image,
                    :styles => { :original => "800x600>", :thumb => "300x300>" },
                    :path => ":rails_root/public/attachments/stories/:id/:style_:basename.:extension",
                    :url => "/attachments/stories/:id/:style_:basename.:extension"
  
  #validates_attachment_presence :image
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/gif', 'image/png', 'image/pjpeg', 'image/x-png']
  
  has_friendly_id :permalink
  
end
