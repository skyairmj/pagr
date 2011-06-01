@p&s_record
Feature: Edit P&S record 
  In order to manage a P&S record
  As entropy user 
  I want to edit a P&S record

@79 @Add_Owner
    Scenario Outline: Change owner for P&S record
	  Given Clark has "Alter" permission 
        And he created a '<status>' P&S record
      When the ownership is passed to '<other>' 
      Then Owner of the record should be '<other>'
	    And Clark should be able to edit '<other_fields>' of the P&S record
        And <other> should be able to edit '<owner_edit_fields>' of the P&S record 
     
     Examples:
     | status   | other		 | other_fields							| owner_edit_fields 					|
     | draft    | Big		 | ps_record.yml: other_fields       	| ps_record.yml: owner_edit_fields      | 
#     | draft    | Clark		 | ps_record.yml: owner_edit_fields  	| ps_record.yml: owner_edit_fields      | 
#     | approved | Big		 | ps_record.yml: other_fields  	    | ps_record.yml: owner_edit_fields      | 
#     | approved | Clark 	 | ps_record.yml: owner_edit_fields 	| ps_record.yml: owner_edit_fields      | 
#     | approved | Zhifang	 | ps_record.yml: other_fields		 	| ps_record.yml: Administer_edit_fields | 

@79 @Add_Owner
	Scenario Outline: Only Administer is able to lock/unlock a P&S record
	  Given Zhifang has "administer of quality management system" permission
	    And she created a '<status>' P&S record
	  When she edits the record
	  Then she should be able to '<lock>' the record
	
	Examples:
     | status   | lock	 | 
     | locked   | unlock |  

@109 @Delete_P&S_record @Ignore
    Scenario Outline: Owner with delete permission can delete a P&S record with proper retention date set 
    Given I am the '<user_role>' of a '<status>' P&S record
      And the retention date of the record is '<some_day>'
      And I have '<authorized>' permission
    When I delete the P&S record
    Then I should get the '<result>'

	Examples:
    | user_role  | status   | authorized | some_day  | result                  												 			 |
    | Owner      | draft    | delete  	 | yesterday | be able to delete it and related batches and the reference link should be removed |   
    | Owner      | draft    | delete  	 | today     | be able to delete it and related batches and the reference link should be removed | 
    | Owner      | draft    | delete  	 | tomorrow  | not be able to delete the record													 | 
    | Other user | approved | delete 	 | today 	 | not be able to delete the record                                            		 |   
    | Other user | draft    | alter  	 | tomorrow  | not be able to delete the record                                        			 |   
    | Owner      | approved | alter  	 | yesterday | not be able to delete the record                                            		 | 
    | Owner      | locked   | delete  	 | yesterday | not be able to delete the record                                            		 | 
    | Other user | locked   | delete  	 | today 	 | not be able to delete the record                                            		 | 


@79 @Add_Owner @Manual
	Scenario: Manual case for add owner for P&S record	
	  Given I open/update a legacy P&S record
	  Then I should see the creation user set as a default owner for this P&S record
  	  Given I create a new P&S record
	  Then I should see the creation user set as a default owner for this P&S record
	

@118 @119 @120 @Retention_Date @Ignore
	Scenario Outline: Set and search by retention date for P&S records 
	Given I have set '<retention_date>' and '<rationale>' for P&S record '<number>' 
	When I search with retention date filter from '<start_date>' to '<end_date>'
	Then I should get '<result>' for both site and corporate reports
	  And '<retention_date>' and '<rationale>' displays in the report detail view

    Examples:
	| number | retention_date  | rationale   	    | start_date 	 | end_date 	| result 			   |
	| one 	 | 11-Mar-2011     | nothing special    | 1-Mar-2011  	 | 20-Mar-2011  | record one shown     |
	| two 	 | 2-Mar-2010      | nothing special    | 3-Mar-2011  	 | 10-Mar-2011  | record two not shown |
	| three  | 15-Mar-2011     | nothing special    | 15-Mar-2011  	 | 15-Mar-2011  | record three shown   |
	| four 	 | 11-Mar-2011     | nothing special    | N/A  	 		 | 19-Mar-2011  | record four shown    |
	| five 	 | 30-Mar-2011     | nothing special    | 19-Mar-2011  	 | N/A  		| record five shown    |
	
@118 @119 @120 @Retention_Date @Manual
	Scenario: Manual case for retention date of a P&S record	
    Given I set an invalid retention date for a P&S record in edit view or search filter view
    Then I should see a pop-up window prompt the wrong format
    Given I open a legacy P&S record
    Then I should see the default retention date is not set	 

@34 @Expected_lifetime @Ignore
	Scenario Outline: Set and search by expected lifetime for P&S records 
	Given I have set '<expected_lifetime>' for P&S record '<number>'
	When I search with expected lifetime filter '<start_date>' and '<end_date>'
	Then I should get '<result>' for both site and corporate reports
	  And '<expected_lifetime>' displays in the report detail view

    Examples:
	| number | expected_lifetime                        | start_date 	                 | end_date 	                  | result |
	| QPS11  | p&s_record.yml: expected_lifetime_info01 | from 1-Mar-2011 to 31-Mar-2011 | from 1-Jun-2011 to 30-Jun-2011 | QPS11  |
	| QPS12  | p&s_record.yml: expected_lifetime_info02 | to 15-Mar-2011  	             | N/A                            | QPS12  |
	| QPS13  | p&s_record.yml: expected_lifetime_info03 | N/A  	                         | from 31-Mar-2011               | QPS13  |
	| QPS14  | p&s_record.yml: expected_lifetime_info04 | from 1-Mar-2011 to 31-Mar-2011 | from 1-Jun-2011 to 30-Jun-2011 | QPS14 not shown |
