class PSRecordPage < Page
	text_field :title, :name, 'txtTitle'
	span :save_close, :id, 'SAVECLOSE'
	span :save_only, :id, 'ICONSAVECLICK'
	span :owner, :id, 'tdOwner'
	button :btnUpdate, :name, 'btnUpdate'
	button :btnApprove, :name, 'btnApprove'
	button :btnChangeOwner, :name, 'btnChangeOwner'
	button :btnActionPlansNew, :xpath, "//div[@id='TabMainContents']//table[@class='section' and position()=8]//input[@type='button' and @value='New']"
	button :btnBatchesNew, :xpath, "//div[@id='TabBatchesContents']/table//input[@type='button' and @value='New']"
	button :btnRealisationPlanningEdit, :id, 'btntxtOtherObj'
	button :btnLock, :name, 'btnLock'
	button :btnUnlock, :name, 'btnUnlock'
	
	def edit record
		title.set record['Title']
		btnUpdate.click
		new_version_page = @app.open :new_version
		new_version_page.create '1.0', 'Function Test'
		wait
	end
	
	def save_and_close
		save_close.click
	end
	
	def save!
		save_only.click
		wait
	end
	
	def approve
		btnApprove.click
	end
	
	def creat_batches record
		@base.link(:id,'TabBatches').click
		@base.div(:id,'TabBatchesContents').button(:value,'New').click
		new_batches_page = open :new_batches
		new_batches_page.create record
		new_batches_page
	end
	
	def change_owner_to user
		btnChangeOwner.click
		change_owner_page = open :change_owner
		change_owner_page.choose user
	end
	
	def action_plans_editable?
		btnActionPlansNew.click
	end
	
	def batches_editable?
		btnBatchesNew.click
	end
	
	def lock!
	  btnLock.click
		wait
	end
	
	def unlock!
	  btnUnlock.click
		wait
	end
end