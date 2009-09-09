xml.instruct!
xml.project do
  for photo in @project.photos
    xml.image photo.image.url
  end
  xml.title @project.title
  xml.client @project.client
  xml.description @project.description
end