xml.instruct!
xml.departments do
  for department in @departments
    xml.department do
      xml.slug department.slug
      xml.title department.title
      xml.description department.description
    end
  end
end