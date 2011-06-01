class ChangeOwnerPage < Page
	def choose user
		@base.div(:text, user['Surname'][0]).click
		@base.radio(:value, /#{user['Full Name']}$/).click
		@base.button(:id, 'BtnOK').click
	end
end