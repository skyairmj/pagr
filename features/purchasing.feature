@Purchasing
Feature: Add "Order Numbers" for Purchasing 
  In order to trace back purchases to the system of record
  As a user with "Alter" permission
  I want to edit order numbers in a purchasing record

@39 @add
    Scenario Outline: Add Order Numbers 
      Given I have "Alter" and "Report" permission for purchasing in Quality management system 
      When I add order numbers with "<order_info>" to a purchasing record
      Then I should see "<order_info>" in the edit/detail view,site level reports
     
     Examples:
     | order_info   |  
     | Latest supplied batch of train bodies (PO 4578) had a non-conformance level of 15% due to malformed tags that are used to fix the body to the base of the train. This is entirely unacceptable. The entire consignment was rejected. The entire consignment was rejected. | 
     | number 123 <>?!@$^'+_%*& | 

@39
	Scenario: Delete Order Numbers 
	  Given I have "Alter" and "Report" permission for purchasing in Quality management system
	    And I have added order numbers to a purchasing record 
	  When I delete one order number
	  Then I should not see the order number in the edit/detail view,site level reports