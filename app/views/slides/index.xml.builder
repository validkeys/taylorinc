xml.instruct!
xml.slides do
  for slide in @slides
    xml.slide :href => "#{slide_path(slide)}.xml" do
      xml.title slide.title
      xml.url slide.url
      xml.description slide.description
      xml.image slide.image.url if slide.image?
    end
  end
end