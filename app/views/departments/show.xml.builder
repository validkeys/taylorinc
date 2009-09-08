xml.instruct!
xml.section do
  xml.description do
    xml.cdata!(@department.description)
  end
  xml.items do
    for project in @department.projects
      xml.item :href => project_path(project)
    end
  end
  xml.other do
    for category in @department.categories
      xml.item :href => category_path(category) do
        xml.title category.title
      end
    end
  end
  # TODO
  # we have categories, but what about industries?
  xml.featured do
    for project in @department.featured_projects
      xml.item :href => project_path(project)
    end
  end
  xml.content do
    for project in @department.projects
      xml.item :href => project_path(project) do
        xml.title project.title
        xml.desc project.description
      end
    end
  end
end
