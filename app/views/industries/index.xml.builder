xml.instruct!
xml.industries do
  for industry in @industries
    xml.industry do
      xml.slug industry.slug
      xml.title industry.title
    end
  end
end