xml.instruct!
xml.clients do
  for client in @clients
    xml.client do
      xml.slug client.slug
      xml.name client.name
      xml.description client.description
    end
  end
end