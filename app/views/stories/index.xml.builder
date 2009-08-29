xml.instruct!
xml.stories do
  for story in @stories
    xml.story do
      xml.slug story.slug
      xml.title story.title
      xml.body story.body
    end
  end
end