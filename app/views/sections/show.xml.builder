xml.instruct!
xml.section do
  xml.subnav do    
    for page in @section.pages
      xml.item :href => section_page_path(@section, page)
    end
  end
  xml.content do
    for page in @section.pages
      xml.item :href => section_page_path(@section, page) do
        xml.title page.title
        xml.description do
          xml.cdata!(page.body)
        end
      end
    end
  end
end