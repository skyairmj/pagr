@Version_control @P&SRecord @Ignore
Feature: Version control for P&S records 
  In order to track version information for versions of P&S records 
  As entropy user 
  I want to see history version for P&S records


@105&106 @Version_control @P&SRecord
    Scenario Outline: Create and approve a P&S record with version control 
      Given a P&S record is in '<status>' with '<basic_info>'
      When the owner create and save a new version for this record with '<update_info>' and '<version_info>'
      Then the content of this new version should be '<latest_info>'
        And there should be '<history_info>' under version control tab
     Examples:
     | status       | basic_info		                         | update_info	 | version_info   | latest_info   | history_info   |
     | 1.0 Draft 1  | versionControl_P&SRecords.yml:basic_info01 | update_info01 | N/A            | latest_info01 | history_info01 |
     | 1.0 Approved | versionControl_P&SRecords.yml:basic_info02 | update_info02 | version_info02 | latest_info02 | history_info02 |


@105&106 @Version_control @P&SRecord
	Scenario: Only latest approved record should be shown in reference edit view when there are multiple version of this record 
	  Given a P&S record has 3 versions
	  When I create a batch and reference to this record
	  Then only the latest version of this record should be shown in batch's reference edit view
	
@105&106 @Version_control @P&SRecord @Manual
	Scenario: New version for an approved/draft P&S record
	  Given a P&S record's version is 2.0
	  When I create a new version and save it as version 3
	  Then Create and last update fields should be current time and no approved info 
	    And the previous approved version before 2.0 should be archived under version control tab
	  Given a P&S record's version is 2.0 Draft 1
	  When I create a new version and save it
	  Then Create time should be that of the first draft version 2.0 Draft 1 and no approved info 
	    And the current version should be 2.0 Draft 2	 