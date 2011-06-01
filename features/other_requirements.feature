@Other_Requirements
Feature: CRUD "Other Requirements" for legislation 
  In order to record other requirements
  As a user with "Alter" permission
  I want to create/update/delete other requirements and then be able to view them in detail reports

@100&101
    Scenario Outline: create and update batches
      Given Clark has "Alter" permission 
        And Zhifang has turned on "Other Requirements"
      When he '<edit>' other requirements with '<other_requirements_edit>'
      Then he should see '<other_requirements_preview>' in the site and corporate details reports 
     
     Examples:
     | edit   | other_requirements_edit		               				|  other_requirements_preview        |
     | create | other_requirements.yml: other_requirements_edit_info_01 | other_requirements_preview_info_01 |
#     | update | other_requirements.yml: other_requirements_edit_info_02 | other_requirements_preview_info_02 |


@100&101 @Ignore
	Scenario: delete other requirements 
	  Given I have "Delete" permission 
	    And I have created other requirements
	  When I delete the other requirements
	  Then I should not see the other requirements shown in the site and corporate details reports    

@100&101 @Manual
	Scenario: Manual case for create/delete other requirements
	  Given the Administer have turned on "Other Requirements" for certain management system
	  When user create an new other requirements
	  Then in related management system should show options for choosing between "Legal Requirement" and "Other Requirements". 
	    And Default option is "Legal Requirements".  
	    And UI need to be the same as mockup in mingle page
	    And Created and Last Updated fields should be updated and consistent with exact time
	  When user create an new other requirements without filling Title
	  Then should pop up a dialog to show indicate message
	  When user update an existed requirements
	  Then the options for choosing between "Legal Requirement" and "Other Requirements" should not be shown
	  When the Administer have turned off "Other Requirements" for certain management system
	  Then in related management system should not show options for choosing between "Legal Requirement" and "Other Requirements"
	  Given user set filers to run site and corporate report
	  When user select "Other Requirements"
	  Then the "In force?" "Legal Requirement Type" and "Include History?" fields should be disabled
	  
