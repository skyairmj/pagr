class SystemSettingsPage < Page
	checkbox :otherReqEnable, :name, 'chkOtherReqEnable'
	checkbox :otherReqQual, :name, 'chkOtherReqQual'
	
	def enable_other_requirements
		otherReqEnable.set
		otherReqQual.set
	end
end