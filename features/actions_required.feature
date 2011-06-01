@Actions_Required @Ignore
Feature: Add "Actions Required" for P&S records 
  In order to add a new action plan in P&S record
  As a user with "Alter" permission
  I want to use the standard Action Required functionality

@33 @Actions_Required
    Scenario Outline: add actions required 
      Given Clark have "Alter" permission for action plans in Quality management system 
        And the record is in '<status>'
      When Clark '<edit>' actions required with '<actions_required_information>'
      Then Clark should see '<list_information>' in the site and corporate details reports
        And Clark should see '<action_required_title>' of this actions required list under reference section 
     
     Examples:
     | status   | edit                         | actions_required_information		            | list_information | action_required_title |
     | draft    | add by click new button      | actions_required.yml: actions_required_info_01 | list_info_01     | list_info_01: Action  |
     | draft    | update by Reference editting | actions_required.yml: actions_required_info_01 | list_info_01 	   | list_info_01: Action  |
     | approved | add by Reference editting    | actions_required.yml: actions_required_info_02 | list_info_02	   | list_info_02: Action  |
     | approved | update click new button      | actions_required.yml: actions_required_info_02 | list_info_02	   | list_info_02: Action  |


@33 @Actions_Required 
	Scenario Outline: delete actions required 
	  Given I have "Delete" permission 
	    And I have created actions required
	  When I '<delete>' the actions required
	  Then I should not see the actions required shown in the site and corporate details reports 
	    And I should not see this actions required list under reference section 
	
	 Examples:
	 | delete                |
	 | delete from menu bar  |
	 | delete from reference |   

@33 @Actions_Required @Manual
	Scenario: Manual case for add/delete actions required
	  Given I don't have "Alter" permission for action plans in any management system 
	  When I editing a P&S record
	  Then I couldn't see the "New" button for Actions Required
	  Given I don't have "delete" permission for action plans in any management system 
	  When I editing a P&S record
	  Then delete should be disabled in both menu bar and reference inline delete  
	  Given I have "Alter/Delete" permission
	  Then UI for editing actions required need to be the same as that in non-conformance tool 
	    And value for Created and Last Updated fields should be valid
	    And if the action plans has owner functionality turned on then only the owner can change the Due Date.
        And If the action plan is completed then both the start and due dates aren't available to change.
