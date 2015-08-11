class RoversController < ApplicationController
  include InputValidator

  def index
  end

  def move
    if valid_plateau_coordinates_commands?(params[:plateau_corner],
      params[:current_position], params[:commands] )
      @rover = Rover.new(params[:current_position])
      plateau = Plateau.new(params[:plateau_corner])
      rover_movement = RoverMovement.new
      rover_movement.move(@rover, plateau, params[:commands])
      render :action => :index
    else
      flash.now[:error] = "Your input is not valid, please try again!"
      render :action => :index
    end
  end

end
