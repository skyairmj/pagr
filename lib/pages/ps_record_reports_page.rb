class PSRecordReportsPage < Page
	select_list :cmbReport, :name, 'cmbReport'
	button :btnRun, :name, 'btnRun'
	
	def choose_type report_type
		cmbReport.select report_type
	end
	
	def run_report
		Watir::Wait.until {btnRun.exists?}
		btnRun.click
	end
end