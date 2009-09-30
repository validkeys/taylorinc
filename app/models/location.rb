class Location < ActiveRecord::Base
  
  acts_as_list
  
  validates_presence_of :title, :street_1, :city, :province, :country, :postal_code
  validates_length_of :title, :within => 2..100
  validates_length_of :street_1, :within => 3..100
  validates_length_of :city, :within => 3..100
  validates_length_of :province, :within => 2..2
  validates_length_of :country, :within => 2..32
  validates_length_of :postal_code, :within => 5..20
  
  validates_length_of       :email, :within => 6..100, :allow_nil => true, :allow_blank => true
  validates_format_of       :email, :with => Authentication.email_regex, :message => Authentication.bad_email_message, :allow_nil => true, :allow_blank => true
  
  has_attached_file :image,
                    :styles => { :"1080" => "1920x1080#", :"720" => "1280x720#", :"640" => "640x360#", :small => "240x150#", :thumb => "180x113#" },
                    :default_style => :"720",
                    :path => ":rails_root/public/attachments/locations/:id/:style_:basename.:extension",
                    :url => "/attachments/locations/:id/:style_:basename.:extension"
  
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/gif', 'image/png', 'image/pjpeg', 'image/x-png']
  
  has_friendly_id :title, :use_slug => true
  
  # consolidates address feilds
  def address
    "#{street_1} #{street_2}, #{city}, #{province}, #{country}, #{postal_code}"
  end
  
  describe_attr(
    :title => 'The title should be a short but descriptive summary.',
    :street_1 => 'The street address.',
    :street_2 => 'The unit or suite number. I.e. Suite #303',
    :city => 'The city. I.e. Toronto',
    :province => 'Two letter province or state code.',
    :country => 'The full country name. I.e. Canada',
    :postal_code => 'The postal or zip code. I.e. 90210',
    :email => 'The primary email address for this location. I.e. info@taylorinc.com',
    :contact_info => 'The contact details for this location, like phone and fax numbers. May contain a limited amount of html markup as indicated in the editor below.',
    :image => 'Upload an image for the location. Ideally a picture of a map.'
  )
  
end
