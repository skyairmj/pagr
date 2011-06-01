class PeopleIndexPage < Page
	def open_access_profiles_page keyword
		@base.text_field(:id, "Keyword").set(keyword)
		@base.span(:id, "MNUSEARCH").click
		@base.row(:id, "tr2001").cells[6].click
		@app.open :access_profiles
	end
end