class Location < ActiveRecord::Base
  
  # consolidates address feilds
  def address
    "#{street_1} #{street_2}, #{city}, #{province}, #{country}, #{postal_code}"
  end
  
end
