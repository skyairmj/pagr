Given /^I have "([^"]*)" and "([^"]*)" permission for purchasing in Quality management system$/ do |arg1, arg2|
	@app.login data('users.yml')['Clark']
	@app.open_sub_system :management
end

When /^I add order numbers with "([^\"]*)" to a purchasing record$/ do |text|
	@purchasing_index_page = @app.open :purchasing_index
	@purchasing_edit_page = @purchasing_index_page.create
	@purchasing_edit_page.save data('purchasing.yml')['purchasing1']
	@purchasing_edit_page.add_order_number text
end

Then /^I should see "([^\"]*)" in the edit\/detail view,site level reports$/ do |text|
	@purchasing_edit_page.should have_text(text)
	@purchasing_edit_page.close
end

Given /^I have added order numbers to a purchasing record$/ do
	@purchasing_index_page = @app.open :purchasing_index
	@purchasing_edit_page = @purchasing_index_page.create
	@purchasing_edit_page.save data('purchasing.yml')['purchasing1']
	@purchasing_edit_page.add_order_number 'order number'
end

When /^I delete one order number$/ do
	@purchasing_edit_page.delete_order_number "the first numder"
end

Then /^I should not see the order number in the edit\/detail view,site level reports$/ do
	@purchasing_edit_page.should have_text('order number')
	@purchasing_edit_page.close	
end

