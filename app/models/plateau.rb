class Plateau
  attr_accessor :x_max, :y_max, :x_min, :y_min

  def initialize(plateau_corner)
    self.x_min = 0
    self.y_min = 0
    sliced_coord = plateau_corner.split(SEPARATED_CHAR)
    self.x_max = sliced_coord[0].to_i
    self.y_max = sliced_coord[1].to_i
  end

  def possible_movement?(x, y)
    (x <= x_max ) and (x >= x_min) and (y <= y_max ) and (y >= y_min)
  end

end
