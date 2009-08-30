xml.instruct!
xml.categories do
  for category in @categories
    xml.category do
      xml.permalink category.permalink
      xml.title category.title
      xml.image category.image.url if category.image?
    end
  end
end