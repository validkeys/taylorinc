# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  # assume you have a style defined for attr_description
  def describe_attr(form, attribute)
    "<span class='attr_description'>#{form.object.class.describe_attr(attribute)}</span>"
  end
  
end
