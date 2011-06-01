@Batches
Feature: CRUD "Batches" for P&S records 
  In order to track records that facilitate traceability and review of the manufacture of a batch of product
  As a user with "Alter" permission
  I want to create a batch and then able to view a batch record for an approved P&S record

@98&99
    Scenario Outline: create and update batches 
      Given Clark has "Alter" permission 
        And a P&S record is approved
      When he '<edit>' batches with '<batches_information>' for this P&S record
      Then he should see '<list_information>' under Batches tab 
        And he should see '<report_information>' in site details reports 
		And he should see '<report_information>' in corporate details reports
     
     Examples:
     | edit   | batches_information			 					 | list_information				 | report_information                |
     | create | batches.yml: batches_info_01 					 | list_info_01					 | report_info_01                    |
#     | create | batches.yml: batches_info_02					 | list_info_02					 | report_info_02                    |
#     | update | batches.yml: batches_info_03					 | list_info_03					 | report_info_03                    |
#     | update | batches.yml: batches_info_04					 | list_info_04					 | report_info_04                    |
#     | create | batches.yml: batches_info_01 and batches_info_02 | list_info_01 and list_info_02 | report_info_01 and report_info_02 |


@98&99 @Ignore
	Scenario Outline: delete batches 
	  Given I have "Delete" permission 
	    And I am the '<user_role>' for a P&S record with batches added
	    And the P&S record is not locked
	  When I want to delete the batch
	  Then I should '<result>'  
	
	Examples:
    | user_role  | result			 					 																     	      | 
    | Owner      | delete the batch and the batch should not display under Batches tab and in the site and corporate details reports  |   
    | Other user | not able to delete the batch                                                                                       |   

@98&99 @Manual
	Scenario: Manual case for CRUD batches
	  Given I am editing batches 
	  Then I should verify the form for creating/updating/deleting a batch record
	    And Window title should be "P&S - Batches"
	    And The title on the top of page should be "Site → Quality Management → Products and Services → Batches"
	    And The "Save & View" option should not appear in menu bar  
	    And UI need to be the same as mockup in mingle page
	    And Created and Last Updated fields
	    And if the text field exceeds 250/4000 characters, then only first 250/4000 characters should display
	
@110&111 @Non_conformances @Manual
	Scenario: Manual case for add non_conformances for batches
	  Given I am updating a batch
	  When I raised a non conformance against a batch  
	  Then the non conformance record should be shown in its References as well (two-way references)
	
@110&111 @Non_conformances @Manual	
	Scenario Outline: 
	  Given A user with Report permission is viewing nonconf's   
	  When a nonconf's is in '<status>'  	 
	  Then the traffic light for that nonconf should be in '<colour>'
	
	Examples:
    | status  														| colour | 
	| inactive 														| ORANGE |
	| active and proposed resolution date is in the past 			| RED 	 |
	| active and proposed resolution date is today or in the future | ORANGE |
