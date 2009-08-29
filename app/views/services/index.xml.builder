xml.instruct!
xml.services do
  for service in @services
    xml.service do
      xml.slug service.slug
      xml.title service.title
      xml.body service.body
    end
  end
end