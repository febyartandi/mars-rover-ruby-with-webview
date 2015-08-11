require 'spec_helper'

describe Rover do

  it "should setup the attibutes" do
    rover = Rover.new("1 2 N")
    rover.x.should == 1
    rover.y.should == 2
    rover.direction.should == "N"
  end

  it "should show the position" do
    rover = Rover.new("1 2 N")
    rover.show_coordinates.should == "1 2 N"
  end

end
