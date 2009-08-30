xml.instruct!
xml.clients do
  for client in @clients
    xml.client do
      xml.permalink client.permalink
      xml.name client.name
      xml.description client.description
      xml.image client.image.url if client.image?
    end
  end
end