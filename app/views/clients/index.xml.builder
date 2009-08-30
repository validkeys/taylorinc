xml.instruct!
xml.clients do
  for client in @clients
    xml.client do
      xml.permalink client.permalink
      xml.name client.name
      xml.description client.description
    end
  end
end