xml.instruct!
xml.clients do
  for client in @clients
    xml.client :href => "#{client_path(client)}.xml" do
      xml.name client.name
      xml.description client.description
      xml.image client.image.url if client.image?
    end
  end
end