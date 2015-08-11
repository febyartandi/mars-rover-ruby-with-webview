require 'spec_helper'

describe Plateau do

  it "should setup the attibutes" do
    plateau = Plateau.new("5 5")
    plateau.x_min.should == 0
    plateau.y_min.should == 0
    plateau.x_max.should == 5
    plateau.y_max.should == 5
  end

  it "should reject movement" do
    plateau = Plateau.new("5 5")
    plateau.possible_movement?(6,6).should be false
  end

  it "should allow movement" do
    plateau = Plateau.new("5 5")
    plateau.possible_movement?(3,4).should be true
  end

end
