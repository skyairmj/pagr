class CorporateReportsIndexPage < Page
	select_list :cmbReport, :id, "cmbReport"
	button :btnRun, :id, "Button1"
	
	def choose_type report_type
		Watir::Wait.until {cmbReport.exists?}
		cmbReport.select report_type
	end
	
	def run_report
		Watir::Wait.until {btnRun.exists?}
		btnRun.click
		open :corporate_reports_details_report
	end
end