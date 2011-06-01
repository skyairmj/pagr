class PSRecordIndexPage < Page
	span :menu_file, :id, 'FILE'
	span :menuItem_new, :id, 'NEW'
	span :menu_goto, :id, 'GOTOCLICK'
	span :menuItem_reports, :id, 'REPORTS'
	
	def create
		menu_file.click
		menuItem_new.click
		open :ps_record			
	end	
	
	def edit record_id
		@base.row(:id, "tr#{record_id}").cells[1].click
		open :ps_record
	end
	
	def report_details record_id
		@base.row(:id, "tr#{record_id}").cells[2].click
		open :ps_record_details_report
	end
	
	def reports	
		menu_goto.click
		menuItem_reports.click
		open :ps_record_reports
	end
	

end