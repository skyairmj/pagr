@PSRecord @Spike
Feature: Expected Lifetime for P&S Records
	In order to know how long to retain P&S Records for
	As a user with P&S Record Edition Permission
	I want to set expected lifetime for P&S Record

	@Details @80
	Scenario Outline: P&S Record Details Report Contains expected lifetime
		Given I set expected lifetime of P&S Record '<record>' from '<start_date>' to '<end_date>'
		Then the expected lifetime of P&S record '<record>' in details report should be shown as from '<start_date>' to '<end_date>'
	Examples:
		| record     | start_Date      | end_date      |
		| 79 			   | 1-Feb-2011      | 10-Feb-2011   |
		| 80 			   | 1-Feb-2010      | 10-Feb-2011   |

	@Site @34
  Scenario Outline: P&S Records filtered by expected lifetime in Site report
		Given I set expected lifetime of P&S Record '<record>' from '<start_date>' to '<end_date>'
		When I search P&S record details report on Site from '<filter_start_date>' to '<filter_end_date>'
		Then P&S record '<record>' '<flag>' shown in the result report
  Examples:
		| record		 | start_Date      | end_date      | filter_start_date | filter_end_date | flag       |
		| 79 			   | 1-Feb-2011      | 10-Feb-2011   |  1-Feb-2011       |	1-March-2011   | should			|
		| 80 			   | 1-Feb-2010      | 10-Feb-2011   |	1-Jan-2011	  	 |	30-Jan-2011    | should not	|