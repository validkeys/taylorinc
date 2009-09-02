xml.instruct!
xml.departments do
  for department in @departments
    xml.department :href => "#{department_path(department)}.xml" do
      xml.title department.title
      xml.description department.description
      xml.image department.image.url if department.image?
    end
  end
end