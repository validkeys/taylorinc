class Department < ActiveRecord::Base
  has_many :projects, :dependent => :nullify
  
  validates_presence_of :permalink, :title
  validates_length_of :permalink, :within => 2..128
  validates_length_of :title, :within => 2..128
  
  # acts_as_list
  has_attached_file :image,
                    :styles => { :original => "800x600>", :thumb => "300x300>" },
                    :path => ":rails_root/public/attachments/departments/:id/:style_:basename.:extension",
                    :url => "/attachments/departments/:id/:style_:basename.:extension"
  
  validates_attachment_presence :image
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/gif', 'image/png', 'image/pjpeg', 'image/x-png']
  
end
