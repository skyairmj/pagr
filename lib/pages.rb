module Pages
	
	def open_login
		LoginPage.new self.ie
	end
	
	def open_site_choose
		popup = Watir::IE.attach(:title, /Choose a Site/)
		Watir::Wait.until {popup.ul(:id, 'siteSel1_list').lis.length>0}
		SiteChoosePage.new popup
	end
	
	def open_ps_record_index
		navigate_to_function(3, 3)
		PSRecordIndexPage.new content_frame
	end
	
	def open_ps_record
		ie2 = nil
		Watir::Wait.until { safe {ie2 = Watir::IE.attach(:title, /^Products and Services/)} }
		PSRecordPage.new ie2
	end
	
	def open_ps_record_details_report
		ie2 = nil
		Watir::Wait.until { safe {ie2 = Watir::IE.attach(:title, /^Products and Services/)} }
		PSRecordDetailsReportPage.new ie2
	end
	
	def open_ps_record_reports
		PSRecordReportsPage.new content_frame
	end
	
	def open_people_index
		navigate_to_function(4, 3)
		PeopleIndexPage.new content_frame
	end
	
	def open_access_profiles
		ie2 = Watir::IE.attach(:title, 'Access Profiles - Access Profiles')
		AccessProfilesPage.new ie2
	end
	
	def open_system_settings
		navigate_to_function(4, 0)
		SystemSettingsPage.new content_frame
	end
	
	def open_legislation_index
		navigate_to_function(3, 2)
		LegislationIndexPage.new content_frame
	end
	
	def open_legislation_edit
		ie2 = Watir::IE.attach(:title, 'Legislation')
		LegislationEditPage.new ie2
	end
	
	def open_new_version
		ie2 = Watir::IE.attach(:title, 'New Version')
		NewVersionPage.new ie2
	end
	
	def open_legislation_reports
		LegislationReportsPage.new content_frame
	end
	
	def open_legislation_details_reports
		ie2 = Watir::IE.attach(:title, 'Legislation - Register of Legislation')
		LegislationDetailsReportsPage.new ie2
	end
	
	def open_purchasing_index
		navigate_to_function(3, 6)
		PurchasingIndexPage.new content_frame
	end
	
	def open_purchasing_edit
		ie2 = Watir::IE.attach(:title, 'Purchasing')
		PurchasingEditPage.new ie2
	end
	
	def open_new_batches
		ie2 = Watir::IE.attach(:title, 'Products and Services - Batches')
		NewBatchesPage.new ie2
	end
	
	def open_organisation
		ie2 = Watir::IE.attach(:title, 'Organisation')
		OrganisationPage.new ie2	
	end
	
	def open_corporate_reports
		navigate_to_function(0, 3)
		CorporateReportsIndexPage.new content_frame
	end
	
	def open_corporate_reports_details_report
		ie2 = nil
		Watir::Wait.until { safe {ie2 = Watir::IE.attach(:title, /^Products and Services/)} }
		CorporateReportsDetailPage.new ie2		
	end
	
	def open_change_owner
	  ie2 = Watir::IE.attach(:title, 'Change Owner')
		ChangeOwnerPage.new ie2
	end
	

end