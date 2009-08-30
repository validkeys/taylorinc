class Location < ActiveRecord::Base
  
  has_attached_file :image,
                    :styles => { :original => "800x600>", :thumb => "300x300>" },
                    :path => ":rails_root/public/attachments/locations/:id/:style_:basename.:extension",
                    :url => "/attachments/locations/:id/:style_:basename.:extension"
  
  #validates_attachment_presence :image
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/gif', 'image/png', 'image/pjpeg', 'image/x-png']
  
  # consolidates address feilds
  def address
    "#{street_1} #{street_2}, #{city}, #{province}, #{country}, #{postal_code}"
  end
  
end
