class PanelController < ApplicationController

  def index
  end
  
  def move
    begin
      @results = []
  	  rover = RoverRobot.new(params[:current_position], params[:move_command])
      plateu = Plateau.new(params[:upper_right_coordinates])
      if rover.error_messages.blank? and plateu.error_messages.blank?
        @results = rover.move(plateu)
      else
        flash[:error] = "#{rover.error_messages} <br /> #{plateu.error_messages}"
        render :action => :index
      end
    
    rescue => e
      flash[:error] = "Something wrong, please check your input and try again!"
      render :action => :index
    end
  end

end
