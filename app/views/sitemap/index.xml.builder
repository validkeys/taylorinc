xml.instruct!

xml.urlset "xmlns" => "http://www.google.com/schemas/sitemap/0.84" do
  xml.url do
    xml.loc         root_url
    xml.lastmod     w3c_date(Time.now)
    xml.changefreq  "always"
  end

  #-- Categories
  xml.url do
    xml.loc         categories_url
    xml.lastmod     w3c_date(Time.now)
    xml.changefreq  "weekly"
  end
  for category in @categories
    xml.url do
      xml.loc         category_url(category)
      xml.lastmod     w3c_date(category.updated_at)
      xml.changefreq  "weekly"
      xml.priority    0.8
    end
  end
  
  #-- Departments
  xml.url do
    xml.loc         departments_url
    xml.lastmod     w3c_date(Time.now)
    xml.changefreq  "weekly"
  end
  for department in @departments
    xml.url do
      xml.loc         department_url(department)
      xml.lastmod     w3c_date(department.updated_at)
      xml.changefreq  "weekly"
      xml.priority    0.8
    end
  end
  
  #-- Industries
  xml.url do
    xml.loc         industries_url
    xml.lastmod     w3c_date(Time.now)
    xml.changefreq  "weekly"
  end
  for industry in @industries
    xml.url do
      xml.loc         industry_url(industry)
      xml.lastmod     w3c_date(industry.updated_at)
      xml.changefreq  "weekly"
      xml.priority    0.8
    end
  end
  
  #-- Locations
  xml.url do
    xml.loc         locations_url
    xml.lastmod     w3c_date(Time.now)
    xml.changefreq  "weekly"
  end
  for location in @locations
    xml.url do
      xml.loc         location_url(location)
      xml.lastmod     w3c_date(location.updated_at)
      xml.changefreq  "weekly"
      xml.priority    0.8
    end
  end
  
  #-- Projects
  xml.url do
    xml.loc         projects_url
    xml.lastmod     w3c_date(Time.now)
    xml.changefreq  "daily"
  end
  for project in @projects
    xml.url do
      xml.loc         project_url(project)
      xml.lastmod     w3c_date(project.updated_at)
      xml.changefreq  "daily"
      xml.priority    0.8
    end
  end
  
  #-- Slides
  xml.url do
    xml.loc         slides_url
    xml.lastmod     w3c_date(Time.now)
    xml.changefreq  "weekly"
  end
  for slide in @slides
    xml.url do
      xml.loc         slide_url(slide)
      xml.lastmod     w3c_date(slide.updated_at)
      xml.changefreq  "weekly"
      xml.priority    0.8
    end
  end
  
  #-- Sections
  xml.url do
    xml.loc         sections_url
    xml.lastmod     w3c_date(Time.now)
    xml.changefreq  "weekly"
  end
  for section in @sections
    xml.url do
      xml.loc         section_url(section)
      xml.lastmod     w3c_date(section.updated_at)
      xml.changefreq  "weekly"
      xml.priority    0.8
    end
    for page in section.pages
      xml.url do
        xml.loc         section_page_url(section, page)
        xml.lastmod     w3c_date(page.updated_at)
        xml.changefreq  "weekly"
        xml.priority    0.8
      end
    end
  end
  
  
end