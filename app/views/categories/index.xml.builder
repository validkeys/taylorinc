xml.instruct!
xml.categories do
  for category in @categories
    xml.category do
      xml.permalink category.permalink
      xml.title category.title
    end
  end
end