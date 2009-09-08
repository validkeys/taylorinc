xml.instruct!
xml.section do
  xml.subnav do
    for location in @locations
      xml.item :href => location_path(location)
    end
  end
  xml.content do
    for location in @locations
      xml.item :href => location_path(location) do
        xml.title location.title
        xml.street_1 location.street_1
        xml.street_2 location.street_2
        xml.city location.city
        xml.province location.province
        xml.country location.country
        xml.postal_code location.postal_code
        xml.contact_info do
          xml.cdata!(location.contact_info)
        end
        xml.image location.image.url if location.image?
        # and if we want to include a map eventually
        #xml.lat location.lat
        #xml.lng location.lng
      end
    end
  end
end