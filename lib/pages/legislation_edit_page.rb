class LegislationEditPage < Page
	text_field :title, :name, "txtTitle"
	button :btnUpdate, :name, "btnUpdate"
	
	def edit record
		title.set record['Title']
		btnUpdate.click
		new_version_page = @app.open :new_version
		new_version_page.create "1.0", "Function Test"
	end
end