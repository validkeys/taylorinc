xml.instruct!
xml.slides do
  for slide in @slides
    xml.slide do
      xml.title slide.title
      xml.url slide.url
      xml.description slide.description
    end
  end
end