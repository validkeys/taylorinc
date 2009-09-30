class Project < ActiveRecord::Base
  
  belongs_to :category
  belongs_to :industry
  belongs_to :department
  
  has_many :photos, :dependent => :destroy, :order => 'position'
  
  validates_presence_of :client, :title, :tag_line, :description
  validates_length_of :client, :within => 2..100
  validates_length_of :title, :within => 2..100
  validates_length_of :tag_line, :within => 2..255
  
  has_attached_file :image,
                    :styles => { :"1080" => "1920x1080#", :"720" => "1280x720#", :"640" => "640x360#", :small => "240x150#", :thumb => "180x113#" },
                    :default_style => :"720",
                    :path => ":rails_root/public/attachments/projects/:id/:style_:basename.:extension",
                    :url => "/attachments/projects/:id/:style_:basename.:extension"
  
  #validates_attachment_presence :image
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/gif', 'image/png', 'image/pjpeg', 'image/x-png']
  
  has_friendly_id :title, :use_slug => true
  
  def photo
    self.photos.find :first
  end
  
  attr_descriptions(
    :category => 'Select the category the project should appear within.',
    :industry => 'Select the industry the project should appear within.',
    :department => 'Select the department the project should appear within.',
    :client => 'The client the project was completed for. I.e. Bell Canada.',
    :title => 'Give the project a descriptive but short title that sufficiently sums it up. I.e. RIM Wireless Enterprise Symposium.',
    :tag_line => 'Give the project a descriptive tag line that describes it with a little more detail than the title.',
    :featured => 'The featured flag determines whether or not the project will show up within the featured list.',
    :description => 'Describe the project in detail.',
    :image => 'Upload an image for the project.'
  )
  
end
