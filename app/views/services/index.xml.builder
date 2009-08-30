xml.instruct!
xml.services do
  for service in @services
    xml.service do
      xml.permalink service.permalink
      xml.title service.title
      xml.body service.body
      xml.image service.image.url if service.image?
    end
  end
end