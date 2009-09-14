xml.instruct!

xml.urlset "xmlns" => "http://www.google.com/schemas/sitemap/0.84" do
  xml.url do
    xml.loc         root_url
    xml.lastmod     w3c_date(Time.now)
    xml.changefreq  "always"
  end

  #-- Slides
  for slide in @slides
    xml.url do
      xml.loc         slide_url(slide)
      xml.lastmod     w3c_date(slide.updated_at)
      xml.changefreq  "weekly"
      xml.priority    0.8
    end
  end
  
  #-- Departments
  for department in @departments
    xml.url do
      xml.loc         department_url(department)
      xml.lastmod     w3c_date(department.updated_at)
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
  
  #-- Locations
  for location in @locations
    xml.url do
      xml.loc         location_url(location)
      xml.lastmod     w3c_date(location.updated_at)
      xml.changefreq  "weekly"
      xml.priority    0.8
    end
  end
  
  #-- Sections
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
  
  #-- Categories
  for category in @categories
    xml.url do
      xml.loc         category_projects_url(category)
      xml.lastmod     w3c_date(category.updated_at)
      xml.changefreq  "weekly"
      xml.priority    0.8
    end
  end
  
  #-- Industries
  for industry in @industries
    xml.url do
      xml.loc         industry_projects_url(industry)
      xml.lastmod     w3c_date(industry.updated_at)
      xml.changefreq  "weekly"
      xml.priority    0.8
    end
  end
  
end