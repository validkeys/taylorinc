xml.instruct!
xml.photos do
  for photo in @photos
    xml.photo :href => "#{photo_path(photo)}.xml" do
      xml.id photo.id
      xml.title photo.title
      xml.image_url photo.image
    end
  end
end