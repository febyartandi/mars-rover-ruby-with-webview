Feature: NASA control Rover Robot on the Mars
         As NASA operator
         I want to able to control Rover Robot
         By passing string commands

         Scenario: Operator sending valid input for position and command
           Given Operator fill in the form rover setting
           When operator send command to rover
           And the new position rover should show
           
           
         Scenario: Operator sending invalid input for position and command
           Given Operator fill in the form rover setting with invalid data
           When operator send command to rover
           And the error message should show
           