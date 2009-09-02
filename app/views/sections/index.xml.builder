xml.instruct!
xml.sections do
  for section in @sections
    xml.section :href => "#{section_path(section)}.xml" do
      xml.title section.title
      xml.image section.image.url if section.image?
    end
  end
end