class NewVersionPage < Page
	text_field :version_number, :name, "txtVersionNumber"
	text_field :version_description, :name, "txtVersionDescription"
	button :btnOK, :name, "BtnOK"
	def create number, description
		version_number.set number
		version_description.set description
		btnOK.click
	end
end