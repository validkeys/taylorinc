xml.instruct!
xml.stories do
  for story in @stories
    xml.story :href => "#{story_path(story)}.xml" do
      xml.permalink story.permalink
      xml.title story.title
      xml.body story.body
      xml.image story.image.url if story.image?
    end
  end
end