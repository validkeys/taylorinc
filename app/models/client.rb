class Client < ActiveRecord::Base
  
  has_attached_file :image,
                    :styles => { :original => "800x600>", :thumb => "618x490>" },
                    :path => ":rails_root/public/attachments/clients/:id/:style_:basename.:extension",
                    :url => "/attachments/clients/:id/:style_:basename.:extension"
  
  validates_attachment_presence :image
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/gif', 'image/png', 'image/pjpeg', 'image/x-png']
  
end
