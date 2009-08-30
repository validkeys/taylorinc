xml.instruct!
xml.stories do
  for story in @stories
    xml.story do
      xml.permalink story.permalink
      xml.title story.title
      xml.body story.body
    end
  end
end