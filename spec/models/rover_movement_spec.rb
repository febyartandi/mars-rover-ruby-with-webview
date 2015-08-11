require 'spec_helper'

describe RoverMovement do

  context "Move Actions" do

    before(:each) do
      @rover_movement = RoverMovement.new
    end

    it "should move the rover to 1 3 N" do
      rover = Rover.new("1 2 N")
      plateau = Plateau.new("5 5")
      commands = "LMLMLMLMM"
      @rover_movement.move(rover, plateau, commands)
      rover.show_coordinates.should == "1 3 N"
    end

    it "should rotate to W" do
      plateau = Plateau.new("5 5")
      @rover_movement.rotate("N", "R").should == "E"
    end

    it "should not allowed to move if new coordinate will be oustide the map" do
      plateau = Plateau.new("5 5")
      @rover_movement.forward(5, 5, "N", plateau).should == [5,5]
    end

    it "should allowed to move if new coordinate will be inside the map" do
      plateau = Plateau.new("5 5")
      @rover_movement.forward(4, 4, "N", plateau).should == [4,5]
    end

  end

end
