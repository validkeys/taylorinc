class Slide < ActiveRecord::Base
  
  validates_presence_of :title, :url
  validates_length_of :title, :within => 2..100
  validates_length_of :url, :within => 2..255
  
  has_attached_file :image,
                    :styles => { :original => "800x600>", :thumb => "300x300>" },
                    :path => ":rails_root/public/attachments/slides/:id/:style_:basename.:extension",
                    :url => "/attachments/slides/:id/:style_:basename.:extension"
  
  validates_attachment_presence :image
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/gif', 'image/png', 'image/pjpeg', 'image/x-png']
  
  has_friendly_id :permalink
  
  # populate the permalink field for SEO friendly links
  def before_save
    self.permalink = title.to_permalink
  end
  
end
