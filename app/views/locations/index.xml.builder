xml.instruct!
xml.locations do
  for location in @locations
    xml.location do
      xml.permalink location.permalink
      xml.title location.title
      xml.street_1 location.street_1
      xml.street_2 location.street_2
      xml.city location.city
      xml.province location.province
      xml.country location.country
      xml.postal_code location.postal_code
      xml.contact_info location.contact_info
    end
  end
end