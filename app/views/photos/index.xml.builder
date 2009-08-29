xml.instruct!
xml.photos do
  for photo in @photos
    xml.photo do
      xml.id photo.id
      xml.title photo.title
      xml.image_url photo.image
    end
  end
end