class Rover

  attr_accessor :x, :y, :direction

  def initialize(start_position)
    position_splitted = start_position.split(SEPARATED_CHAR)
    self.x = position_splitted[0].to_i
    self.y = position_splitted[1].to_i
    self.direction = position_splitted[2]
  end

  def show_coordinates
    "#{x} #{y} #{direction}"
  end


end
