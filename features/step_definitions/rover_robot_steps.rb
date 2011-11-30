
Given /^Operator fill in the form rover setting$/ do
  visit "/"
  fill_in "upper_right_coordinates", :with => "5 5"
  fill_in "current_position[]", :with => "1 2 N"
  fill_in "move_command[]", :with => "LMLMLMLMM"
end

When /^operator send command to rover$/ do
  click_button("go_submit")
end

Then /^the new position rover should show$/ do
  page.has_content?("1 3 N")
end

Given /^Operator fill in the form rover setting with invalid data$/ do
  visit "/"
  fill_in "upper_right_coordinates", :with => "55"
  fill_in "current_position[]", :with => "1 2 X"
  fill_in "move_command[]", :with => ""
end

When /^the error message should show$/ do
  page.has_content?("Something wrong, please check your input and try again!")
end



