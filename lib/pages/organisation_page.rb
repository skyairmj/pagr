class OrganisationPage < Page
	checkbox :bsi_management_systems, :xpath, "//label[@id='257']/input"
	button :btnOk,:name,"BtnOK"
	
	def choose_organisation
		bsi_management_systems.set
		btnOk.click
	end
end