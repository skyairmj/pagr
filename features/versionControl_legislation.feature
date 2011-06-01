@Version_control @Legislation @Ignore
Feature: Version control for Legislation 
  In order to track version information for versions of legislation 
  As entropy user 
  I want to see history version for P&S records


@140&141
    Scenario Outline: Create and approve a legislation with version control 
      Given a '<legislation>' with '<basic_info>'
      When the user with approve permission create and save a new version for this legislation with '<update_info>' and '<version_info>'
      Then the content of this new version should be '<latest_info>'
        And there should be '<history_info>' under version control tab
     Examples:
     | legislation       | basic_info		                           | update_info   | version_info   | latest_info   | history_info   |
     | legal requirement | versionControl_legislation.yml:basic_info01 | update_info01 | version_info02 | latest_info01 | history_info01 |
     | other requirement | versionControl_legislation.yml:basic_info02 | update_info02 | version_info02 | latest_info02 | history_info02 |


@140&141
	Scenario: Only latest legislation should be shown in reference edit view when there are multiple version of this legislation 
	  Given a legislation has 3 versions
	  When I create a P&S record and reference to this legislation
	  Then only the latest version of this legislation should be shown in P&S record's reference edit view

@142
	Scenario Outline: Access withdrawn version of legislation records 
      Given Clark approved 1.0 version and new a 2.0 version for a '<legislation>' record
  	  When '<user>' open this record in edit and detail view/site level report
  	  Then '<user>' should see '<corresponding_version>' 
    	And there should be a history section in detail view and site level report

    Examples:
    | legislation       | user		                              				 | corresponding_version  |
    | legal requirement | user with approve and report permission				 | both version 1.0 and 2.0 and there should be indications that it is an old version when viewing 1.0 version | 
    | other requirement | user without approve permission but report permission | only version 2.0		  | 
