Given /^a P&S record is approved$/ do
	@app.open_sub_system :management
	@ps_record_index_page = @app.open :ps_record_index
	@ps_record_page = @ps_record_index_page.create
	@ps_record_page.edit data('ps_record.yml')['ps_record_0']
	@ps_record_page.approve
end
 
When /^he 'create' batches with 'batches\.yml: batches_info_(\d+)' for this P&S record$/ do |id|
	@new_batches_page = @ps_record_page.creat_batches data('batches.yml')['batches_info_'+id.strip]
	@new_batches_page.close
end 

Then /^he should see '([^\']+)' under Batches tab$/ do |record|
	@ps_record_page.should have_text(data('batches.yml')[record.strip])	
	@ps_record_page.close
end

Then /^he should see 'report_info_(\d+)' in site details reports$/ do |id|
	@ps_record_reports_page = @ps_record_index_page.reports 
	@ps_record_reports_page.choose_type 'Register of Product and Service Requirements'
	@ps_record_reports_page.run_report
	@ps_record_details_report_page = @app.open :ps_record_details_report
	@ps_record_details_report_page.should have_text(data('batches.yml')['batches_info_'+id.strip])
	@ps_record_details_report_page.close
end

Then /^he should see 'report_info_(\d+)' in corporate details reports$/ do |id|
	@app.open_sub_system :reporting
	@corporate_reports_index_page = @app.open :corporate_reports
	@corporate_reports_index_page.choose_type 'Register of Product and Service Requirements'
	@corporate_details_report_page = @corporate_reports_index_page.run_report
	@corporate_details_report_page.should have_text(data('batches.yml')['batches_info_'+id.strip])
	@corporate_details_report_page.close
end