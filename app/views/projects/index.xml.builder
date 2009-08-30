xml.instruct!
xml.projects do
  for project in @projects
    xml.project do
      xml.permalink project.permalink
      xml.title project.title
      xml.client project.client
      xml.image project.image.url if project.image?
    end
  end
end