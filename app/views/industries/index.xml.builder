xml.instruct!
xml.industries do
  for industry in @industries
    xml.industry :href => "#{industry_path(industry)}.xml" do
      xml.title industry.title
      xml.image industry.image.url if industry.image?
    end
  end
end