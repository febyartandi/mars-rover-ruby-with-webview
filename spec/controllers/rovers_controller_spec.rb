require 'spec_helper'

describe RoversController, type: :controller do

  it "should render the rover index page" do
    get :index
    response.code.should == "200"
    response.should render_template("index")
  end

  it "should show the page with rover's new coordinate is 1 3 N" do
    post :move, { :plateau_corner => "5 5", :current_position => "1 2 N",
      :commands => "LMLMLMLMM" }
    response.should render_template("index")
    assigns[:rover].show_coordinates.should == "1 3 N"
  end
end
