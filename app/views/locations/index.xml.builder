xml.instruct!
xml.locations do
  for location in @locations
    xml.location :href => "#{location_path(location)}.xml" do
      xml.title location.title
      xml.street_1 location.street_1
      xml.street_2 location.street_2
      xml.city location.city
      xml.province location.province
      xml.country location.country
      xml.postal_code location.postal_code
      xml.contact_info location.contact_info
      xml.image location.image.url if location.image?
    end
  end
end