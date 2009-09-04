xml.instruct!
xml.pages do
  for page in @pages
    xml.page :href => "#{section_page_path(@section, page)}.xml" do
      xml.title page.title
      xml.body page.body
      xml.image page.image.url if page.image?
    end
  end
end