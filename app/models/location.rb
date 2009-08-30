class Location < ActiveRecord::Base
  
  validates_presence_of :permalink, :title, :street_1, :city, :province, :country, :postal_code
  validates_length_of :permalink, :within => 2..100
  validates_length_of :title, :within => 2..100
  validates_length_of :street_1, :within => 3..128
  validates_length_of :city, :within => 3..100
  validates_length_of :province, :within => 2..2
  validates_length_of :country, :within => 2..32
  validates_length_of :postal_code, :within => 5..20
  
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
