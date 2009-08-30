xml.instruct!
xml.industries do
  for industry in @industries
    xml.industry do
      xml.permalink industry.permalink
      xml.title industry.title
    end
  end
end