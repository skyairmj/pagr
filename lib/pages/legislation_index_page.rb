class LegislationIndexPage < Page
	span :menu_file, :id, 'FILE'
	span :menuItem_new, :id, 'NEW'
	span :menu_goto, :id, 'GOTOCLICK'
	span :menuItem_reports, :id, 'REPORTS'
	
	def create
		menu_file.click
		menuItem_new.click
		@app.open :legislation_edit
	end
	
	def reports
		menu_goto.click
		menuItem_reports.click
		@app.open :legislation_reports
	end
end