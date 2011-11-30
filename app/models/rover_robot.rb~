class RoverRobot

  attr_accessor :direction, :start_positions, :move_commands, :error_messages
  
  def initialize(start_positions, move_commands)
    validate_input(start_positions, move_commands)
    if self.error_messages.blank?
      self.start_positions = start_positions
      self.move_commands = move_commands
    end
  end
  
  def validate_input(start_positions, move_commands)
    if start_positions.blank? or move_commands.blank?
      error_messages = "Current Position or Commands can't be blank !<br />"
    else
      start_positions.each_with_index do |post, i|
        if post.split(' ').size != 3
          error_messages = "#{error_messages} Current Rover Positions no #{i+i} does not valid ! <br />"
        end
      end
    end
  end
  
  def move(plateau)
    results = []
    start_positions.each_with_index do |position, i|
       x_post, y_post, self.direction = extract_position(position)
         self.move_commands[i].split('').each do |cmd|
           if cmd == "L" or cmd == "R"
             rotate(cmd)
           elsif cmd == "M"
           	 x_post, y_post = forward(x_post, y_post, plateau)
           end
         end
         results << "#{x_post} #{y_post} #{self.direction}"

    end
    results
  end
  
  def rotate(move_dir)
    degrees = direction_on_degree
    if move_dir == 'R'
      degrees += 90 
    elsif move_dir == 'L'
      if degrees != 0
        degrees -= 90
      else 
      	degrees = 270
       end
    end
    degrees = 0 if degrees >= 360
    self.direction = direction_on_cardinal(degrees)
  end
  
  def forward(x, y, plateau)
    x_post = x
    y_post = y
    y_post = y + 1 if direction == "N"
    y_post = y - 1 if direction == "S"
    x_post = x + 1 if direction == "E"
    x_post = x - 1 if direction == "W"
    
    if !plateau.valid_coordinates(x_post, y_post)
      #Robot cant move outside plateu
      self.error_messages = "#{self.error_messages} Cant move Robot outside the map !<br />"
      return x, y
    else
      return x_post, y_post
    end
  end
  
  def direction_on_degree
  	 case self.direction
      when 'N' then 0
      when 'S' then 180
      when 'E' then 90
      when 'W' then 270
    end
  end
  
  def direction_on_cardinal(degree=0)
    case degree
      when 0 then 'N'
      when 180 then 'S'
      when 90 then 'E'
      when 270 then 'W'
    end
  end
  
  def extract_position(position)
    coordinates = position.split(" ")
    x_start = coordinates[0].to_i
    y_start = coordinates[1].to_i
    face = coordinates[2]
    return x_start, y_start, face
  end
  

end
