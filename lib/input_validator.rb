module InputValidator

  def valid_land?(plateau_corner)
    !(plateau_corner.blank? or (sliced_coord = plateau_corner.split(' ')).size != 2 or sliced_coord[0].to_i < 0 or sliced_coord[1].to_i < 0)
  end

  def valid_commands?(command)
    !command.blank?
  end

  def valid_start_position?(start_position)
    start_position.split(SEPARATED_CHAR).size == 3
  end

  def valid_plateau_coordinates_commands?(plateau_corner, start_position, commands)
    valid_land?(plateau_corner) && valid_start_position?(start_position) && valid_commands?(commands)
  end

end
