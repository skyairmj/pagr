Given /^he created a 'draft' P&S record$/ do
	@app.open_sub_system :management
	@ps_record_index_page = @app.open :ps_record_index
	@ps_record_page = @ps_record_index_page.create
	@ps_record_page.edit data('ps_record.yml')['ps_record_0']
end

Given /^he created a 'approved' P&S record$/ do
  @app.open_sub_system :management
	@ps_record_index_page = @app.open :ps_record_index
	@ps_record_page = @ps_record_index_page.create
	@ps_record_page.edit data('ps_record.yml')['ps_record_0']
	@ps_record_page.approve
end

When /^the ownership is passed to '([^\']+)'$/ do |user|
	@ps_record_page.change_owner_to data('users.yml')[user]
	@ps_record_page.save!
end

Then /^Owner of the record should be '([^\']+)'$/ do |user|
  @ps_record_page.owner.text.should == data('users.yml')[user]['Full Name']
end

Then /^Clark should be able to edit 'ps_record\.yml: ([\w]+)' of the P&S record$/ do |fields|
	expected_editable_fields = data('ps_record.yml')[fields]	
	@ps_record_page.btnChangeOwner.exists?.should == false
	@ps_record_page.btnActionPlansNew.exists?.should == true
	@ps_record_page.btnBatchesNew.exists?.should == true
	@batches_page = @ps_record_page.creat_batches data('batches.yml')['batches_info_01']
	@batches_page.btnNonconfNew.exists?.should == true
#	@ps_record_page.action_plans_editable?
	@batches_page.close
	@ps_record_page.close
end

Then /^Big should be able to edit 'ps_record\.yml: ([\w]+)' of the P&S record$/ do |fields|
	@app.logout
	@app.login data('users.yml')['Big']
	@app.open_sub_system :management
	@ps_record_index_page = @app.open :ps_record_index
	@ps_record_page = @ps_record_index_page.edit 89
  expected_editable_fields = data('ps_record.yml')[fields]
	@ps_record_page.btnChangeOwner.exists?.should == true
	@ps_record_page.btnRealisationPlanningEdit.exists?.should == true
	@ps_record_page.close
end

Then /^Clark should be able to edit 'ps_record\.yml: owner_edit_fields' of the P&S record$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^Zhifang should be able to edit 'ps_record\.yml: Administer_edit_fields' of the P&S record$/ do
  pending # express the regexp above with the code you wish you had
end

Given /^she created a 'locked' P&S record$/ do
	Given "he created a 'draft' P&S record"
	@ps_record_page.lock!
end

When /^she edits the record$/ do
  #@ps_record_page.close
	#@ps_record_page = @ps_record_index_page.edit 89
end

Then /^she should be able to 'unlock' the record$/ do
	@ps_record_page.btnUnlock.exists?.should == true
	@ps_record_page.unlock!
	@ps_record_page.btnLock.exists?.should == true
	@ps_record_page.close
end