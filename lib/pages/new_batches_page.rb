class NewBatchesPage <Page
	text_field :number,:name, "txtNumber"
	text_field :start_date,:name,"txtStartDate"
	text_field :completion_date,:name,"txtCompletionDate"
	text_field :labelling_info,:name,"txtLabelingInfo"
	button :btnEdit, :class, "button"
	text_field :quantity_of_product_manufactured,:name,"txtQuantity"
	text_field :product_line_used,:name,"txtProductLine"
	select_list :status,:name,"cmbStatus"
	button :btnUpdate,:name,"btnUpdate"
	button :btnNonconfNew, :value,"New" 
	
	def create record
		number.set record['Number']
		start_date.set record['Start Date']
		completion_date.set record['Completion Date']
		labelling_info.set record['Labelling Info']
		btnEdit.click
		organisations_page = open :organisation
		organisations_page.choose_organisation
		quantity_of_product_manufactured.set record['Quantity of Product Manufactured']
		product_line_used.set record['Product Line Used']
		status.set record['Status']
		btnUpdate.click
	end 
	
	#def should_content record
		#@base.text.match record[Id]+record['No']
	#end
end