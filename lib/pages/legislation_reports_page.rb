class LegislationReportsPage < Page
	select_list :cmbReport, :name, 'cmbReport'
	button :btnRun, :name, 'btnRun'
	
	def choose_type report_type
		Watir::Wait.until {cmbReport.exists?}
		cmbReport.select report_type
	end
	
	def run_report
		Watir::Wait.until {btnRun.exists?}
		btnRun.click
		@app.open :legislation_details_reports
	end
end