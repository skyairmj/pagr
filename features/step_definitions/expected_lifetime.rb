Given /^I set expected lifetime of P&S Record '(\d+)' from '([^']+)' to '([^']+)'$/ do |record, start_date, end_date|
	@app.login data('users.yml')['Clark']
	@app.open_sub_system :management
	ps_record_index_page = @app.open :ps_record_index
	ps_record_page = ps_record_index_page.edit record
	ps_record_page.save_and_close
end

Then /^the expected lifetime of P&S record '(\d+)' in details report should be shown as from '([^']+)' to '([^']+)'$/ do |record, arg2, arg3|
	ps_record_index_page = @app.open :ps_record_index
	ps_record_details_report_page = ps_record_index_page.report_details record
	ps_record_details_report_page.close
end

When /^I search P&S record details report on Site from '([^']+)' to '([^']+)'$/ do |filter_start_date, filter_end__date|
	ps_record_index_page = @app.open :ps_record_index
  ps_record_reports_page = ps_record_index_page.reports
	ps_record_reports_page.choose_type 'Register of Product and Service Requirements'
	ps_record_reports_page.run_report
end

Then /^P&S record '(\d+)' '(.+)' shown in the result report$/ do |record, flag|
  ps_record_details_report_page = @app.open :ps_record_details_report
	ps_record_details_report_page.close
end