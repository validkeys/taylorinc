xml.instruct!
xml.categories do
  for category in @categories
    xml.category :href => "#{category_path(category)}.xml" do
      xml.title category.title
      xml.image category.image.url if category.image?
    end
  end
end