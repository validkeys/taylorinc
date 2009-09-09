xml.instruct!
xml.site do
  xml.topnav do
    xml.logo :href => '/'
    xml.btn :label => 'HOME', :href => '/'
    xml.btn :label => 'SERVICES', :href => section_path('services')
    xml.btn :label => 'OUR WORK', :href => '/'
    xml.btn :label => 'NEWS', :href => section_path('news')
    xml.btn :label => 'ABOUT US', :href => section_path('about')
    xml.btn :label => 'CONTACT', :href => locations_path
  end
  xml.nav do
    for department in @departments
      xml.btn :href => department_path(department) do
        xml.title department.title.upcase
        xml.heading department.tag_line
        xml.colors :main => department.color_main, :bg => department.color_bg
      end
    end
  end
  xml.footer do
    xml.label :text => "Copyright © 2008 Taylor Inc. All rights reserved."
    xml.link :label => "Terms of Use", :href => section_page_path('legal', 'terms')
    xml.label :text => "|"
    xml.link :label => "Privacy Policy", :href => section_page_path('legal', 'policy')
  end
  xml.page :default => 'home' do
    xml.item :href => '/', :src => '', :view => 'home'
    for department in @departments
      xml.item :href => department.to_param, :src => department_path(department), :view => 'featured'
    end
    xml.item :href => 'categories', :src => categories_path, :view => 'portfolio'
    xml.item :href => 'industries', :src => industries_path, :view => 'portfolio'
    xml.item :href => 'projects', :src => projects_path, :view => 'project'
    xml.item :href => 'services', :src => section_path('services'), :view => 'template'
    xml.item :href => 'news', :src => section_path('news'), :view => 'template'
    xml.item :href => 'about', :src => section_path('about'), :view => 'template'
    xml.item :href => 'contact', :src => locations_path, :view => 'template'
    xml.item :href => 'terms', :src => section_page_path('legal', 'terms'), :view => 'template'
    xml.item :href => 'policy', :src => section_page_path('legal', 'policy'), :view => 'template'
  end
end
