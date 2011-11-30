class Plateau
  attr_accessor :x_max, :y_max, :x_min, :y_min, :error_messages
  
  def initialize(upper_right_coordinates)
    self.x_min = 0
    self.y_min = 0
    self.x_max = 5
    self.y_max = 5
    if upper_right_coordinates.blank? or (sliced_coord = upper_right_coordinates.split(' ')).size != 2 or sliced_coord[0].to_i < self.x_min or sliced_coord[1].to_i < self.y_min
      error_messages = "Upper Right Coordinates is not valid <br />"
    else
      self.x_max = sliced_coord[0].to_i
      self.y_max = sliced_coord[1].to_i
    end
  end
  
  def valid_coordinates(x, y)
    (x <= self.x_max ) and (x >= self.x_min) and (y <= self.y_max ) and (y >= self.y_min) 
  end

end
