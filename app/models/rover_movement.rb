class RoverMovement

  ROTATE_MAPPING = {
    "NL" => "W", "NR" => "E", "EL" => "N", "ER" => "S",
    "SL" => "E", "SR" => "W", "WL" => "S", "WR" => "N"
  }
  
  def move(rover, plateau, commands)
    results = []

    commands.split('').each do |command|
      command = command.upcase
      if command == "L" or command == "R"
        rover.direction = rotate(rover.direction, command)
      elsif command == "M"
         rover.x, rover.y = forward(rover.x, rover.y, rover.direction, plateau)
      end
    end
  end

  def forward(x, y, direction, plateau)
    x_new = x
    y_new = y

    case direction
      when "N" then y_new = y + 1
      when "S" then y_new = y - 1
      when "E" then x_new = x + 1
      when "W" then x_new = x - 1
    end

    if !plateau.possible_movement?(x_new, y_new)
      #Robot cant move outside plateu
      Rails.logger.info "Robot can't move outside to #{x_new}, #{y_new}"
      return x, y
    else
      return x_new, y_new
    end
  end

  def rotate(rover_dir, move_dir)
    ROTATE_MAPPING["#{rover_dir}#{move_dir}"]
  end


end
