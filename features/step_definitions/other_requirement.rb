Given /^(\w+) has "([^\"]*)" permission$/ do |user, permission|
	@app.login data('users.yml')[user]
end

Given /^Zhifang has turned on "Other Requirements"$/ do
	@app.open_sub_system :administration
	#people_index_page = @app.open :people_index
	#access_profiles_page = people_index_page.open_access_profiles_page clark["Surname"]
	system_settings_page = @app.open :system_settings
	system_settings_page.enable_other_requirements
end

When /^he 'create' other requirements with 'other_requirements.yml: ([^\']+)'$/ do |record|
	@app.open_sub_system :management
	@legislation_index_page = @app.open :legislation_index
	legislation_edit_page = @legislation_index_page.create
	legislation_edit_page.edit data('other_requirements.yml')[record.strip]
	legislation_edit_page.close
end

Then /^he should see '([^\']+)' in the site and corporate details reports$/ do |record|
	legislation_reports_page = @legislation_index_page.reports
	legislation_reports_page.choose_type 'Register of Legislation'
	legislation_details_reports_page = legislation_reports_page.run_report
	legislation_details_reports_page.should have_text(data('other_requirements.yml')[record.strip])
	legislation_details_reports_page.close
end