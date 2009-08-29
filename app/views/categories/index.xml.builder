xml.instruct!
xml.categories do
  for category in @categories
    xml.category do
      xml.slug category.slug
      xml.title category.title
    end
  end
end